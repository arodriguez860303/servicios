<?php
namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Models\Backend\T_Tramites;
use App\Http\Models\Backend\T_Tramite_Observacion;
use App\Http\Models\Frontend\T_Tramite_Documentacion;
use App\Http\Models\Frontend\T_Tramite_Constancia;
use App\Http\Models\Frontend\P_Examen_Contestaron;
use App\Http\Models\Frontend\P_Respuesta;
use App\Http\Models\Catalogos\C_Folios;
use App\Http\Classes\signedServer;
use App\Http\Classes\FormatDate;
use Auth;
use DB;

class TramitesController extends Controller
{
    private $route='tramites';
    public function __construct()
    {
        view()->share('title', 'Tramites');
        view()->share('current_route', $this->route);       
    }

    public function getResults(Request $vrequest)
     {
        // Descripción: Función para consultar todas las solicitudes
        // Creación: Viernes, 11 de Agosto de 2023
        // Versión: 1.0.0

        $vHTTPCode=200;
        $vresponse=['codigo'=>1, 'mensaje'=>'Exito', 'icono'=>'success'];
        try {
            $vfilter=array();
            switch ($vrequest->method) {
                case 'show':
                    $vresponse['respuesta']=T_Tramites::queryToDB(['id'=>$vrequest->id])->first();
                  break; 
                case 'get':
                    $filtro=array();
                    $filtro['id_status'] = $vrequest->id_status;
                    $filtro['id_usuario_r'] = Auth::User()->id;

                    $vresponse['respuesta']=T_Tramites::queryToDB($filtro)->get();
                  break;  
                case 'admin':
                    $filtro=array();                   
                    $vresponse['respuesta']=T_Tramites::queryToDB($filtro)->get();
                  break;              
                default:
                    $vresponse=['codigo'=>0, 'mensaje'=>'Lo sentimos! Metodo no definido.', 'icono'=>'warning'];
                  break;
            }
        }
        catch (Exception $vexception) {
            $vHTTPCode=500;
            $vresponse=[
                'codigo'=>-1,
                'mensaje'=>'Error en el servidor! Comuniquese con su administrador '. $vexception->getMessage(),
                'icono'=>'danger'
            ];
        }
        return response()->json($vresponse, $vHTTPCode);
     }

    public function getResultsHospital(Request $vrequest)
     {
        // Descripción: Función para consultar todas las solicitudes
        // Creación: Viernes, 11 de Agosto de 2023
        // Versión: 1.0.0

        $vHTTPCode=200;
        $vresponse=['codigo'=>1, 'mensaje'=>'Exito', 'icono'=>'success'];
        try {
            $vfilter=array();
            switch ($vrequest->method) {
                case 'show':
                    $vresponse['respuesta']=T_Tramites::queryToHospitalDB(['id'=>$vrequest->id])->first();
                  break;                
                case 'admin':
                    $filtro=array();                   
                    $vresponse['respuesta']=T_Tramites::queryToHospitalDB($filtro)->get();
                  break;              
                default:
                    $vresponse=['codigo'=>0, 'mensaje'=>'Lo sentimos! Metodo no definido.', 'icono'=>'warning'];
                  break;
            }
        }
        catch (Exception $vexception) {
            $vHTTPCode=500;
            $vresponse=[
                'codigo'=>-1,
                'mensaje'=>'Error en el servidor! Comuniquese con su administrador '. $vexception->getMessage(),
                'icono'=>'danger'
            ];
        }
        return response()->json($vresponse, $vHTTPCode);
     }

    public function datos_generales(Request $vrequest)
     {
        // Descripción: Función para consultar los datos del solicitante
        // Creación: Viernes, 11 de Agosto de 2023
        // Versión: 1.0.0

        $vHTTPCode=200;
        $vresponse=['codigo'=>1, 'mensaje'=>'Exito', 'icono'=>'success'];
        try {
            $vfilter=array();
            switch ($vrequest->method) {
                case 'show':
                    $vresponse['respuesta']=T_Tramites::queryToDetailsDB(['id_tramite'=>$vrequest->id_tramite])->first();
                  break;                             
                default:
                    $vresponse=['codigo'=>0, 'mensaje'=>'Lo sentimos! Metodo no definido.', 'icono'=>'warning'];
                  break;
            }
        }
        catch (Exception $vexception) {
            $vHTTPCode=500;
            $vresponse=[
                'codigo'=>-1,
                'mensaje'=>'Error en el servidor! Comuniquese con su administrador '. $vexception->getMessage(),
                'icono'=>'danger'
            ];
        }
        return response()->json($vresponse, $vHTTPCode);
     }

