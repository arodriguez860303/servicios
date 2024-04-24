<?php

namespace App\Http\Models\Frontend;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use DB;

class P_Examen_Contestaron extends Model
{
    use SoftDeletes;
    protected $dates = ['deleted_at'];
    protected $table = 'p_examen_contestaron';
    protected $fillable = [
        'id',  
        'id_tramite',
        'id_registro',
        'aprobado'
    ];

    protected $hidden = [
        //'id',
    ];   

    public static function queryToDB($data=[]){
        $result = P_Examen_Contestaron::select('p_examen_contestaron.*');                       
        
        if(array_key_exists('id_registro', $data)){
            $filtro= $data["id_registro"];
            $result= $result->where( function($sql) use ($filtro){
                    $sql->where('p_examen_contestaron.id_registro','=',$filtro);
                });
        }  

        $result= $result->whereNull('id_tramite');
        $result= $result->whereNull('deleted_at');

        return $result;
    }

    public static function queryToSearchDB($data=[]){
        $result = P_Examen_Contestaron::select('p_examen_contestaron.*');                       
             
        if(array_key_exists('id_tramite', $data)){
            $filtro= $data["id_tramite"];
            $result= $result->where( function($sql) use ($filtro){
                    $sql->where('p_examen_contestaron.id_tramite','=',$filtro);
                });
        } 

        $result= $result->whereNull('deleted_at');

        return $result;
    }
}