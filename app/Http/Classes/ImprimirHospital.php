<?php
namespace App\Http\Classes;

use QrCode;
use App\Http\Models\Backend\T_Tramites;
use Illuminate\Support\Facades\Crypt;

class ImprimirHospital{

    private $right_logo;
    private $left_logo;

    public function __construct()
    {
        $this->m_agua= public_path()."/img/banners/diploma.png";
        $this->m_agua_previo= public_path()."/img/banners/diploma_previo.png";
    }

    public function diploma($contenido, $mode, $status) {
          $mpdf = new \Mpdf\Mpdf([
            'tempDir' => public_path()."/pdf/tmp",
            'margin_left' => 13,
            'margin_right' => 15,
            'margin_top' => 30,
            'margin_bottom' => 30,
            //'margin_header' => 10,
            'margin_footer' => 13,
            'format' => 'Letter-L'
        ]);

        $html= $contenido;

        $stylesheet = file_get_contents(public_path()."/css/print.css");                
        $mpdf->SetProtection(array('print'));
        $mpdf->SetTitle("DIPRIS. ");
        $mpdf->SetAuthor("Dirección de Protección contra Riesgos Sanitarios");


        if($status==3)
            $mpdf->SetWatermarkImage($this->m_agua);
        else
            $mpdf->SetWatermarkImage($this->m_agua_previo);
        $mpdf->showWatermarkImage = true;
        $mpdf->watermarkImageAlpha = 1;
        $mpdf->watermarkImgBehind = true;

        $mpdf->SetDisplayMode('fullpage');
        $mpdf->SetHTMLFooter($this->pie_diploma());
        $mpdf->WriteHTML($stylesheet,1);
        $mpdf->WriteHTML($html);
        
        $pdf= $mpdf->Output("Diploma de salud.pdf", $mode);

        if($mode=='I'){ $pdf= $pdf->setContentType('application/pdf'); }
        return $pdf;
    }

    private function pie_diploma() {
        $html='';     
        $html.='<table width="100%">';           
            $html.='<thead>';           
                $html.='<tr>';    
                    $html.='<th width="30%"></th>';
                    $html.='<th width="70%" style="font-size: 10px; color:#072631;"><i>ESTE RECONOCIMIENTO NO ES VÁLIDO SI PRESENTA FOTO SOBREPUESTA, ENMENDADURAS,  TACHADURAS O EVIDENCIA DE ALTERACIÓN. NO SE EMITEN DUPLICADOS.</i></th>';
                $html.='</tr>';           
            $html.='</thead>';           
        $html.='</table>';
        return $html;
    }
}
?>
