<?php
namespace App\Http\Classes;

use QrCode;
use App\Http\Models\Backend\T_Tramites;
use Illuminate\Support\Facades\Crypt;

class Imprimir{

    private $right_logo;
    private $left_logo;

    public function __construct()
    {
        //$this->left_logo= public_path()."/img/logos/logo_salud_federal.jpg";
        //$this->right_logo= public_path()."/img/logos/logo_salud.png";
        $this->m_agua= public_path()."/img/banners/marca_agua.png";
    }

    public function constancia($contenido, $mode, $id_tramite) {
          $mpdf = new \Mpdf\Mpdf([
            'tempDir' => public_path()."/pdf/tmp",
            'margin_left' => 15,
            'margin_right' => 15,
            'margin_top' => 30,
            'margin_bottom' => 30,
            //'margin_header' => 10,
            'margin_footer' => 12,
            'format' => 'Letter'
        ]);

        $html= $contenido;

        $stylesheet = file_get_contents(public_path()."/css/print.css");                
        $mpdf->SetProtection(array('print'));
        $mpdf->SetTitle("DIPRIS. - Constancia");
        $mpdf->SetAuthor("Dirección de Protección contra Riesgos Sanitarios");

        $mpdf->SetWatermarkImage($this->m_agua);
        $mpdf->showWatermarkImage = true;
        $mpdf->watermarkImageAlpha = 1;
        $mpdf->watermarkImgBehind = true;

        $mpdf->SetDisplayMode('fullpage');
        $mpdf->SetHTMLFooter($this->pie_constancia($id_tramite));
        $mpdf->WriteHTML($stylesheet,1);
        $mpdf->WriteHTML($html);
        
        $pdf= $mpdf->Output("Constancia de salud.pdf", $mode);

        if($mode=='I'){ $pdf= $pdf->setContentType('application/pdf'); }
        return $pdf;
    }

    private function pie_constancia($id_tramite) {
        $html='';
        $cadenaQR = 'https://tramites.saludchiapas.gob.mx/tramites/constancia/'. Crypt::encrypt($id_tramite).'/validar';        
        $tramite = T_Tramites::find($id_tramite);

        //genero el qr
        $png = QrCode::format('svg')
                ->encoding('utf-8')
                ->color(97,17,50)
                ->backgroundColor(238,238,245)
                ->generate($cadenaQR);
        $png = base64_encode($png);
        $cod_QR='<img src="data:image/svg;base64,'. $png .'" width="100px" height="100px">';


        if($tramite->firma!= null)
        {        
            $html.='<table width="100%">';           
                    $html.='<tr>'; 
                        $html.='<th width="18%"></th>';
                        
                        $html.='<th style="text-align: left; font-size:9px;"><span class="span_aqua">Serie:</span> <b>'. $tramite->no_serie_firma.'</b> | <span class="span_aqua">Secuencia: </span><b>'. $tramite->secuencia_firma.'</b> | <span class="span_aqua">Fecha: </span><b>'. $tramite->fecha_firma.'</b> | <span class="span_aqua">Firmante: </span>'.$tramite->responsable_firma.'<br>'.substr($tramite->firma, 0, 90).'<br />' .substr($tramite->firma, 90, 90).'<br />' .substr($tramite->firma, 180, 90).'</th>';     
                        $html.='<th>'.$cod_QR.'</th>';                                 
                    $html.='</tr>';           
            $html.='</table>';  
        }        


        $html.='<table width="100%">';           
            $html.='<thead>';           
                $html.='<tr>';    
                    $html.='<th width="30%"></th>';
                    $html.='<th width="70%" style="font-size: 10px;"><i>ESTA CONSTANCIA NO ES VÁLIDA SI PRESENTA FOTO SOBREPUESTA, ENMENDADURAS,  TACHADURAS O EVIDENCIA DE ALTERACIÓN. NO SE EMITEN DUPLICADOS.</i></th>';
                $html.='</tr>';           
            $html.='</thead>';           
        $html.='</table>';
        return $html;
    }

