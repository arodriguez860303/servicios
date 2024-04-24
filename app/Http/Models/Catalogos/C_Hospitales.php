<?php

namespace App\Http\Models\Catalogos;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class C_Hospitales extends Model
{
    use SoftDeletes;
    protected $dates = ['deleted_at'];
    protected $table = 'c_hospitales';
    protected $fillable = ['id', 'clave','nombre'];

    protected $hidden = [
        //'id',
    ];

    public static function queryToDB($vfiltros=[])
     {
        /**
         * Consulta principal a la tabla c_hospitales para traer el listado
         * 20 de Septiembrre de 2023
         * */
        $vqueryToDB=C_Hospitales::select(
            'id', 
            'clave',
            'nombre'
        );       

        if(array_key_exists('id', $vfiltros)){
            $filtro= $vfiltros["id"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro)
            {
                $sql->where('c_hospitales.id','=', $filtro);
            });
        }

        $vqueryToDB = $vqueryToDB->where('c_hospitales.clave', '!=', 0);     
        $vqueryToDB = $vqueryToDB->whereNull('c_hospitales.deleted_at');     
       
        return $vqueryToDB;
     }
}