    public function datos_generales_tramite(Request $vrequest)
     {
        // Descripción: Función para consultar los datos generales del tramite
        // Creación: Viernes, 11 de Agosto de 2023
        // Versión: 1.0.0

        $vHTTPCode=200;
        $vresponse=['codigo'=>1, 'mensaje'=>'Exito', 'icono'=>'success'];
        try {
            $vfilter=array();
            switch ($vrequest->method) {
                case 'show':
                    $vresponse['respuesta']=T_Tramites::queryToGeneralesDB(['id_tramite'=>$vrequest->id_tramite])->first();
                    $observados = count(T_Tramite_Documentacion::queryToDocumentacionDB(['id_tramite'=>$vrequest->id_tramite, 'id_status_obs_solv'=>8])->get());                    
                    $tramite = T_Tramites::find($vrequest->id_tramite);
                    $vresponse['total_observados'] = $observados;
                    $vresponse['status_tramite'] = $tramite->id_status;
                  break;                             
                default:
                    $vresponse=['codigo'=>0, 'mensaje'=>'Lo sentimos! Metodo no definido.', 'icono'=>'warning'];
                  break;
            }
        }
        catch (Exception $vexception) {
            $vHTTPCode=500;
            $vresponse=[
                'codigo'=>-1,
                'mensaje'=>'Error en el servidor! Comuniquese con su administrador '. $vexception->getMessage(),
                'icono'=>'danger'
            ];
        }
        return response()->json($vresponse, $vHTTPCode);
     } 

    public function resultados_examen(Request $vrequest)
     {
        // Descripción: Función para consultar los resultados de la evaluacion
        // Creación: Martes, 15 de Agosto de 2023
        // Versión: 1.0.0

        $vHTTPCode=200;
        $vresponse=['codigo'=>1, 'mensaje'=>'Exito', 'icono'=>'success'];
        try {
            $vfilter=array();
            switch ($vrequest->method) {
                case 'show':
                    $r_incorrectas = count(P_Respuesta::getDatosExamen($data=['incorrectas'=>0, 'id_tramite'=>$vrequest->id_tramite])->get());
                    $r_correctas   = count(P_Respuesta::getDatosExamen($data=['correctas'=>1, 'id_tramite'=>$vrequest->id_tramite])->get());
                  
                    $r_total= $r_incorrectas + $r_correctas;
                    $porcentaje = 0; 
                    if($r_total > 0)
                        $porcentaje = ($r_correctas * 100) / $r_total;

                    $vresponse['incorrectas'] =$r_incorrectas;
                    $vresponse['correctas']   =$r_correctas;
                    $vresponse['total']       =$r_total;
                    $vresponse['porcentaje']  =$porcentaje;                   
                  break;                             
                default:
                    $vresponse=['codigo'=>0, 'mensaje'=>'Lo sentimos! Metodo no definido.', 'icono'=>'warning'];
                  break;
            }
        }
        catch (Exception $vexception) {
            $vHTTPCode=500;
            $vresponse=[
                'codigo'=>-1,
                'mensaje'=>'Error en el servidor! Comuniquese con su administrador '. $vexception->getMessage(),
                'icono'=>'danger'
            ];
        }
        return response()->json($vresponse, $vHTTPCode);
     }

