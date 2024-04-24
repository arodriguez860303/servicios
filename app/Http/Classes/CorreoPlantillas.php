<?php
namespace App\Http\Classes;

class CorreoPlantillas
{
    public static function creacion_cuenta($vdatos)
    {
        return '<table>
                    <tbody>
                        <tr height="16"></tr>
                        <tr>
                            <td>
                                <table style="min-width:332px;max-width:680px;border:1px solid #e0e0e0;border-bottom:0;border-top-left-radius:3px;border-top-right-radius:3px" width="100%" cellspacing="0" cellpadding="0" border="0" bgcolor="#333">
                                    <tbody>
                                        <tr>
                                            <td width="32px"></td>
                                            <td style="font-family:Roboto-Regular,Helvetica,Arial,sans-serif;font-size:24px;color:#ffffff;line-height:1.25">
                                                Creación de cuenta
                                            </td>
                                            <td width="32px"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" height="18px"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table style="min-width:332px;max-width:680px;border:1px solid #f0f0f0;border-bottom:1px solid #c0c0c0;border-top:0;border-bottom-left-radius:3px;border-bottom-right-radius:3px" width="100%" cellspacing="0" cellpadding="0" border="0" bgcolor="#FAFAFA">
                                    <tbody>
                                        <tr height="16px">
                                            <td rowspan="3" width="32px"></td>
                                            <td></td>
                                            <td rowspan="3" width="32px"></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div style="text-align:justify">
                                                    <p>
                                                        <strong>Estimado(a): C. '. $vdatos['name'] .' </strong>, 
                                                    </p>
                                                    <p>
                                                        Usted ha finalizado <b>exitosamente<b/> el proceso de <b>Creación de cuenta</b> para el <b>Sistema DIPRIS</b>. Sus credenciales son las siguientes:
                                                    </p>
                                                </div>                                               

                                                <div style="text-align:center">
                                                    <p>
                                                        Usuario<br />
                                                        <strong style="text-align:center;font-size:24px;font-weight:bold">'. $vdatos['nickname'] .'</strong>
                                                    </p>
                                                   <p>
                                                        Contraseña<br />
                                                        <strong style="text-align:center;font-size:24px;font-weight:bold">'. $vdatos['password'] .'</strong>
                                                    </p>                                                    

                                                </div>
                                                <div style="text-align:justify">
                                                    <p>
                                                        <strong>Advertencia: </strong> Se recomienda cambiar su contraseña periodicamente para aumentar la seguridad de su cuenta.
                                                    </p>
                                                </div>                                                
                                                <div style="text-align:justify">
                                                    <p>
                                                        <strong>Atentamente</strong>.<br />
                                                            Dirección de Protección contra Riesgos Sanitarios
                                                    </p>
                                                </div>
                                                <div style="text-align:justify">
                                                    <p>
                                                        <br />
                                                        Este correo electrónico es confidencial y/o puede contener información privilegiada.
                                                        <br />
                                                        Si usted no es su destinatario o no es alguna persona autorizada por este para recibir sus correos electrónicos, NO deberá utilizar,
                                                        copiar, revelar, o tomar ninguna acción basada en este correo electrónico o cualquier otra información incluida en el, favor de notificar
                                                        a los teléfonos proporcionados y borrar a continuación totalmente este mensaje.
                                                        <br />
                                                        Conmutador: (000) 00 0 00 00 Ext. 00000

                                                        <br />
                                                        Este correo se genera automaticamente, no responder.
                                                    </p>
                                               </div>                                                
                                            </td>
                                        </tr>
                                        <tr height="32px"></tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr height="16"></tr>
                        <tr>
                            <td style="max-width:600px;font-family:Roboto-Regular,Helvetica,Arial,sans-serif;font-size:10px;color:#bcbcbc;line-height:1.5">
                                <table>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <table style="font-family:Roboto-Regular,Helvetica,Arial,sans-serif;font-size:10px;color:#666666;line-height:18px;padding-bottom:10px">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <strong>No se pueden enviar respuestas a esta dirección de correo electrónico</strong>.<br />
                                                                © Dirección de Protección contra Riesgos Sanitarios., 1a. Calle poniente entre 3a. y, Av. 4a. Nte. Pte. No. 421, Col. Centro, 29000 Tuxtla Gutiérrez; Chiapas, CP 29056 Conmutador: (000) 00 0 00 00
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>';
    }

