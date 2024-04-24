<?php

namespace App\Http\Models\Frontend;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use DB;

class T_Preguntas extends Model
{
    use SoftDeletes;
    protected $dates = ['deleted_at'];
    protected $table = 't_preguntas';
    protected $fillable = [
        'id',  
        'tipo_tramite',
        'fldpregunta', 
        'fldrespuesta', 
        'fldopc_a',
        'fldopc_b',
        'fldopc_c',
        'fldtexto_arriba',
        'fldtexto_abajo',
        'fldactiva'
    ];

    protected $hidden = [
        //'id',
    ];   

    public static function lstPreguntas(){  
        return T_Preguntas::select(
            't_preguntas.*'     
        )   
        ->where('tipo_tramite', 1)     
        ->orderByRaw('RAND()')
        ->limit(5);  
    }

    public static function totalPreguntas($vfiltros)
    {
        return T_Preguntas::select(
            't_preguntas.*'     
        )    
        ->where('tipo_tramite', 1)   
        ->orderBy('t_preguntas.id', 'ASC');
    }


    public static function lstPreguntasHospital(){  
        return T_Preguntas::select(
            't_preguntas.*'     
        )   
        ->where('tipo_tramite', 1)     
        ->orderByRaw('RAND()')
        ->limit(5);  
    }

    public static function totalPreguntasHospital($vfiltros)
    {
        return T_Preguntas::select(
            't_preguntas.*'     
        )    
        ->where('tipo_tramite', 1)   
        ->orderBy('t_preguntas.id', 'ASC');
    }
    
}