    public function datos_documentacion(Request $vrequest)
     {
        // Descripción: Función para consultar los documentos de un tramite
        // Creación: Viernes, 14 de Agosto de 2023
        // Versión: 1.0.0

        $vHTTPCode=200;
        $vresponse=['codigo'=>1, 'mensaje'=>'Exito', 'icono'=>'success'];
        try {
            $vfilter=array();
            switch ($vrequest->method) {
                case 'show':
                    $vresponse['respuesta']=T_Tramite_Documentacion::queryToDB(['id'=>$vrequest->id])->first();
                  break; 
                case 'get':
                    $filtro=array();
                    $filtro['id_tramite']   = $vrequest->id_tramite;
                    $filtro['solventacion'] = 0;

                    $vresponse['respuesta']=T_Tramite_Documentacion::queryToDocumentacionDB($filtro)->get();
                  break;               
                default:
                    $vresponse=['codigo'=>0, 'mensaje'=>'Lo sentimos! Metodo no definido.', 'icono'=>'warning'];
                  break;
            }
        }
        catch (Exception $vexception) {
            $vHTTPCode=500;
            $vresponse=[
                'codigo'=>-1,
                'mensaje'=>'Error en el servidor! Comuniquese con su administrador '. $vexception->getMessage(),
                'icono'=>'danger'
            ];
        }
        return response()->json($vresponse, $vHTTPCode);
     }

    public function getObservaciones(Request $vrequest)
     {
        // Descripción: Función para consultar las observaciones de un tramite
        // Creación: Viernes, 14 de Agosto de 2023
        // Versión: 1.0.0

        $vHTTPCode=200;
        $vresponse=['codigo'=>1, 'mensaje'=>'Exito', 'icono'=>'success'];
        try {
            $vfilter=array();
            switch ($vrequest->method) {
                case 'show':
                    $vresponse['respuesta']=T_Tramite_Observacion::queryToDB(['id'=>$vrequest->id])->first();
                  break; 
                case 'get':
                    $filtro=array();
                    $filtro['id_tramite'] = $vrequest->id_tramite;

                    $vresponse['respuesta']=T_Tramite_Observacion::queryToDB($filtro)->get();
                  break;               
                default:
                    $vresponse=['codigo'=>0, 'mensaje'=>'Lo sentimos! Metodo no definido.', 'icono'=>'warning'];
                  break;
            }
        }
        catch (Exception $vexception) {
            $vHTTPCode=500;
            $vresponse=[
                'codigo'=>-1,
                'mensaje'=>'Error en el servidor! Comuniquese con su administrador '. $vexception->getMessage(),
                'icono'=>'danger'
            ];
        }
        return response()->json($vresponse, $vHTTPCode);
     }

    public function index_proceso() 
    {
        return view('backend.tramites.proceso.index');
    }

    public function index_observado() 
    {
        return view('backend.tramites.observado.index');
    }

    public function index_solventado() 
    {
        return view('backend.tramites.solventado.index');
    }

    public function index_aceptado() 
    {
        return view('backend.tramites.aceptados.index');
    }

    public function index_concluido() 
    {
        return view('backend.tramites.concluidos.index');
    }

    public function index_cancelado() 
    {
        return view('backend.tramites.cancelados.index');
    }

    public function show($id) 
    {
        $dato = T_Tramites::find($id);
        return view('backend.tramites.show', ['id_status'=>$dato->id_status, 'id_tramite' => $id]);
    }

    public function download_adjunto($id)
    {
        $datos = T_Tramite_Documentacion::find($id);
        $path= storage_path().'/app/'.$datos->ruta.'/';
        $file= $path.$datos->documento;

        return response()->download($file);
    }

    public function agregar_observacion(Request $vrequest)
    {
        $vstatusHTTP=201;
        $vresponse=['icono'=>'warning', 'codigo'=> 0, 'mensaje'=> 'No se pudieron insertar los datos, intente de nuevo.'];
    
        try{
                DB::beginTransaction();
                    $vflobservacion= new T_Tramite_Observacion;
                    $vflDocumentoTramite = T_Tramite_Documentacion::find($vrequest->input('id_documento_tramite'));

                    $post["id_tramite"]           = $vrequest->input('_tramite');
                    $post["id_c_documento"]       = $vrequest->input('id_c_documento');
                    $post["id_tramite_documento"] = $vrequest->input('id_documento_tramite');
                    $post["id_usuario_observo"]   = Auth::User()->id;
                    $post["observacion"]          = $vrequest->input('txtObservacion');
                    
                    $vflobservacion->fill($post)->save();

                    $postDocumentoTramite['id_status'] = 8;
                    $vflDocumentoTramite->fill($postDocumentoTramite)->save();

                    unset($vflobservacion, $vflDocumentoTramite);

                    $vresponse=['icono'=>'success', 'codigo'=> 1, 'mensaje'=> 'La observacion fue agregada satisfactoriamente.'];
                DB::commit();
            }
        catch ( Exception $e ) {
            DB::rollback();
            $vstatusHTTP=500;
            $vrespuesta=[
                'icono'=>'danger', 
                'codigo'=> -1, 
                'message'=> 'Error en el servidor, verifiquelo con el administrador, '. $vexception->getMessage()
            ];
        }
        return response()->json($vresponse, $vstatusHTTP, [], JSON_HEX_APOS|JSON_HEX_QUOT);
    }

