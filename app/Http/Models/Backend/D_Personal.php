<?php

namespace App\Http\Models\Backend;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use DB;

class D_Personal extends Model
{
    use SoftDeletes;
    protected $dates = ['deleted_at'];
    protected $table = 'd_personales';
    protected $fillable = [
        'id', 
        'id_d_domicilio', 
        'nombre', 
        'ap_paterno', 
        'ap_materno', 
        'curp', 
        'rfc', 
        'sexo',
        'telefono',
        'correo_electronico'
    ];

    protected $hidden = [
        //'id',
    ];
}