    public static function printFormat($contenido, $style, $nombre_pdf, $QR, $encabezado)
    {
        //logotipos
        $vimagenIzquierda=public_path()."/img/logos/logo_salud.png";
      
        //estructura del reporte
        $html = '
            <html>
                <head>
                </head>
            <body>
            <!--mpdf
            <htmlpageheader name="myheader">
                <table width="100%">
                    <tr> 
                        <td width="25%" style="vertical-align: middle;">
                            <img src='.$vimagenIzquierda.' width="20%" />
                        </td>

                        <td width="30%" style="text-align: center; font-weight: bold; font-size: 20px; color: #333333;" >
                            '.$encabezado.'
                        </td>  
                        <td width="20%"></td>                     
                    </tr>
                </table>
            </htmlpageheader>

            <htmlpagefooter name="myfooter">
                <table style="background-color:#333333; color:#fff; margin-left:-80px; font-size:10px;">
                    <tr>
                        <td width="14%"></td>
                        <td width="71%">Calle 12A. Pte. Nte. 232, El Magueyito, 29000 Tuxtla Gutiérrez, Chis.<br>Teléfono: (961) 611 1185 <br>https://saludchiapas.gob.mx</td>
                        <td style=" background-color:#fff; text-align:center; color:#baab6e;" width="15%">'.$QR.'</td>
                    </tr>
                </table>
            </htmlpagefooter>


            <sethtmlpageheader name="myheader" value="on" show-this-page="1" />
            <sethtmlpagefooter name="myfooter" value="on" />
            mpdf-->

            <!----------------------------------->
            <!--Aca va el contenido del reporte-->'.
                $contenido
            .'<!--Termina el contenido del reporte-->
            <!------------------------------------>
            </body>
            </html>';

        $mpdf = new \Mpdf\Mpdf([
            //margen izquierdo
            'margin_left' => 20,
            //margen derecho
            'margin_right' => 15,
            //margen superior
            'margin_top' => 40,
            //margen inferior
            'margin_bottom' => 29,
            //margen del encabezado
            'margin_header' => 10,
            //margen del pie de pagina
            'margin_footer' => 10,
            //establece el tipo de hoja
            'format' => 'Legal-L'
        ]);
        $mpdf->SetProtection(array('print'));
        $mpdf->SetTitle("DIPRIS. - Constancia");
        $mpdf->SetAuthor("Dirección de Protección contra Riesgos Sanitarios");        
        $mpdf->SetDisplayMode('fullpage');
        $stylesheet = file_get_contents($style); // la ruta a tu css
        $mpdf->WriteHTML($stylesheet,1);
        $mpdf->WriteHTML($html,2);
        $mpdf->Output($nombre_pdf, 'I');
    }

     public static function printFormatVertical($contenido, $style, $nombre_pdf, $QR, $encabezado)
    {
        //logotipos
        $vimagenIzquierda=public_path()."/img/logos/logo_salud.png";
      
        //estructura del reporte
        $html = '
            <html>
                <head>
                </head>
            <body>
            <!--mpdf
            <htmlpageheader name="myheader">
                <table width="100%">
                    <tr> 
                        <td width="25%" style="vertical-align: middle;">
                            <img src='.$vimagenIzquierda.' width="20%" />
                        </td>

                        <td width="30%" style="text-align: center; font-weight: bold; font-size: 20px; color: #333333;" >
                            '.$encabezado.'
                        </td>  
                        <td width="20%"></td>                     
                    </tr>
                </table>
            </htmlpageheader>

            <htmlpagefooter name="myfooter">
                <table style="background-color:#333333; color:#fff; margin-left:-80px; font-size:10px;">
                    <tr>
                        <td width="14%"></td>
                        <td width="71%">Calle 12A. Pte. Nte. 232, El Magueyito, 29000 Tuxtla Gutiérrez, Chis.<br>Teléfono: (961) 611 1185 <br>https://saludchiapas.gob.mx</td>
                        <td style=" background-color:#fff; text-align:center; color:#baab6e;" width="15%">'.$QR.'</td>
                    </tr>
                </table>
            </htmlpagefooter>


            <sethtmlpageheader name="myheader" value="on" show-this-page="1" />
            <sethtmlpagefooter name="myfooter" value="on" />
            mpdf-->

            <!----------------------------------->
            <!--Aca va el contenido del reporte-->'.
                $contenido
            .'<!--Termina el contenido del reporte-->
            <!------------------------------------>
            </body>
            </html>';

        $mpdf = new \Mpdf\Mpdf([
            //margen izquierdo
            'margin_left' => 20,
            //margen derecho
            'margin_right' => 15,
            //margen superior
            'margin_top' => 40,
            //margen inferior
            'margin_bottom' => 29,
            //margen del encabezado
            'margin_header' => 10,
            //margen del pie de pagina
            'margin_footer' => 10,
            //establece el tipo de hoja
            'format' => 'Letter'
        ]);
        $mpdf->SetProtection(array('print'));
        $mpdf->SetTitle("DIPRIS. - Constancia");
        $mpdf->SetAuthor("Dirección de Protección contra Riesgos Sanitarios");        
        $mpdf->SetDisplayMode('fullpage');
        $stylesheet = file_get_contents($style); // la ruta a tu css
        $mpdf->WriteHTML($stylesheet,1);
        $mpdf->WriteHTML($html,2);
        $mpdf->Output($nombre_pdf, 'I');
    }
}
?>
