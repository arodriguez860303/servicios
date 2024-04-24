<?php
namespace App\Http\Classes;
use Illuminate\Support\Facades\Http;

class signedServer
{ 	
    //Se obtiene el token de validacion
    public static function generarTokenConstancias()
    {
        $varrayXMLCadenaValidar=array();
        //$varrayXMLCadenaValidar['nombre']='FirmaElectronica';
        //$varrayXMLCadenaValidar['key']='19106D6F-E91F-4C20-83F1-1700B9EBD553';
        $varrayXMLCadenaValidar['nombre']='DIPRIS_SALUD';
        $varrayXMLCadenaValidar['key']='B388F68D-02F3-4F5D-90FA-2DCF5C8EA7F8';
        //$vstatusHTTP=201;
        $vrespuesta=array();

        //url prueba: https://interopera.chiapas.gob.mx/gobid/api/Auth/TokenAppAuth
        //url produccion: https://interopera.chiapas.gob.mx/gobid/api/AppAuth/AppTokenAuth

        $vhttpClient=Http::withBody(json_encode($varrayXMLCadenaValidar), "application/json")->post('https://interopera.chiapas.gob.mx/gobid/api/AppAuth/AppTokenAuth');       
        $vrespuesta['body'] = $vhttpClient->body();
        $vrespuesta['status'] = $vhttpClient->status();         

        return $vrespuesta;  
    }


    //Se construye el XML del documento a firmar
    public static function generarCadenaXML($cadenaBase64, $cadenaConFirma=false, $vdatosFirmado=[])
    {        
        $cadenaBase64TextoPlano=base64_decode($cadenaBase64);
        $cadenaJSONTextoPlano=json_decode($cadenaBase64TextoPlano, true);
        $cuerpo=$cadenaJSONTextoPlano['cuerpo'];

        $XMLString ='';
        $XMLString.='<DocumentoChis ';
        $XMLString.=' version="2.0" ';
        $XMLString.=' fecha_creacion="'.$cadenaJSONTextoPlano['fecha_creacion'].'" ';
        $XMLString.=' no_oficio="'. $cadenaJSONTextoPlano['folio'] .'" ';
        $XMLString.=' dependencia_origen="Dirección de Protección Contra Riesgos Sanitarios" ';
        $XMLString.=' asunto_docto="Constancia de Manejo Higienico de Alimentos" ';
        $XMLString.=' tipo_docto="CNS" xmlns="http://firmaelectronica.chiapas.gob.mx/GCD/DoctoGCD"> ';
        $XMLString.='   <emisor nombre_emisor="Dr Limber del Carmen García Zapata"';
        $XMLString.='       cargo_emisor="Director"';
        $XMLString.='       dependencia_emisor="Dirección de Protección Contra Riesgos Sanitarios" />';
        $XMLString.='   <receptores>';
        $XMLString.='       <receptor nombre_receptor="'. $cadenaJSONTextoPlano['receptor'] .'" cargo_receptor="Sin asignar" dependencia_receptor="Sin asignar" tipo_receptor="JDP" />';
        $XMLString.='   </receptores>';
        $XMLString.='   <archivo';
        $XMLString.='       nombre_archivo="constancia.pdf"';

        if ( $cadenaConFirma ) {
            $XMLString.='   md5_archivo="'. md5($cuerpo) .'"';
        }
        
        $XMLString.='   >';
        $XMLString.='       <cuerpo>'. $cuerpo .'</cuerpo>';
        $XMLString.='   </archivo> ';
        $XMLString.='   <firmantes num_firmantes="1">';
        //$XMLString.='       <firmante curp_firmante="PRPL860823HCSRPS03"';
        //$XMLString.='           nombre_firmante="Luis Alberto Perez Lopez"';
        //$XMLString.='           email_firmante="pruebabeto@ictichiapas.gob.mx"';
        $XMLString.='       <firmante curp_firmante="GAZL770816HTCRPM02"';
        $XMLString.='           nombre_firmante="Limber del Carmen Garcia Zapata"';
        $XMLString.='           email_firmante="gazlim77@hotmail.com"';
        
        if ( $cadenaConFirma ) {
            $XMLString.='       fecha_firmado_firmante="'. $vdatosFirmado['signedDateResponse']  .'"';
            $XMLString.='       no_serie_firmante="'. $vdatosFirmado['serieCertificate'] .'"';
            $XMLString.='       firma_firmante="'. $vdatosFirmado['signature'] .'"';
            $XMLString.='       certificado="'. $vdatosFirmado['certificatePem'] .'"';
        }

        $XMLString.='           tipo_firmante="FM" />';
        $XMLString.='   </firmantes>';
        $XMLString.='</DocumentoChis>';

        return $XMLString;
    }

