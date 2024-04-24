<?php

namespace App\Http\Models\Mantenimiento;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use DB;

class RoleUser extends Model
{
    use SoftDeletes;
    protected $dates = ['deleted_at'];
    protected $table = 'role_user';
    protected $fillable = [
        'id', 'role_id', 'user_id'
    ];

    protected $hidden = [
        //'id',
    ];   

    public static function obtener_rol($user_id){
        $result= RoleUser::select('*'); 

        $result= $result->where('user_id', $user_id)->first();        
        return $result;
    }  

    public static function obtener_responsable_alimentos(){       
        $result= RoleUser::select('user_id',DB::raw('(select count(*) from t_tramites where id_usuario_r=user_id and t_tramites.id_tipo_tramite = 1) as total'));

        $result= $result->leftJoin('users', 'role_user.user_id', '=', 'users.id');

        $result= $result->where('users.deleted_at', null);
        $result= $result->where('role_id',4)->orderBy('total','ASC')->first();   

        return $result;
    }

    public static function obtener_responsable_hospital(){       
        $result= RoleUser::select('user_id',DB::raw('(select count(*) from t_tramites where id_usuario_r=user_id and t_tramites.id_tipo_tramite = 2) as total'));

        $result= $result->leftJoin('users', 'role_user.user_id', '=', 'users.id');

        $result= $result->where('users.deleted_at', null);
        $result= $result->where('role_id',4)->orderBy('total','ASC')->first();   

        return $result;
    }
}