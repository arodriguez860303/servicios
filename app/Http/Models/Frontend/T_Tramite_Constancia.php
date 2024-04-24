<?php

namespace App\Http\Models\Frontend;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use DB;

class T_Tramite_Constancia extends Model
{
    use SoftDeletes;
    protected $dates = ['deleted_at'];
    protected $table = 't_tramite_constancia';
    protected $fillable = [
        'id',
        'id_registro_temp',  
        'id_tramite', 
        'folio_hacienda',
        'id_status_requerimiento', 
        'id_status_video',
        'id_status_examen',        
        'no_oportunidades', 
        'id_usuario_registro'
    ];

    protected $hidden = [
        //'id',
    ];

    public static function queryToDB($data=[]){
        $result = T_Tramite_Constancia::select('t_tramite_constancia.*');                       
        
        if(array_key_exists('id_registro', $data)){
            $filtro= $data["id_registro"];
            $result= $result->where( function($sql) use ($filtro){
                    $sql->where('t_tramite_constancia.id_registro_temp','=',$filtro);
                });
        }  

        $result= $result->where('id_tramite', 0);
        $result= $result->whereNull('deleted_at');

        return $result;
    }

    public static function queryToSearchDB($data=[]){
        $result = T_Tramite_Constancia::select('t_tramite_constancia.*');                       
             
        if(array_key_exists('id_tramite', $data)){
            $filtro= $data["id_tramite"];
            $result= $result->where( function($sql) use ($filtro){
                    $sql->where('t_tramite_constancia.id_tramite','=',$filtro);
                });
        } 

        $result= $result->whereNull('deleted_at');

        return $result;
    }

    public static function existePago($data){ 
        $query =  T_Tramite_Constancia::select('t_tramite_constancia.*');

        if(array_key_exists('folio_hacienda', $data)){
            $filtro= $data["folio_hacienda"];
            $query= $query->where( function($sql) use ($filtro)
            {
                $sql->where('t_tramite_constancia.folio_hacienda','=', $filtro);
            });
        }

        if(array_key_exists('id_registro', $data)){
            $filtro= $data["id_registro"];
            $query= $query->where( function($sql) use ($filtro)
            {
                $sql->where('t_tramite_constancia.id_registro_temp','!=', $filtro);
            });
        }

        $query = $query->whereNull('t_tramite_constancia.deleted_at');
        $query = $query->first();
        return $query;
    }

 }