    public function enviar_observaciones($id_tramite)    
    {
        $vstatusHTTP=201;
        $vresponse=['icono'=>'warning', 'codigo'=> 0, 'mensaje'=> 'No se pudieron insertar los datos, intente de nuevo.', 'url'=> ''];
        $vroute_redirect = "";

        try {
                DB::beginTransaction();

                    $t_tramite = T_Tramites::find($id_tramite);
                    $post['id_status']=8;
                    $t_tramite->fill($post)->save();

                    unset($t_tramite);

                    $vresponse=['icono'=>'success', 'codigo'=> 1, 'mensaje'=> 'Las observaciones fueron enviadas satisfactoriamente.','url'=> route($this->route.'.observados')];

                DB::commit();
            }
            catch ( Exception $e ) {
                DB::rollback();
                $vstatusHTTP=500;
                $vrespuesta=[
                    'icono'=>'danger', 
                    'codigo'=> -1, 
                    'message'=> 'Error en el servidor, verifiquelo con el administrador, '. $vexception->getMessage()
                ];
            }
        
        return response()->json($vresponse, $vstatusHTTP, [], JSON_HEX_APOS|JSON_HEX_QUOT);
    }

    public function aceptar_documento(Request $vrequest)
    {
        $id_documento_tramite = $vrequest->id_documento_tramite;

        $vstatusHTTP=201;
        $vresponse=['icono'=>'warning', 'codigo'=> 0, 'mensaje'=> 'No se pudieron insertar los datos, intente de nuevo.'];
        $status=0;

        try{
                DB::beginTransaction();

                $vflDocumento      = T_Tramite_Documentacion::find($id_documento_tramite);
                $post["id_status"] = 10;
                $vflDocumento->fill($post)->save();


                $total = count(T_Tramite_Documentacion::queryToDocumentacionDB(['id_tramite'=>$vflDocumento->id_tramite, 'id_status'=>10])->get());
                if($total == 4)
                {
                    $tramite = T_Tramites::find($vflDocumento->id_tramite);
                    $postTramite['id_status'] = 10;
                    $tramite->fill($postTramite)->save();

                    $status = $tramite->id_status;
                    
                    unset($t_tramite);
                }

                unset($vflDocumento);

                $vresponse=['icono'=>'success', 'codigo'=> 1, 'mensaje'=> 'El documento fue aceptado satisfactoriamente.', 'status_tramite'=>$status];
                DB::commit();
            }
        catch ( Exception $e ) {
            DB::rollback();
            $vstatusHTTP=500;
            $vrespuesta=[
                'icono'=>'danger', 
                'codigo'=> -1, 
                'message'=> 'Error en el servidor, verifiquelo con el administrador, '. $vexception->getMessage()
            ];
        }
        return response()->json($vresponse, $vstatusHTTP, [], JSON_HEX_APOS|JSON_HEX_QUOT);
    }