    //Crear la cadena original del documento utilizando el método CadenaOriginalBase64 que se usará en como 
    //parámetro de envío del método SIGN para el firmado JS
    public static function generarCadenaOriginal($_token, $cadenaXMLBase64)
    {
        # Funcion: Metodo de firmado electrónica al token
        # Parametros: _token Bearer
        # Return:

        #  -1 Error de servidor
        #   0 Error de proceso
        #   1 Exito
        
        #Url prueba: https://apiprueba.firma.chiapas.gob.mx/FEA/v2/Tools/generar_cadena_original
        #Url produccion: https://api.firma.chiapas.gob.mx/FEA/v2/Tools/generar_cadena_original

        $vstatusGeneral=0;
        $vstatusHTTP=200;
        $vrespuesta=array();
        try {

            if ( isset($_token) && !empty($_token) ) {
                $varrayXMLCadenaValidar=array();
                $varrayXMLCadenaValidar['xml_OriginalBase64']=base64_encode($cadenaXMLBase64);

                $vhttpClient=Http::withBody(json_encode($varrayXMLCadenaValidar), "application/json")
                                ->withToken($_token)
                                ->post('https://api.firma.chiapas.gob.mx/FEA/v2/Tools/generar_cadena_original');   

                $respuestaCadenaOriginal=$vhttpClient->object();
                if(isset($respuestaCadenaOriginal) && !empty($respuestaCadenaOriginal)) {

                    if ($vhttpClient->status() == 200 ){                    
                        $vstatusGeneral=1;
                        $vrespuesta['cadenaOriginal']=$respuestaCadenaOriginal->cadenaOriginal;
                    }
                }           
            }
        }
        catch ( Exception $vexception ) {
            $vstatusGeneral=-1;
            $vstatusHTTP=500;
        }

        $vrespuesta['code']=$vstatusGeneral;
        $vrespuesta['status_code'] = $vstatusHTTP;

        return response()->json($vrespuesta, $vstatusHTTP, [], JSON_HEX_APOS|JSON_HEX_QUOT);         
    }

    public static function firmardoServidor($cadenaOriginal, $_token)
    {
        #Url prueba: https://apiprueba.firma.chiapas.gob.mx/FEA/v2/FirmadoElectronico/firmado_servidor
        #Url produccion: https://api.firma.chiapas.gob.mx/FEA/v2/FirmadoElectronico/firmado_servidor

     	$vstatusGeneral=0;
     	$vstatusHTTP=200;
     	$vrespuesta=array();
     	try {
	        $varrayXMLCadenaValidar=array();
	        $varrayXMLCadenaValidar['cadena']=$cadenaOriginal;
	        $varrayXMLCadenaValidar['asunto']='Constancia de Manejo Higienico de Alimentos';
	        /*$varrayXMLCadenaValidar['firmante']='PRPL860823HCSRPS03';
	        $varrayXMLCadenaValidar['sistema']=22;
	        $varrayXMLCadenaValidar['pass']='12345678a';*/
            $varrayXMLCadenaValidar['firmante']='GAZL770816HTCRPM02';
            $varrayXMLCadenaValidar['sistema']=71;
            $varrayXMLCadenaValidar['pass']='DIPRIS.2022*.$';

	        $vhttpClient=Http::withBody(json_encode($varrayXMLCadenaValidar), "application/json")
	                        ->withToken($_token)
                            ->post('https://api.firma.chiapas.gob.mx/FEA/v2/FirmadoElectronico/firmado_servidor');

	        $respuestaFirmado=$vhttpClient->object();  	        

	        if ( $respuestaFirmado->messageResponse->codeResponse == '00') {
	        	$vrespuesta['respuestaFirmado']=$respuestaFirmado->signatureResponse;
                $vrespuesta['codeResponse']=$respuestaFirmado->messageResponse->codeResponse;
	        	$vstatusGeneral=1;
	            // self::sellarXML($_token, $respuestaFirmado->signatureResponse);
	        }
            else
            {
                $vrespuesta['codeResponse'] =  $respuestaFirmado->messageResponse->codeResponse;                
            }
	    }
     	catch ( Exception $vexception ) {
     		$vstatusGeneral=-1;
     		$vstatusHTTP=500;
     	}
     	$vrespuesta['code']=$vstatusGeneral;
     	return response()->json($vrespuesta, $vstatusHTTP, [], JSON_HEX_APOS|JSON_HEX_QUOT); 
        
    }

	public static function sellarXML($_token, $vdatosFirmado)
    {
        #Url prueba: https://apiprueba.firma.chiapas.gob.mx/FEA/v2/NotariaXML/sellarXML
        #Url produccion: https://api.firma.chiapas.gob.mx/FEA/v2/NotariaXML/sellarXML

     	$vstatusGeneral=0;
     	$vstatusHTTP=200;
     	$vrespuesta=array();
     	try {
	        $varrayXMLCadenaValidar=array();
	        $varrayXMLCadenaValidar['xmL_Firmado']=base64_encode($vdatosFirmado);

	        $vhttpClient=Http::withBody(json_encode($varrayXMLCadenaValidar), "application/json")
	                        ->withToken($_token)
                            ->post('https://api.firma.chiapas.gob.mx/FEA/v2/NotariaXML/sellarXML');

	        $respuestaFirmado=$vhttpClient->object();
	        $vrespuesta['selladoXML']=$respuestaFirmado;
	        if ( (int)$respuestaFirmado->status == 1 ) $vstatusGeneral=1;
        }
     	catch ( Exception $vexception ) {
     		$vstatusGeneral=-1;
     		$vstatusHTTP=500;
     	}
     	$vrespuesta['code']=$vstatusGeneral;
     	return response()->json($vrespuesta, $vstatusHTTP, [], JSON_HEX_APOS|JSON_HEX_QUOT);
     }   
 }