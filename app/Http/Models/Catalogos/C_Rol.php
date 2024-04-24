<?php

namespace App\Http\Models\Catalogos;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class C_Rol extends Model
{
    use SoftDeletes;
    protected $dates = ['deleted_at'];
    protected $table = 'roles';
    protected $fillable = ['id', 'name','description'];

    protected $hidden = [
        //'id',
    ];

    public static function queryToDB($vfiltros=[])
     {
        /**
         * Consulta principal a la tabla roles para traer el listado
         * 23 de Agosto de 2023
         * */
        $vqueryToDB=C_Rol::select(
            'id', 
            'description'
        );       

        if(array_key_exists('id', $vfiltros)){
            $filtro= $vfiltros["id"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro)
            {
                $sql->where('roles.id','=', $filtro);
            });
        }

        $vqueryToDB = $vqueryToDB->whereNull('roles.deleted_at');     
        $vqueryToDB = $vqueryToDB->orderBy('roles.id', 'ASC');     
       
        return $vqueryToDB;
     }
}