    public function getSolventaciones(Request $vrequest)
    {
        // Descripción: Función para consultar las solventaciones de un tramite
        // Creación: Viernes, 14 de Agosto de 2023
        // Versión: 1.0.0

        $vHTTPCode=200;
        $vresponse=['codigo'=>1, 'mensaje'=>'Exito', 'icono'=>'success'];
        try {
            $vfilter=array();
            switch ($vrequest->method) {
                case 'show':
                    $vresponse['respuesta']=T_Tramite_Observacion::queryToDB(['id'=>$vrequest->id])->first();
                  break; 
                case 'get':
                    $filtro=array();
                    $filtro['id_tramite'] = $vrequest->id_tramite;

                    $vresponse['respuesta']=T_Tramite_Observacion::queryToSolventacionesDB($filtro)->get();
                  break;               
                default:
                    $vresponse=['codigo'=>0, 'mensaje'=>'Lo sentimos! Metodo no definido.', 'icono'=>'warning'];
                  break;
            }
        }
        catch (Exception $vexception) {
            $vHTTPCode=500;
            $vresponse=[
                'codigo'=>-1,
                'mensaje'=>'Error en el servidor! Comuniquese con su administrador '. $vexception->getMessage(),
                'icono'=>'danger'
            ];
        }
        return response()->json($vresponse, $vHTTPCode);
    }

    public function aceptar_solventacion(Request $vrequest)
    {
        $id_observacion = $vrequest->id_observacion;

        $vstatusHTTP=201;
        $vresponse=['icono'=>'warning', 'codigo'=> 0, 'mensaje'=> 'No se pudieron insertar los datos, intente de nuevo.'];
    
        try{
                DB::beginTransaction();

                $vflObservacion = T_Tramite_Observacion::find($id_observacion);
                $postObs["aceptado"] = 10;
                $vflObservacion->fill($postObs)->save();

                $vflDocumento      = T_Tramite_Documentacion::find($vflObservacion->id_tramite_documento);
                $post["id_status"] = 9;
                $vflDocumento->fill($post)->save();

                //Cuento cuantos solventaciones fueron aceptadas
                $obs = count(T_Tramite_Observacion::queryToDB(['id_tramite'=>$vflObservacion->id_tramite])->get());
                $aceptados = count(T_Tramite_Observacion::queryToDB(['id_tramite'=>$vflObservacion->id_tramite, 'aceptado'=>10])->get());

                if($aceptados == $obs)
                {
                    $tramite = T_Tramites::find($vflObservacion->id_tramite);
                    $postTramite['id_status'] = 10;
                    $tramite->fill($postTramite)->save();
                    unset($t_tramite);
                }
                unset($vflObservacion, $vflDocumento, $obs, $aceptados);

                $vresponse=['icono'=>'success', 'codigo'=> 1, 'mensaje'=> 'La solventacion fue aceptada satisfactoriamente.'];
                DB::commit();
            }
        catch ( Exception $e ) {
            DB::rollback();
            $vstatusHTTP=500;
            $vrespuesta=[
                'icono'=>'danger', 
                'codigo'=> -1, 
                'message'=> 'Error en el servidor, verifiquelo con el administrador, '. $vexception->getMessage()
            ];
        }
        return response()->json($vresponse, $vstatusHTTP, [], JSON_HEX_APOS|JSON_HEX_QUOT);
    }

    public function negar_solventacion(Request $vrequest)
    {
        $id_observacion = $vrequest->id_observacion;

        $vstatusHTTP=201;
        $vresponse=['icono'=>'warning', 'codigo'=> 0, 'mensaje'=> 'No se pudieron insertar los datos, intente de nuevo.'];
    
        try{
                DB::beginTransaction();

                $vflObservacion = T_Tramite_Observacion::find($id_observacion);
                $postObs["aceptado"] = 4;
                $vflObservacion->fill($postObs)->save();

                $vflDocumento      = T_Tramite_Documentacion::find($vflObservacion->id_tramite_documento);
                $post["id_status"] = 9;
                $vflDocumento->fill($post)->save();

                unset($vflObservacion, $vflDocumento);

                $vresponse=['icono'=>'success', 'codigo'=> 1, 'mensaje'=> 'La solventacion fue negada satisfactoriamente.'];
                DB::commit();
            }
        catch ( Exception $e ) {
            DB::rollback();
            $vstatusHTTP=500;
            $vrespuesta=[
                'icono'=>'danger', 
                'codigo'=> -1, 
                'message'=> 'Error en el servidor, verifiquelo con el administrador, '. $vexception->getMessage()
            ];
        }
        return response()->json($vresponse, $vstatusHTTP, [], JSON_HEX_APOS|JSON_HEX_QUOT);
    }

