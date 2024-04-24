<?php
namespace App\Http\Classes;

class Validaciones{

    private $status_b;
    private $status_code;
    private $status_msg;

    public function __construct()
    {
        $this->status_b    = false;
        $this->status_code = 201;
        $this->status_msg  = '';        
    }

    public function crearCuentaNueva($post){        
        
        if(\App\User::general(['nickname'=>$post['nickname']])->count()>0){
            $this->status_b    = true;
            $this->status_code = 409;
            $this->status_msg  = 'Ya existe una cuenta con el nombre de usuario <b>"'.$post['nickname'].'"</b>. <br>Por favor intente con un nombre de usuario distinto.';
        }
        if(\App\User::general(['curp'=>$post['curp']])->count()>0){
            $this->status_b    = true;
            $this->status_code = 409;
            $this->status_msg  = 'Ya existe una cuenta creada para la CURP <b>"'.$post['curp'].'"</b>. <br>Si usted no recuerda sus usuario y contraseña, dirijase al la pagina de inicio y seleccione la opcion recuperar contraseña.';
        }        
    } 

    public function getStatusB(){
        return $this->status_b;
    }

    public function getStatusCode(){
        return $this->status_code;
    }

    public function getStatusMsg(){
        return $this->status_msg;
    } 

    //Subir documento temporal (Nuevo trámite)    
    public function registroSubirDocumentoTmp($post){ 
        $docto = \App\Http\Models\Catalogos\C_Documentos::find($post['id_documento']);  
        
        if(\App\Http\Models\Frontend\T_Tramite_Documentacion::general(['id_registro_temp'=>$post['id_registro'], 'id_documento'=>$post['id_documento'], 'id_tramite_null'=>0])->count()>0){
            $this->status_b    = true;
            $this->status_code = 409;
            $this->status_msg  = 'Ya existe un archivo adjunto de este documento. <br>Por favor eliminelo y vuelva a intentar.';
        }
       
    } 

    //Agregar observación
    public function agregarObservacion($post){        
        if(\App\Http\Models\Backend\T_Tramite_Observacion::getExiste(
                                                                    [
                                                                        'id_tramite'   =>$post['id_tramite'], 
                                                                        'id_documento' =>$post['id_documento'], 
                                                                        'id_status'    =>$post['id_status'], 
                                                                        'id_tramite_documentacion' => $post['id_tramite_documentacion']
                                                                    ])->count()>0){
            $this->status_b    = true;
            $this->status_code = 409;
            $this->status_msg  = 'Ya existe una observación de este documento. <br>Por favor eliminelo y vuelva a intentar.';
        }
    }             
}
?>
