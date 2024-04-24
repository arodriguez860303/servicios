<?php

namespace App\Http\Models\Catalogos;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use DB;

class C_Folios extends Model
{
    use SoftDeletes;
    protected $dates = ['deleted_at'];
    protected $table = 'c_folios';
    protected $fillable = [
        'id', 'id_tramite', 'id_tipo_tramite', 'folio', 'ocupado'
    ];

    protected $hidden = [
        //'id',
    ];

    public static function lstFolios($data=[]){

        $result= C_Folios::select(
                        'c_folios.id', 
                        'c_folios.folio', 
                        'c_folios.ocupado', 
                        DB::RAW("DATE_FORMAT(c_folios.created_at, '%d-%m-%Y %h:%i:%s') as fecha"),
                        'c_tipo_tramite.clave',
                        'c_tipo_tramite.nombre as tipo_tramite'
                    );

        $result= $result->leftJoin('c_tipo_tramite', 'c_folios.id_tipo_tramite', '=', 'c_tipo_tramite.id');

        if(array_key_exists('id_tipo_tramite', $data)){
            $filtro= $data["id_tipo_tramite"];
            $result= $result->where( function($sql) use ($filtro)
            {
                $sql->where('c_folios.id_tipo_tramite','=', $filtro);
            });
        }

        if(array_key_exists('anio', $data)){
            $filtro= $data["anio"];
            $result= $result->where( function($sql) use ($filtro)
            {
                $sql->whereRaw('YEAR(c_folios.created_at)='.$filtro);
            });
        }

        $result->where('c_folios.deleted_at', null);
        $result->orderBy('id', 'ASC');
        return $result;
    }

    public static function search($data){  
        $query=  C_Folios::select('*');
      
        if(array_key_exists('ocupado', $data)){
            $filtro= $data["ocupado"];
            $query= $query->where( function($sql) use ($filtro)
            {
                $sql->where('ocupado','=', $filtro);
            });
        }    

        if(array_key_exists('anio', $data)){
            $filtro= $data["anio"];
            $query= $query->where( function($sql) use ($filtro)
            {
                $sql->whereRaw('YEAR(created_at)='.$filtro);
            });
        }  
        
        $query = $query->orderBy('id', 'ASC');
        return $query;
    }
}