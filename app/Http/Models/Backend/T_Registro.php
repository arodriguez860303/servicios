<?php

namespace App\Http\Models\Backend;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use DB;

class T_Registro extends Model
{
    use SoftDeletes;
    protected $dates = ['deleted_at'];
    protected $table = 't_registro';
    protected $fillable = [
        'id',         
        'id_tipo_tramite',
        'id_hospital',
        'id_d_personal', 
        'id_d_domicilio', 
        'rfc', 
        'curp',
        'razon_social_o_nombre', 
        'telefono',
        'email'
    ];

    protected $hidden = [
        //'id',
    ];   

    public static function get_cuenta($id){
        $result = T_Registro::select('u.nickname', 'u.password', 't_registro.razon_social_o_nombre as razon_social', 'u.recovery_pass');

        $result= $result->leftJoin('users as u', 'u.id_registro', '=', 't_registro.id');   

        $result= $result->where('t_registro.id',$id)->first();
        return $result;               
    }

    public static function dtsGenerales($data){
        $result = T_Registro::select(
                                        't_registro.rfc', 
                                        't_registro.curp', 
                                        't_registro.telefono', 
                                        't_registro.email', 
                                        't_registro.razon_social_o_nombre', 
                                        'c_municipios.nombre as municipio',
                                        'd_domicilios.codigo_postal',
                                        'd_domicilios.calle',
                                        'd_domicilios.num_exterior',
                                        'd_domicilios.num_interior',
                                        'd_domicilios.colonia',
                                        'd_domicilios.entre_calle',
                                        'd_domicilios.y_calle'
                                    );

        $result= $result->leftJoin('d_domicilios', 't_registro.id_d_domicilio', '=', 'd_domicilios.id');
        $result= $result->leftJoin('c_municipios', 'd_domicilios.id_municipio', '=', 'c_municipios.id');

        if(array_key_exists('id_registro', $data)){
            $filtro= $data["id_registro"];
            $result= $result->where( function($sql) use ($filtro){
                    $sql->where('t_registro.id','=',$filtro);
                });
        }

        return $result; 
    }

    public static function dtsRegistro($data){
        $result = T_Registro::select(
                                        't_registro.rfc', 
                                        't_registro.curp', 
                                        't_registro.telefono', 
                                        't_registro.email', 
                                        't_registro.razon_social_o_nombre', 
                                        'c_municipios.nombre as municipio',
                                        'd_domicilios.codigo_postal',
                                        'd_domicilios.calle',
                                        'd_domicilios.num_exterior',
                                        'd_domicilios.num_interior',
                                        'd_domicilios.colonia',
                                        'd_domicilios.entre_calle',
                                        'd_domicilios.y_calle',                                       
                                        'c_municipios.id as id_municipio'
                                    );

        $result= $result->leftJoin('d_domicilios', 't_registro.id_d_domicilio', '=', 'd_domicilios.id');
        $result= $result->leftJoin('c_municipios', 'd_domicilios.id_municipio', '=', 'c_municipios.id');

        if(array_key_exists('id_registro', $data)){
            $filtro= $data["id_registro"];
            $result= $result->where( function($sql) use ($filtro){
                    $sql->where('t_registro.id','=',$filtro);
                });
        }

        return $result; 
    }

    public static function dtsUserRegistro($data){
        $result = T_Registro::select(
                                        'id', 
                                        'curp', 
                                        'email', 
                                        'razon_social_o_nombre'
                                    );

        if(array_key_exists('correo', $data)){
            $filtro= $data["correo"];
            $result= $result->where( function($sql) use ($filtro){
                    $sql->where('t_registro.email','=',$filtro);
                });
        } 
        if(array_key_exists('curp', $data)){
            $filtro= $data["curp"];
            $result= $result->where( function($sql) use ($filtro){
                    $sql->where('t_registro.curp','=',$filtro);
                });
        }
        $result= $result->first();
        return $result;               
    }


    /*Datos para el sistema de hospital*/
    public static function dtsGeneralesHospital($data){
        $result = T_Registro::select(                                        
                                        't_registro.curp',                                         
                                        't_registro.razon_social_o_nombre',                                         
                                        'c_hospitales.clave as clave_hospital',
                                        'c_hospitales.nombre as hospital'
                                    );
       
        $result= $result->leftJoin('c_hospitales', 't_registro.id_hospital', '=', 'c_hospitales.id');

        if(array_key_exists('id_registro', $data)){
            $filtro= $data["id_registro"];
            $result= $result->where( function($sql) use ($filtro){
                    $sql->where('t_registro.id','=',$filtro);
                });
        }

        return $result; 
    }

    public static function dtsRegistroHospital($data){
        $result = T_Registro::select(                                        
                                        't_registro.curp',                                          
                                        't_registro.razon_social_o_nombre',                                         
                                        'c_hospitales.nombre as hospital'
                                    );
        
        $result= $result->leftJoin('c_hospitales', 't_registro.id_hospital', '=', 'c_hospitales.id');

        if(array_key_exists('id_registro', $data)){
            $filtro= $data["id_registro"];
            $result= $result->where( function($sql) use ($filtro){
                    $sql->where('t_registro.id','=',$filtro);
                });
        }

        return $result; 
    }
}