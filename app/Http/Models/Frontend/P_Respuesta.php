<?php

namespace App\Http\Models\Frontend;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use DB;

class P_Respuesta extends Model
{
    use SoftDeletes;
    protected $dates = ['deleted_at'];
    protected $table = 'p_respuesta';
    protected $fillable = [
        'id',  
        'id_examen_contestaron', 
        'id_pregunta', 
        'fldcorrecta',
        'fldrespuesta',
        'fldespecifique'
    ];

    protected $hidden = [
        //'id',
    ];   

    public static function queryToDB($data=[]){
        $result = P_Respuesta::select('p_respuesta.*');                       
        
        if(array_key_exists('id_examen_contestaron', $data)){
            $filtro= $data["id_examen_contestaron"];
            $result= $result->where( function($sql) use ($filtro){
                    $sql->where('p_respuesta.id_examen_contestaron','=',$filtro);
                });
        }  

        $result= $result->whereNull('deleted_at');

        return $result;
    }

    public static function getRespuestas($data){  
        $query=  P_Respuesta::select('p_respuesta.*');      
      
        if(array_key_exists('incorrectas', $data)){   

            $filtro= $data["incorrectas"];
            $query= $query->where( function($sql) use ($filtro){
                    $sql->where('p_respuesta.fldcorrecta','=',$filtro);
                });            
        }  
      
        if(array_key_exists('correctas', $data)){            
            $filtro= $data["correctas"];
            $query= $query->where( function($sql) use ($filtro){
                    $sql->where('p_respuesta.fldcorrecta','=',$filtro);
                });             
        }
        
        if(array_key_exists('id_examen', $data)){
            $filtro= $data["id_examen"];
            $query= $query->where( function($sql) use ($filtro){
                    $sql->where('p_respuesta.id_examen_contestaron','=',$filtro);
                });
        }

        return $query;
    }

    public static function getDatosExamen($data){  
        $query=  P_Respuesta::select('p_respuesta.*');      
      

        $query= $query->Join('p_examen_contestaron', 'p_respuesta.id_examen_contestaron', '=', 'p_examen_contestaron.id');


        if(array_key_exists('incorrectas', $data)){   

            $filtro= $data["incorrectas"];
            $query= $query->where( function($sql) use ($filtro){
                    $sql->where('p_respuesta.fldcorrecta','=',$filtro);
                });            
        }  
      
        if(array_key_exists('correctas', $data)){            
            $filtro= $data["correctas"];
            $query= $query->where( function($sql) use ($filtro){
                    $sql->where('p_respuesta.fldcorrecta','=',$filtro);
                });             
        }
        
        if(array_key_exists('id_registro', $data)){
            $filtro= $data["id_registro"];
            $query= $query->where( function($sql) use ($filtro){
                    $sql->where('p_examen_contestaron.id_registro','=',$filtro)->whereNull('p_examen_contestaron.id_tramite');
                });
        }

        if(array_key_exists('id_tramite', $data)){
            $filtro= $data["id_tramite"];
            $query= $query->where( function($sql) use ($filtro){
                    $sql->where('p_examen_contestaron.id_tramite','=',$filtro);
                });
        }

        $query= $query->whereNull('p_examen_contestaron.deleted_at');

        return $query;
    } 
}