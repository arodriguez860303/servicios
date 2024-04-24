<?php

namespace App\Http\Models\Catalogos;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use DB;

class C_Usuarios extends Model
{
    use SoftDeletes;
    protected $dates = ['deleted_at'];
    protected $table = 'users';
    protected $fillable = [
        'id', 'id_registro', 'name', 'nickname', 'email', 'password', 'recovery_pass'
    ];

    protected $hidden = [
        //'id',
    ];

    public static function queryToDB($vfiltros=[])
     {
        /**
         * Consulta principal a la tabla users para traer el listado de usuarios
         * 23 de Agosto de 2023
         * */
        $vqueryToDB=C_Usuarios::select(
            'users.id', 
            'users.name', 
            'users.nickname',
            'users.email',
            'roles.description as rol',         
            'users.recovery_pass',
            DB::RAW("DATE_FORMAT(users.created_at, '%d-%m-%Y %h:%i:%s') as fecha_creacion")
        );        

        $vqueryToDB= $vqueryToDB->leftJoin('role_user', 'role_user.user_id','=','users.id');
        $vqueryToDB= $vqueryToDB->leftJoin('roles', 'role_user.role_id','=','roles.id');       
            
        $vqueryToDB= $vqueryToDB->where( function($sql) {
            $sql->where('roles.id','=',2)->orWhere('roles.id', '=', 4)->orWhere('roles.id', '=', 6);
        });

        $vqueryToDB = $vqueryToDB->whereNull('users.deleted_at');     
        $vqueryToDB = $vqueryToDB->orderBy('users.id', 'DESC');     
       
        return $vqueryToDB;
     }

    public static function queryToDetailDB($vfiltros=[])
     {
        /**
         * Consulta principal a la tabla users para traer el listado de usuarios
         * 23 de Agosto de 2023
         * */
        $vqueryToDB=C_Usuarios::select(
            'users.id', 
            'users.name', 
            'users.nickname',
            'users.email',
            'roles.id as id_rol',
            'users.recovery_pass'
        );        

        $vqueryToDB= $vqueryToDB->leftJoin('role_user', 'role_user.user_id','=','users.id');
        $vqueryToDB= $vqueryToDB->leftJoin('roles', 'role_user.role_id','=','roles.id');       
                
        if(array_key_exists('id', $vfiltros)){
            $filtro= $vfiltros["id"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro)
            {
                $sql->where('users.id','=', $filtro);
            });
        }

        $vqueryToDB = $vqueryToDB->whereNull('users.deleted_at');     
        $vqueryToDB = $vqueryToDB->orderBy('users.id', 'DESC');     
       
        return $vqueryToDB;
     }

    public static function queryToExistsDB($vfiltros=[])
     {
        /**
         * Consulta principal a la tabla users para verificar si ya existe un usuario registrado
         * 23 de Agosto de 2023
         * */
        $vqueryToDB=C_Usuarios::select('users.*');

        if(array_key_exists('nickname', $vfiltros)){
            $filtro= $vfiltros["nickname"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro)
            {
                $sql->where('users.nickname','=', $filtro);
            });
        }

        if(array_key_exists('id_usuario', $vfiltros)){
            $filtro= $vfiltros["id_usuario"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro)
            {
                $sql->where('users.id','!=', $filtro);
            });
        }

        

        $vqueryToDB = $vqueryToDB->whereNull('users.deleted_at');

        return $vqueryToDB;
     }
}