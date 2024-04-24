<?php

namespace App;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\SoftDeletes;
class User extends Authenticatable
{
    use Notifiable;
    use SoftDeletes;
    protected $dates = ['deleted_at'];
    protected $table = 'users';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'id_registro', 
        'name', 
        'nickname', 
        'email', 
        'password', 
        'recovery_pass', 
        'theme',
        'dark_mode'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
   /* protected $casts = [
        'email_verified_at' => 'datetime',
    ];*/

    public function roles() {
        return $this
            ->belongsToMany('App\Role')
            ->withTimestamps();
    }   

    public function authorizeRoles($roles) {
        if ($this->hasAnyRole($roles)) {
            return true;
        }
        abort(401, 'Esta acción no está autorizada.');
    }

    public function hasAnyRole($roles) {
        if (is_array($roles)) {
            foreach ($roles as $role) {
                if ($this->hasRole($role)) {
                    return true;
                }
            }
        } else {
            if ($this->hasRole($roles)) {
                return true;
            }
        }
        return false;
    }

    public function hasRole($role) {
        if ($this->roles()->where('name', $role)->first()) {
            return true;
        }
        return false;
    } 

    public static function general($data=[]){
        $result = User::select('users.*');
        $result= $result->leftJoin('t_registro as r', 'r.id', '=', 'users.id_registro');   
        $result= $result->leftJoin('d_personales as p', 'r.id_d_personal', '=', 'p.id');   

        if(array_key_exists('nickname', $data)){
            $filtro= $data["nickname"];
            $result= $result->where( function($sql) use ($filtro){
                    $sql->where('users.nickname','=',$filtro);
                });
        }

        if(array_key_exists('rfc', $data)){
            $filtro= $data["rfc"];
            $result= $result->where( function($sql) use ($filtro){
                    $sql->where('r.rfc','=',$filtro);
                });
        }

        if(array_key_exists('curp', $data)){
            $filtro= $data["curp"];
            $result= $result->where( function($sql) use ($filtro){
                    $sql->where('p.curp','=',$filtro);
                });
        }

        if(array_key_exists('razon_social_o_nombre', $data)){
            $filtro= $data["razon_social_o_nombre"];
            $result= $result->where( function($sql) use ($filtro){
                    $sql->where('r.razon_social_o_nombre','=',$filtro);
                });
        }        
     
        if(array_key_exists('id', $data)){
            $filtro= $data["id"];
            $result= $result->where( function($sql) use ($filtro){
                    $sql->where('r.id','!=',$filtro);
                });
        }

        if(array_key_exists('id_registro', $data)){
            $filtro= $data["id_registro"];
            $result= $result->where( function($sql) use ($filtro){
                    $sql->where('users.id_registro','=',$filtro);
                });
        }      

        $result= $result->orderBy('r.id','DESC');
        return $result;        
        
    }   
}