    /*El bueno*/
    // public function concluir(Request $vrequest)
    // {
    //     $vstatusHTTP=201;
    //     $vresponse=['icono'=>'warning', 'codigo'=> 0, 'mensaje'=> 'No se pudieron insertar los datos, intente de nuevo.', 'url'=> ''];
    //     $vroute_redirect = "";
    //     $id_tramite = $vrequest->id_tramite;

    //     //buscar un folio para asignar
    //     $vfiltro=array();
    //     $vfiltro['ocupado']=0;
    //     $vfiltro['anio']=date('Y');
    //     $busca_folio = C_Folios::search($vfiltro)->first();
 
    //     if(!isset($busca_folio))
    //     {
    //         $vresponse=['icono'=>'warning', 'codigo'=> 0, 'mensaje'=> 'No hay folios disponibles para asignar.', 'url'=> ''];
    //     }        
    //     else
    //     {
    //         $tramite = T_Tramites::findOrFail($id_tramite);
    //         $post['id_status']=3;
    //         $post['fecha_fin']=date("Y-m-d H:i:s");
    //         $post['folio']=$busca_folio->folio;

    //         $token = signedServer::generarTokenConstancias();

    //         if($token['status']==200)
    //         {
    //             $empresa = T_Tramites::getRazonSocial($id_tramite);
    //             $vdatosXML=array();
    //             $vdatosXML['folio']= $post['folio']."/".date('dmYHms')."/".date("Y");
    //             $vdatosXML['fecha_creacion'] = date("Y-m-d")."T".date("H:m:s");
    //             $vdatosXML['receptor'] = $empresa->razon_social_o_nombre;
    //             $vdatosXML['cuerpo'] = "De conformidad con el Artículo 199,  de la Ley General de Salud, Artículo 1° del Reglamento de Control Sanitario de Productos y Servicios; Artículo 138 fracción VI de la Ley Estatal de Salud  del Estado de Chiapas; Artículo 43 fracción VII, de la Ley Estatal de Derechos del Estado de Chiapas por la expedición de la Constancia de Cursos de Capacitación por Asistente, para el Manejo Higiénico de los Alimentos, se autoriza la presente: C O N S T A N C I A CLAVE0801006 ".$empresa->razon_social_o_nombre. " Tuxtla Gutiérrez, Chiapas,".FormatDate::longDateFormat_day($empresa->fecha_fin)."(Vigencia de un año a partir de la fecha de expedición) ESTA CONSTANCIA NO ES VÁLIDA SI PRESENTA FOTO SOBREPUESTA, ENMENDADURAS,  TACHADURAS O EVIDENCIA DE ALTERACIÓN. NO SE EMITEN DUPLICADOS.";

    //             //si el token se genero satisfactoriamente procedo a generar el documento XML
    //             $fileXML= signedServer::generarCadenaXML(base64_encode(json_encode($vdatosXML)));

    //             //procedo a obtener la cadena original
    //             $stringOriginal = signedServer::generarCadenaOriginal($token['body'], $fileXML);

    //             //valido que la cadena original se haya creado satisfactoriamente
    //             if($stringOriginal->original['status_code']==200 && $stringOriginal->original['code']==1)
    //             {
    //                 //procedo a hacer el firmado del documento
    //                 $firmado = signedServer::firmardoServidor($stringOriginal->original['cadenaOriginal'], $token['body']);

    //                 if($firmado->original['codeResponse']=="00")
    //                 {
    //                     //si el firmado fue correcto procedo a sellar el xml
    //                     $vdatosFirmado=array();
    //                     $vdatosFirmado['signedDateResponse'] = $firmado->original['respuestaFirmado']->signedDateResponse;
    //                     $vdatosFirmado['serieCertificate'] = $firmado->original['respuestaFirmado']->serieCertificate;
    //                     $vdatosFirmado['signature'] = $firmado->original['respuestaFirmado']->signature;
    //                     $vdatosFirmado['certificatePem'] = $firmado->original['respuestaFirmado']->certificatePem;

