<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Classes\FormatDate;
use App\Http\Classes\Imprimir;
use App\Http\Models\Backend\T_Tramites;
use App\Http\Models\Catalogos\C_Municipios;
use QrCode;

class ReportesController extends Controller
{
    public function __construct() {
        $this->middleware('auth');
    }

    public function index() 
    { 
      return view('reportes.index');
    } 

    public function opciones(Request $vrequest)
    {
        $json = [];
        $post = $vrequest->all();

        $tipo_reporte = $post['tipo'];

        if($tipo_reporte == 1)
        {
            $json['anio']= $post['anio']; 
            $this->general($json);           
        }
        else if($tipo_reporte == 2)
        {
            $json['f_inicio'] = FormatDate::formatDates($post['fecha_inicio'], 0);
            $json['f_fin']    = FormatDate::formatDates($post['fecha_fin'], 0);
            $this->municipios($json);
        }
        else if($tipo_reporte == 3)
        {
            $json['f_inicio'] = FormatDate::formatDates($post['fecha_inicio'], 0);
            $json['f_fin']    = FormatDate::formatDates($post['fecha_fin'], 0);
            $json['id_municipio']    = $post['id_municipio'];
            $this->detallado($json);
        }
    }

    public function general($json)
    {
        $datos = T_Tramites::queryToCountRptDB($json)->get();
        $total= count($datos);
        $anio = $json['anio'];

        //obtengo la ruta de la hoja de estilo que se ocupara
        $ruta_css= public_path()."/css/estilo.css";

        $nombre_pdf='Reporte general.pdf';

        $cadenaQR="Secretaría de Salud - Dirección de Protección contra Riesgos Sanitarios";
        //genero el qr
        $png = QrCode::format('svg')->encoding('utf-8')->size(100)->color(97,17,50)->generate($cadenaQR);
        $png = base64_encode($png);
        $cod_QR='<img src="data:image/svg;base64,'. $png .'" width="70px" height="70px">';

        $encabezado='Secretaría de Salud <br>  Dirección de Protección contra Riesgos Sanitarios';

        //cuerpo html
        $html='';  

        $html.='<p class="encabezado_docto"><b>A '. FormatDate::fecha_para_memos(date('Y-m-d H:i:s'), 1) .' </b> <br> Tuxtla Gutiérrez, Chiapas.<br><b>Asunto.- Reporte General</b></p>';

        $html.='<table id="general-table" class="general-table">';
        $html.='    <caption class="caption">Constancias generadas en el año '.$anio.', desglosado por meses</caption>';
        $html.='    <thead>';
        $html.='        <tr>';
        $html.='            <th>Clave</th>';
        $html.='            <th>Municipio</th>';
        $html.='            <th>Enero</th>';
        $html.='            <th>Febrero</th>';
        $html.='            <th>Marzo</th>';
        $html.='            <th>Abril</th>';
        $html.='            <th>Mayo</th>';
        $html.='            <th>Junio</th>';
        $html.='            <th>Julio</th>';
        $html.='            <th>Agosto</th>';
        $html.='            <th>Septiembre</th>';
        $html.='            <th>Octubre</th>';
        $html.='            <th>Noviembre</th>';
        $html.='            <th>Diciembre</th>';
        $html.='            <th>Total</th>';
        $html.='        </tr>';
        $html.='    </thead>';

        $html.='    <tbody>';
        $i=0;
        $css_total="";
        foreach ($datos as $d) {
            $i++;
            if($i==$total)
                $css_total="bg-total";

        $html.='        <tr>';
        if($i!=$total)
        $html.='            <td>'.$d->clave.'</td>';
        else
        $html.='            <td colspan="2" class="td_total '.$css_total.'">Gran total</td>';

        if($i!=$total){
            $html.='            <td>'.$d->municipio.'</td>';
        }
                
        $html.='            <td class="center_td '.$css_total.'">'.$d->Enero.'</td>';
        $html.='            <td class="center_td '.$css_total.'">'.$d->Febrero.'</td>';
        $html.='            <td class="center_td '.$css_total.'">'.$d->Marzo.'</td>';
        $html.='            <td class="center_td '.$css_total.'">'.$d->Abril.'</td>';
        $html.='            <td class="center_td '.$css_total.'">'.$d->Mayo.'</td>';
        $html.='            <td class="center_td '.$css_total.'">'.$d->Junio.'</td>';
        $html.='            <td class="center_td '.$css_total.'">'.$d->Julio.'</td>';
        $html.='            <td class="center_td '.$css_total.'">'.$d->Agosto.'</td>';
        $html.='            <td class="center_td '.$css_total.'">'.$d->Septiembre.'</td>';
        $html.='            <td class="center_td '.$css_total.'">'.$d->Octubre.'</td>';
        $html.='            <td class="center_td '.$css_total.'">'.$d->Noviembre.'</td>';
        $html.='            <td class="center_td '.$css_total.'">'.$d->Diciembre.'</td>';
        $html.='            <td class="center_td '.$css_total.' bg-total">'.$d->total.'</td>';

        $html.='        </tr>';
        }
        
        $html.='    </tbody>';
        $html.='</table>';

        return Imprimir::printFormat($html, $ruta_css, $nombre_pdf, $cod_QR, $encabezado);
    } 

