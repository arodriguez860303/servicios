<?php

namespace App\Http\Models\Catalogos;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class C_Tipo_Tramite extends Model
{
    use SoftDeletes;
    protected $dates = ['deleted_at'];
    protected $table = 'c_tipo_tramite';
    protected $fillable = ['id', 'clave','nombre'];

    protected $hidden = [
        //'id',
    ];

    public static function queryToDB($vfiltros=[])
     {
        /**
         * Consulta principal a la tabla c_tipo_tramite para traer el listado
         * 20 de Septiembrre de 2023
         * */
        $vqueryToDB=C_Tipo_Tramite::select(
            'id', 
            'clave',
            'nombre'
        );       

        if(array_key_exists('id', $vfiltros)){
            $filtro= $vfiltros["id"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro)
            {
                $sql->where('c_tipo_tramite.id','=', $filtro);
            });
        }

        $vqueryToDB = $vqueryToDB->whereNull('c_tipo_tramite.deleted_at');     
        $vqueryToDB = $vqueryToDB->orderBy('c_tipo_tramite.id', 'ASC');     
       
        return $vqueryToDB;
     }
}