<?php
namespace App\Http\Classes;
use PHPMailer\PHPMailer;
class Correo
{
    public static function sendEmail($vdatosEnviarEmail, $status, $attachment=null)
    {
        $mail=new PHPMailer\PHPMailer(true);
        try {
            $mail->isSMTP();
            $mail->SMTPOptions = array (
                'ssl' => array (
                    'verify_peer' => false,
                    'verify_peer_name' => false,
                    'allow_self_signed' => true
                )
            );
            //$mail->SMTPDebug = false;
            $mail->CharSet="utf-8";
            $mail->SMTPAuth=true;
            $mail->SMTPSecure="tls";
            $mail->Host="smtp-mail.outlook.com"; // host gmail
            $mail->Port=587; // port gmail			
			
			$mail->Username="diprisinf@hotmail.com";
            $mail->Password="Info2022";
            $mail->setFrom("diprisinf@hotmail.com", "DIPRIS");
			
            $mail->Subject=$vdatosEnviarEmail['asunto'];
            $mail->MsgHTML($vdatosEnviarEmail['cuerpo']);
            if($status==1) {
                foreach($vdatosEnviarEmail['correo_destinatario'] as $correo) {
                    $mail->addAddress($correo, $vdatosEnviarEmail['nombre_destinatario']);
                } 
            }
            else {
                $mail->addAddress($vdatosEnviarEmail['correo_destinatario'], $vdatosEnviarEmail['nombre_destinatario']);           
            }
            //$mail->send();
            if($attachment!=null) {
                $mail->addStringAttachment($attachment, 'pdf.pdf');
            }           

            if (!$mail->send())
                return 0;
            else
                return 1;
        } 
        catch (phpmailerException $e) {
            return 0;
        } 
        catch (Exception $e) {
            throw new Exception($e->getMessage(), $e->getCode());
        }
        return 0;
    }
}