    public function municipios($json)
    {
        $datos = T_Tramites::queryToEstadisticaMpioDB($json)->get();
        $total= count($datos);
        $inicio = FormatDate::longDateFormat_day($json['f_inicio'],1);
        $fin = FormatDate::longDateFormat_day($json['f_fin'],1);

        //obtengo la ruta de la hoja de estilo que se ocupara
        $ruta_css= public_path()."/css/estilo.css";

        $nombre_pdf='Reporte de municipios.pdf';

        $cadenaQR="Secretaría de Salud - Dirección de Protección contra Riesgos Sanitarios";
        //genero el qr
        $png = QrCode::format('svg')->encoding('utf-8')->size(100)->color(97,17,50)->generate($cadenaQR);
        $png = base64_encode($png);
        $cod_QR='<img src="data:image/svg;base64,'. $png .'" width="70px" height="70px">';

        $encabezado='Secretaría de Salud <br>  Dirección de Protección contra Riesgos Sanitarios';

        //cuerpo html
        $html='';  

        $html.='<p class="encabezado_docto"><b>A '. FormatDate::fecha_para_memos(date('Y-m-d H:i:s'), 1) .' </b> <br> Tuxtla Gutiérrez, Chiapas.<br><b>Asunto.- Reporte por municipios</b></p>';    

        $html.='<table class="timecard">';
        $html.='  <tbody>';    
        $html.='    <tr>';
        $html.='      <th><b>De fecha</b></th>';
        $html.='      <th>'.$inicio.'</th>'; 
        $html.='    </tr>';
        $html.='    <tr>';
        $html.='      <th><b>A fecha</b></th>';
        $html.='      <th>'.$fin.'</th>'; 
        $html.='    </tr>';   
        $html.='    <tr>';
        $html.='      <th><b>Municipios</b></th>';
        $html.='      <th>'.($total-1).'</th>'; 
        $html.='    </tr>'; 
        $html.='  </tbody>';       
        $html.='</table><br>';

        $html.='<table id="municipio-table" class="municipio-table center_table">';      
        $html.='    <thead>';
        $html.='        <tr>';
        $html.='            <th>No.</th>';
        $html.='            <th>Region</th>';
        $html.='            <th>Municipio</th>';
        $html.='            <th>Total</th>';
        $html.='        </tr>';
        $html.='    </thead>';

        $html.='    <tbody>';
        $i=0;
        $css_total="";
        foreach ($datos as $d) {
            $i++;
            if($i==$total)
                $css_total="bg-total";

        $html.='        <tr>';
        if($i!=$total)
        $html.='            <td>'.$d->clave_region.'</td>';
        else
        $html.='            <td colspan="3" class="td_total '.$css_total.'">Gran total</td>';

        if($i!=$total){
            $html.='            <td>'.$d->region.'</td>';
            $html.='            <td>'.$d->municipio.'</td>';
        }               
        
        $html.='            <td class="center_td '.$css_total.' bg-total">'.$d->total.'</td>';
        $html.='        </tr>';
        }
        
        $html.='    </tbody>';
        $html.='</table>';


        Imprimir::printFormatVertical($html, $ruta_css, $nombre_pdf, $cod_QR, $encabezado);
    }

