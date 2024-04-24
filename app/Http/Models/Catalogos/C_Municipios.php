<?php

namespace App\Http\Models\Catalogos;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class C_Municipios extends Model
{
    use SoftDeletes;
    protected $dates = ['deleted_at'];
    protected $table = 'c_municipios';
    protected $fillable = ['id', 'id_estado','id_region', 'id_jurisdiccion', 'clave', 'nombre', 'sigla'];

    protected $hidden = [
        //'id',
    ];

    public static function queryToDB($vfiltros=[])
     {
        /**
         * Consulta principal a la tabla municipios para traer el listado
         * 23 de Agosto de 2023
         * */
        $vqueryToDB=C_Municipios::select(
            'id', 
            'clave',
            'nombre'
        );       

        if(array_key_exists('id', $vfiltros)){
            $filtro= $vfiltros["id"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro)
            {
                $sql->where('c_municipios.id','=', $filtro);
            });
        }

        if(array_key_exists('id_estado', $vfiltros)){
            $filtro= $vfiltros["id_estado"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro)
            {
                $sql->where('c_municipios.id_estado','=', $filtro);
            });
        }

        $vqueryToDB = $vqueryToDB->whereNull('c_municipios.deleted_at');     
        $vqueryToDB = $vqueryToDB->orderBy('c_municipios.id', 'ASC');     
       
        return $vqueryToDB;
     }
}