    public static function recuperar_contrasenia($vdatos)
    {
        return '<table>
                    <tbody>
                        <tr height="16"></tr>
                        <tr>
                            <td>
                                <table style="min-width:332px;max-width:680px;border:1px solid #e0e0e0;border-bottom:0;border-top-left-radius:3px;border-top-right-radius:3px" width="100%" cellspacing="0" cellpadding="0" border="0" bgcolor="#333">
                                    <tbody>
                                        <tr>
                                            <td width="32px"></td>
                                            <td style="font-family:Roboto-Regular,Helvetica,Arial,sans-serif;font-size:24px;color:#ffffff;line-height:1.25">
                                                Restablecer contraseña
                                            </td>
                                            <td width="32px"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" height="18px"></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table style="min-width:332px;max-width:680px;border:1px solid #f0f0f0;border-bottom:1px solid #c0c0c0;border-top:0;border-bottom-left-radius:3px;border-bottom-right-radius:3px" width="100%" cellspacing="0" cellpadding="0" border="0" bgcolor="#FAFAFA">
                                    <tbody>
                                        <tr height="16px">
                                            <td rowspan="3" width="32px"></td>
                                            <td></td>
                                            <td rowspan="3" width="32px"></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div style="text-align:justify">
                                                    <p>
                                                        <strong>Estimado(a): C. '. $vdatos['name'] .' </strong>, 
                                                    </p>
                                                    <p>
                                                        Se ha generado una nueva <b>contraseña<b/> para poder accesar al sistema, las credenciales con las que podra accesar al sistema son las siguiente:
                                                    </p>
                                                </div>                                               

                                                <div style="text-align:center">
                                                    <p>
                                                        Usuario<br />
                                                        <strong style="text-align:center;font-size:24px;font-weight:bold">'. $vdatos['nickname'] .'</strong>
                                                    </p>
                                                   <p>
                                                        Contraseña<br />
                                                        <strong style="text-align:center;font-size:24px;font-weight:bold">'. $vdatos['password'] .'</strong>
                                                    </p>                                                    

                                                </div>
                                                <div style="text-align:justify">
                                                    <p>
                                                        <strong>Advertencia: </strong> El uso de la cuenta, así como el accesar al Sistema DIPRIS, por medio del usuario y contraseña es responsabilidad de la persona a la que le fue otorgada; se recomienda cambiar su contraseña periodicamente para aumentar la seguridad de su cuenta, ni compartir con terceros.<br><br>Link para ingresar al sistema: https://apps.dipris.gob.mx/dipris
                                                    </p>
                                                </div>                                                
                                                <div style="text-align:justify">
                                                    <p>
                                                        <strong>Atentamente</strong>.<br />
                                                        Dirección de Protección contra Riesgos Sanitarios
                                                    </p>
                                                </div>
                                                <div style="text-align:justify">
                                                    <p>
                                                        <br />
                                                        Este correo electrónico es confidencial y/o puede contener información privilegiada.
                                                        <br />
                                                        Si usted no es su destinatario o no es alguna persona autorizada por este para recibir sus correos electrónicos, NO deberá utilizar,
                                                        copiar, revelar, o tomar ninguna acción basada en este correo electrónico o cualquier otra información incluida en el, favor de notificar
                                                        a los teléfonos proporcionados y borrar a continuación totalmente este mensaje.
                                                        <br />
                                                        Conmutador: (000) 00 0 00 000 Ext. 00000

                                                        <br />
                                                        Este correo se genera automaticamente, no responder.

                                                    </p>
                                               </div>                                                
                                            </td>
                                        </tr>
                                        <tr height="32px"></tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr height="16"></tr>
                        <tr>
                            <td style="max-width:600px;font-family:Roboto-Regular,Helvetica,Arial,sans-serif;font-size:10px;color:#bcbcbc;line-height:1.5">
                                <table>
                                    <tbody>
                                        <tr>
                                            <td>
                                                <table style="font-family:Roboto-Regular,Helvetica,Arial,sans-serif;font-size:10px;color:#666666;line-height:18px;padding-bottom:10px">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <strong>No se pueden enviar respuestas a esta dirección de correo electrónico</strong>.<br />
                                                                © Dirección de Protección contra Riesgos Sanitarios., 1a. Calle poniente entre 3a. y, Av. 4a. Nte. Pte. No. 421, Col. Centro, 29000 Tuxtla Gutiérrez; Chiapas, CP 29056 Conmutador: (000) 00 0 00 00
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>';
    }      
}
