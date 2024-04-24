<?php

namespace App\Http\Models\Frontend;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use DB;

class T_Tramite extends Model
{
    use SoftDeletes;
    protected $dates = ['deleted_at'];
    protected $table = 't_tramites';
    protected $fillable = [
        'id',
        'id_registro',        
        'folio',     
        'id_tipo_tramite', 
        'id_status',        
        'fecha_inicio', 
        'fecha_fin',        
        'id_usuario_r',
        'firma',
        'no_serie_firma',
        'fecha_firma',
        'secuencia_firma',
        'uuid',
        'cadena_sello',
        'fecha_sellado',
        'xml',
        'folio_documento_firma',
        'responsable_firma'
    ];

    protected $hidden = [
        //'id',
    ];    

    public static function queryToDB($vfiltros=[])
     {
        /**
         * Consulta principal a la tabla t_tramites para traer el listado de tramites
         * 10 de Agosto de 2023
         * */
        $vqueryToDB=T_Tramite::select(
            't_tramites.id',
            't_tramites.folio',
            'c_status.nombre as status',
            'c_status.color as status_color',
            't_tramites.fecha_inicio',
            't_tramites.fecha_fin',
            't_tramite_constancia.folio_hacienda',
            't_tramites.id_status'         
        );        
       
        $vqueryToDB = $vqueryToDB->leftJoin('c_status', 't_tramites.id_status', '=', 'c_status.id'); 
        $vqueryToDB = $vqueryToDB->leftJoin('t_tramite_constancia', 't_tramites.id', '=', 't_tramite_constancia.id_tramite'); 
        
        if(array_key_exists('id_registro', $vfiltros)){
            $filtro= $vfiltros["id_registro"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro)
            {
                $sql->where('t_tramites.id_registro','=', $filtro);
            });
        }

        if(array_key_exists('id_tramite', $vfiltros)){
            $filtro= $vfiltros["id_tramite"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro)
            {
                $sql->where('t_tramites.id','=', $filtro);
            });
        }

        $vqueryToDB = $vqueryToDB->where('t_tramites.id_tipo_tramite', '=', 1);     
        $vqueryToDB = $vqueryToDB->whereNull('t_tramites.deleted_at');     
       
        return $vqueryToDB;
     }

    public static function queryToHospitalDB($vfiltros=[])
     {
        /**
         * Consulta principal a la tabla t_tramites para traer el listado de tramites de un hospital
         * 25 de Septiembre de 2023
         * */
        $vqueryToDB=T_Tramite::select(
            't_tramites.id',
            't_tramites.folio',
            'c_status.nombre as status',
            'c_status.color as status_color',
            't_tramites.fecha_inicio',
            't_tramites.fecha_fin',            
            't_tramites.id_status',
            'c_hospitales.nombre as hospital'      
        );        
       
        $vqueryToDB = $vqueryToDB->leftJoin('c_status', 't_tramites.id_status', '=', 'c_status.id');         
        $vqueryToDB = $vqueryToDB->leftJoin('t_tramite_constancia', 't_tramites.id', '=', 't_tramite_constancia.id_tramite');
        $vqueryToDB = $vqueryToDB->leftJoin('t_registro', 't_tramites.id_registro', '=', 't_registro.id'); 
        $vqueryToDB = $vqueryToDB->leftJoin('c_hospitales', 't_registro.id_hospital', '=', 'c_hospitales.id'); 
        
        if(array_key_exists('id_registro', $vfiltros)){
            $filtro= $vfiltros["id_registro"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro)
            {
                $sql->where('t_tramites.id_registro','=', $filtro);
            });
        }

        if(array_key_exists('id_tramite', $vfiltros)){
            $filtro= $vfiltros["id_tramite"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro)
            {
                $sql->where('t_tramites.id','=', $filtro);
            });
        }

        $vqueryToDB = $vqueryToDB->where('t_tramites.id_tipo_tramite', '=', 2);     
        $vqueryToDB = $vqueryToDB->whereNull('t_tramites.deleted_at');     
       
        return $vqueryToDB;
     }

    public static function queryToTotalAnioDB($anio){
        $vqueryToDB = T_Tramite::select('t_tramites.*')
                        ->where('t_tramites.id_tipo_tramite', 2 )
                        ->whereRaw('YEAR(t_tramites.created_at)='.$anio)
                        ->withTrashed();
        $vqueryToDB= $vqueryToDB->count();
        return $vqueryToDB;
    }
 }