    //                     $XMLFirmado = signedServer::generarCadenaXML(base64_encode(json_encode($vdatosXML)), $firmado->original['respuestaFirmado']->signature, $vdatosFirmado);

    //                     $sellarXML = signedServer::sellarXML($token['body'], $XMLFirmado);

    //                     //si fue exito guardo los datos
    //                     if((int)$sellarXML->original['code']==1)
    //                     {
    //                         //datos de la firma electronica
    //                         $post['firma']                 = $firmado->original['respuestaFirmado']->signature;
    //                         $post['no_serie_firma']        = $firmado->original['respuestaFirmado']->serieCertificate;
    //                         $post['fecha_firma']           = $firmado->original['respuestaFirmado']->signedDateResponse;
    //                         $post['secuencia_firma']       = $firmado->original['respuestaFirmado']->sequenceResponse;
    //                         $post['uuid']                  = $sellarXML->original['selladoXML']->uuid;
    //                         $post['cadena_sello']          = $sellarXML->original['selladoXML']->cadenaSello;
    //                         $post['fecha_sellado']         = $sellarXML->original['selladoXML']->fecha_Sellado;
    //                         $post['xml']                   = $sellarXML->original['selladoXML']->xml;
    //                         $post['folio_documento_firma'] = $vdatosXML['folio'];
    //                         $post['responsable_firma']     = "Dr. Limber del Carmen García Zapata";

    //                         $post_folio['ocupado']=1;
    //                         $post_folio['id_tramite']=$id_tramite;

    //                         try {
    //                                 DB::beginTransaction();

    //                                     $tramite->fill($post)->save();
    //                                     $busca_folio->fill($post_folio)->save();

    //                                     unset($t_tramite, $busca_folio);

    //                                     $vresponse=['icono'=>'success', 'codigo'=> 1, 'mensaje'=> 'El trámite concluyo satisfactoriamente.','url'=> route($this->route.'.concluidos')];

    //                                 DB::commit();
    //                             }
    //                         catch ( Exception $e ) {
    //                                 DB::rollback();
    //                                 $vstatusHTTP=500;
    //                                 $vrespuesta=[
    //                                     'icono'=>'danger', 
    //                                     'codigo'=> -1, 
    //                                     'message'=> 'Error en el servidor, verifiquelo con el administrador, '. $vexception->getMessage()
    //                                 ];
    //                             }
    //                     }
    //                 }
    //                 else
    //                 {
    //                     $code=400;
    //                     $msg="Problemas con el certificado del firmante"; 
    //                     $tipo_alert = "danger";
    //                     $status= 3;
    //                 }
    //             }
    //             else
    //             {
    //                 $code=400;
    //                 $msg="Ocurrio un error al intentar leer el XML"; 
    //                 $tipo_alert = "danger";
    //                 $status= 3;
    //             }

    //         }
    //         else
    //         {
    //             $code=$token['status'];
    //             $msg="Ocurrio un error al intentar generar el token"; 
    //             $tipo_alert = "danger";
    //             $status= 3;                
    //         }
    //     }
        
    //     return response()->json($vresponse, $vstatusHTTP, [], JSON_HEX_APOS|JSON_HEX_QUOT);
    // }
    /*Hasta aqui*/
    public function concluir(Request $vrequest)
    {
        $vstatusHTTP=201;
        $vresponse=['icono'=>'warning', 'codigo'=> 0, 'mensaje'=> 'No se pudieron insertar los datos, intente de nuevo.', 'url'=> ''];
        $vroute_redirect = "";
        $id_tramite = $vrequest->id_tramite;

        //buscar un folio para asignar
        $vfiltro=array();
        $vfiltro['ocupado']=0;
        //$vfiltro['anio']=date('Y');
        $busca_folio = C_Folios::search($vfiltro)->first();
 
        if(!isset($busca_folio))
        {
            $vresponse=['icono'=>'warning', 'codigo'=> 0, 'mensaje'=> 'No hay folios disponibles para asignar.', 'url'=> ''];
        }        
        else
        {
            $tramite = T_Tramites::findOrFail($id_tramite);
            $post['id_status']=3;
            $post['fecha_fin']=date("Y-m-d H:i:s");
            $post['folio']=$busca_folio->folio;

            $post_folio['ocupado']=1;
            $post_folio['id_tramite']=$id_tramite;

            try {
                DB::beginTransaction();

                    $tramite->fill($post)->save();
                    $busca_folio->fill($post_folio)->save();

                    unset($t_tramite, $busca_folio);

                    $vresponse=['icono'=>'success', 'codigo'=> 1, 'mensaje'=> 'El trámite concluyo satisfactoriamente.','url'=> route($this->route.'.concluidos')];

                DB::commit();
            }
            catch ( Exception $e ) {
                DB::rollback();
                $vstatusHTTP=500;
                $vrespuesta=[
                    'icono'=>'danger', 
                    'codigo'=> -1, 
                    'message'=> 'Error en el servidor, verifiquelo con el administrador, '. $vexception->getMessage()
                ];
            }

            
        }
        
        return response()->json($vresponse, $vstatusHTTP, [], JSON_HEX_APOS|JSON_HEX_QUOT);
    }