    public function detallado($json)
    {        
        $datos_detalle = T_Tramites::queryToDetailMpio($json)->get();
        $total= count($datos_detalle);

        $inicio = FormatDate::longDateFormat_day($json['f_inicio'],1);
        $fin = FormatDate::longDateFormat_day($json['f_fin'],1);
        $municipio = C_Municipios::find($json['id_municipio']);
        $mun="";

        if(isset($municipio->nombre))
            $mun = $municipio->nombre;

        //obtengo la ruta de la hoja de estilo que se ocupara
        $ruta_css= public_path()."/css/estilo.css";

        $nombre_pdf='Reporte general.pdf';

        $cadenaQR="Secretaría de Salud - Dirección de Protección contra Riesgos Sanitarios";
        //genero el qr
        $png = QrCode::format('svg')->encoding('utf-8')->size(100)->color(97,17,50)->generate($cadenaQR);
        $png = base64_encode($png);
        $cod_QR='<img src="data:image/svg;base64,'. $png .'" width="70px" height="70px">';

        $encabezado='Secretaría de Salud <br>  Dirección de Protección contra Riesgos Sanitarios';

        //cuerpo html
        $html='';  

        $html.='<p class="encabezado_docto"><b>A '. FormatDate::fecha_para_memos(date('Y-m-d H:i:s'), 1) .' </b> <br> Tuxtla Gutiérrez, Chiapas.<br><b>Asunto.- Reporte detallado por municipio</b></p>';    


        $html.='<table class="timecard">';
        $html.='  <tbody>';
        $html.='    <tr>';
        $html.='      <th><b>Municipio</b></th>';
        $html.='      <th>'.$mun.'</th>'; 
        $html.='    </tr>';
        $html.='    <tr>';
        $html.='      <th><b>De fecha</b></th>';
        $html.='      <th>'.$inicio.'</th>'; 
        $html.='    </tr>';
        $html.='    <tr>';
        $html.='      <th><b>A fecha</b></th>';
        $html.='      <th>'.$fin.'</th>'; 
        $html.='    </tr>';
        $html.='    <tr>';
        $html.='      <th><b>Total</b></th>';
        $html.='      <th>'.$total.'</th>'; 
        $html.='    </tr>';
   
        $html.='  </tbody>';       
        $html.='</table><br>';

        $html.='<table id="general-table" class="general-table center_table">';
        $html.='    <thead>';
        $html.='        <tr>';
        $html.='            <th>No.</th>';
        $html.='            <th>Folio</th>';
        $html.='            <th>CURP</th>';
        $html.='            <th>Solicitante</th>';
        $html.='            <th>Folio pago</th>';
        $html.='            <th>Inicio</th>';
        $html.='            <th>Fin</th>';
        $html.='            <th>Situación</th>';  
        $html.='        </tr>';
        $html.='    </thead>';

        $html.=' <tbody>'; 
        $i=0;
       
        foreach ($datos_detalle as $d) {
            $f_inicio=""; $f_fin=""; $f_envio="";

            $i++;
            if(isset($d->fecha_inicio))
              $f_inicio=FormatDate::dia_mes_anio($d->fecha_inicio, 1);
            if(isset($d->fecha_fin))
              $f_fin=FormatDate::dia_mes_anio($d->fecha_fin, 1);
 

            $html.='    <tr>';
            $html.='    <td>'.$i.'</td>';
            if(isset($d->folio))
                $html.='    <td>'.$d->folio.'</td>';      
            else
                $html.='    <td>Sin asignar</td>';
                $html.='    <td>'.$d->curp.'</td>';      
                $html.='    <td>'.$d->razon_social_o_nombre.'</td>';
                $html.='    <td>'.$d->folio_hacienda.'</td>';
                $html.='    <td>'.$f_inicio.'</td>';
                $html.='    <td>'.$f_fin.'</td>';
                $html.='    <td>'.$d->status.'</td>';
                $html.='    </tr>';       
        }
        
        $html.='  </tbody>';       
        $html.='</table>';


        Imprimir::printFormatVertical($html, $ruta_css, $nombre_pdf, $cod_QR, $encabezado);

    }
}
