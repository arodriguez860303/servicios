<?php
namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Models\Frontend\T_Tramite;
use App\Http\Models\Frontend\T_Tramite_Documentacion;
use App\Http\Models\Backend\T_Registro;
use App\Http\Models\Backend\T_Tramite_Observacion;
use App\Http\Classes\Imprimir;
use App\Http\Classes\ImprimirHospital;
use App\Http\Classes\FormatDate;
use QrCode;
use Auth;
use DB;

use Illuminate\Support\Facades\Crypt;

class ImpresionController extends Controller
{
	public function print_constancia($id_tramite)
    {       
		$tramite  = T_Tramite::findOrFail($id_tramite);
		$persona  = T_Registro::dtsGenerales(['id_registro'=>$tramite->id_registro])->first();		
		$imprimir = new Imprimir;		
		$foto     = T_Tramite_Documentacion::setFoto($tramite->id);  
        $avatar="";

        //verifico si la foto fue observada
        if($foto->id_status == 9)
        {
            $fotoSolventada = T_Tramite_Observacion::queryToFotoSolventadaDB(['id_tramite' => $id_tramite, 'id_tramite_documento' => $foto->id])->first();
            $avatar = $fotoSolventada->ruta ."/".$fotoSolventada->documento;
        }
        else if($foto->id_status == 2 || $foto->id_status == 10)
        {
            $avatar = $foto->ruta ."/".$foto->documento;
        }

		$anio_creacion = FormatDate::anio($tramite->created_at,1);
		$cliente       = $persona->razon_social_o_nombre;
		
        $html='';
        
        $html.='<br><br><p class="text-justify">De conformidad con el Artículo 199,  de la Ley General de Salud, Artículo 1° del Reglamento de Control Sanitario de Productos y Servicios; Artículo 138 fracción VI de la Ley Estatal de Salud  del Estado de Chiapas; Artículo 43 fracción VII, de la Ley Estatal de Derechos del Estado de Chiapas por la expedición de la Constancia de Cursos de Capacitación por Asistente, para el Manejo Higiénico de los Alimentos, se autoriza la presente:</p>';

        $html.='<table class="punteado" ALIGN="right">';           
            $html.='<thead>';           
                $html.='<tr>';
                if(isset($tramite->folio))        
                    $html.='<th>Folio: '.$tramite->folio.'</th>';
                else
                    $html.='<th>Folio: 00000</th>';
                $html.='</tr>';           
            $html.='</thead>';           
        $html.='</table>';


        $html.='<br><br><br><br><h2 class="text_grande">CLAVE0801006</h2>';

        $foto_cliente = storage_path()."/app". $avatar; 
        
        $logo_agua = public_path()."/img/banners/marca_agua.png"; 
        
        $html.='<table width="100%">';           
            $html.='<thead>';           
                $html.='<tr>';           
                    $html.='<th style="text-align:center;" width="20%">';           
                        $html.='<img src='.$foto_cliente.' width="20%" />';
                    $html.='</th>';    
                $html.='</tr>';
                $html.='<tr>';
                    $html.='<th style="padding-left:20px;" width="80%">';           
                        $html.='<h2>A: <u>'.$cliente.'</u></h2>';
                    $html.='</th>';       
                $html.='</tr>';           
            $html.='</thead>';           
        $html.='</table>';

        if(isset($tramite->responsable_firma))
        {
        	$html.='<p class="text_medio"><b>'.$tramite->responsable_firma.'</b><br>
        	Director de Protección contra Riesgos Sanitarios</p>';

        	$html.='<p class="text_fecha">Tuxtla Gutiérrez, Chiapas, '.FormatDate::longDateFormat_day($tramite->fecha_fin).'<br>
                (Vigencia de un año a partir de la fecha de expedición)
                </p>';
    	}
    	else
    	{
    		$html.='<p class="text_medio"><b>Dr. Limber del Carmen García Zapata</b><br>
        	Director de Protección contra Riesgos Sanitarios</p>';

        	$html.='<p class="text_fecha">Tuxtla Gutiérrez, Chiapas, pendiente fecha<br>
                (Vigencia de un año a partir de la fecha de expedición)
                </p>';
    	}        

        return $imprimir->constancia($html, $mode='I', $tramite->id);
    }

    public function print_diploma_hospital($id_tramite)
     {
        $imprimir = new ImprimirHospital;
        $tramite  = T_Tramite::findOrFail($id_tramite);
        $persona  = T_Registro::dtsGenerales(['id_registro'=>$tramite->id_registro])->first();
        $cliente       = $persona->razon_social_o_nombre;

        $fechaDiploma = FormatDate::longDateFormat_day($tramite->created_at,1);

        $foto     = T_Tramite_Documentacion::setFotoHospital($tramite->id);  
        $avatar="";

        //$cadenaQR = 'https://tramites.saludchiapas.gob.mx/tramites-hospital/diploma/'. Crypt::encrypt($id_tramite).'/validar';        
        $cadenaQR = 'https://apps.shyfpchiapas.gob.mx/servicios-dipris/tramites-hospital/diploma/'. Crypt::encrypt($id_tramite).'/validar';        
      
        //genero el qr
        $png = QrCode::format('svg')
                ->encoding('utf-8')
                ->color(97,17,50)
                ->backgroundColor(238,238,245)
                ->generate($cadenaQR);
        $png = base64_encode($png);
        $cod_QR='<img src="data:image/svg;base64,'. $png .'" width="100px" height="100px">';

        //verifico si la foto fue observada
        if($foto->id_status == 9)
        {
            $fotoSolventada = T_Tramite_Observacion::queryToFotoSolventadaDB(['id_tramite' => $id_tramite, 'id_tramite_documento' => $foto->id])->first();
            $avatar = $fotoSolventada->ruta ."/".$fotoSolventada->documento;
        }
        else if($foto->id_status == 2 || $foto->id_status == 10)
        {
            $avatar = $foto->ruta ."/".$foto->documento;
        }

        $html='';

        if(isset($tramite->folio))        
            $html.='<h3 style="text-align:right; color:#072631;">'. $tramite->folio .'</h3>';
        else
            $html.='<h3 style="text-align:right; color:#072631;">000000</h3>';        

        $html.='<p style="text-align: right;"><br><br><br>'. $cod_QR .'</p>';

        $foto_cliente = storage_path()."/app". $avatar;

        $html.='<br><br><table width="78%" style="margin-left: 350px;">';           
            $html.='<thead>';           
                $html.='<tr>';           
                    $html.='<th style="text-align:center;vertical-align:middle;" width="20%">';           
                        $html.='<img src='.$foto_cliente.' width="10%" />';
                    $html.='</th>';    
             
                    $html.='<th style="vertical-align:bottom;" width="80%">';           
                        $html.='<h3>'.$cliente.'</h3>';
                    $html.='</th>';       
                $html.='</tr>';           
            $html.='</thead>';           
        $html.='</table>';

        $html.='<br><br><br><br><br><br><br><br><br><br><table width="85%" style="margin-left: 350px;">';           
            $html.='<thead>';           
                $html.='<tr>';           
                    $html.='<th style="text-align:center;" width="60%">';           
                        $html.='<h3>Dr. Limber del Carmen García Zapata</h3>';
                    $html.='</th>';    
             
                    $html.='<th style="vertical-align:bottom;" width="40%">';           
                        $html.='<h4>'. $fechaDiploma .'</h4>';
                    $html.='</th>';       
                $html.='</tr>';           
            $html.='</thead>';           
        $html.='</table>';

        return $imprimir->diploma($html, $mode='I', $tramite->id_status);
     }
}