    public function cancelar(Request $vrequest)
    {
        $vstatusHTTP=201;
        $vresponse=['icono'=>'warning', 'codigo'=> 0, 'mensaje'=> 'No se pudieron insertar los datos, intente de nuevo.', 'url'=> ''];
        $vroute_redirect = "";
        $id_tramite = $vrequest->id_tramite;

        $tramite = T_Tramites::find($id_tramite);
        $post['id_status']=7;

        // //busco si hubieron observaciones
        // $observaciones = T_Tramite_Observacion::queryToAllDB(['id_tramite'=>$id_tramite])->get();

        // //busco los documentos
        // $documentos = T_Tramite_Documentacion::queryToDB(['id_tramite'=>$id_tramite])->get();

        // //busco constancia
        // $constancia = T_Tramite_Constancia::queryToSearchDB(['id_tramite'=>$id_tramite])->first();

        // //busco el examen
        // $examen = P_Examen_Contestaron::queryToSearchDB(['id_tramite'=>$id_tramite])->first();

        try {
                DB::beginTransaction();

                    // //si hay mas de una observacion se eliminan
                    // if(count($observaciones) > 0)
                    // {
                    //     foreach ($observaciones as $value) {
                    //         $obs = T_Tramite_Observacion::find($value->id);
                    //         $obs->delete();
                    //         unset($obs);
                    //     }
                    // }

                    // //si hay mas de un documento se eliminan
                    // if(count($documentos) > 0)
                    // {
                    //     foreach ($documentos as $value) {
                    //         $doc = T_Tramite_Documentacion::find($value->id);
                    //         $doc->delete();
                    //         unset($doc);
                    //     }
                    // }

                    // //Verifico si hay constancia
                    // if (!empty($constancia))
                    // {
                    //     $constancia->delete();
                    //     unset($constancia);
                    // }

                    // //Verifico si hay un examen
                    // if (!empty($examen))
                    // {
                    //     $examen->delete();                        

                    //     $respuestas = P_Respuesta::queryToDB(['id_examen_contestaron'=>$examen->id])->get();

                    //     if(count($respuestas) > 0)
                    //     {
                    //         foreach ($respuestas as $value) {
                    //             $res = P_Respuesta::find($value->id);
                    //             $res->delete();
                    //             unset($res);
                    //         }
                    //     }
                    //     unset($examen, $respuestas);
                    // }

                    $tramite->fill($post)->save();                    
                    unset($t_tramite);

                    $vresponse=['icono'=>'success', 'codigo'=> 1, 'mensaje'=> 'El trámite fue cancelado satisfactoriamente.','url'=> route($this->route.'.cancelados')];

                DB::commit();
            }
        catch ( Exception $e ) 
            {
                DB::rollback();
                $vstatusHTTP=500;
                $vrespuesta=[
                    'icono'=>'danger', 
                    'codigo'=> -1, 
                    'message'=> 'Error en el servidor, verifiquelo con el administrador, '. $vexception->getMessage()
                ];
            }

        return response()->json($vresponse, $vstatusHTTP, [], JSON_HEX_APOS|JSON_HEX_QUOT);
    } 
}