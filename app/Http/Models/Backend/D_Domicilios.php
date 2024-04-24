<?php

namespace App\Http\Models\Backend;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use DB;

class D_Domicilios extends Model
{
    use SoftDeletes;
    protected $dates = ['deleted_at'];
    protected $table = 'd_domicilios';
    protected $fillable = [
        'id', 
        'id_municipio', 
        'codigo_postal', 
        'calle', 
        'num_exterior', 
        'num_interior', 
        'colonia',
        'entre_calle',
        'y_calle',
        'referencias',
        'telefono'
    ];

    protected $hidden = [
        //'id',
    ];

 

}