<?php

namespace App\Http\Models\Backend;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use DB;

class T_Tramites extends Model
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
         * 11 de Agosto de 2023
         * */
        $vqueryToDB=T_Tramites::select(
            't_tramites.id',
            't_tramites.folio',
            'c_status.nombre as status',
            'c_status.color as status_color',
            't_tramites.fecha_inicio',
            't_tramites.fecha_fin',
            't_tramite_constancia.folio_hacienda',
            't_registro.razon_social_o_nombre',
            't_registro.curp',
            't_registro.telefono'
        );        
       
        $vqueryToDB = $vqueryToDB->leftJoin('t_registro', 't_tramites.id_registro', '=', 't_registro.id'); 
        $vqueryToDB = $vqueryToDB->leftJoin('c_status', 't_tramites.id_status', '=', 'c_status.id'); 
        $vqueryToDB = $vqueryToDB->leftJoin('t_tramite_constancia', 't_tramites.id', '=', 't_tramite_constancia.id_tramite'); 
        
        if(array_key_exists('id_usuario_r', $vfiltros)){
            $filtro= $vfiltros["id_usuario_r"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro)
            {
                $sql->where('t_tramites.id_usuario_r','=', $filtro);
            });
        }

        if(array_key_exists('id_status', $vfiltros)){
            $filtro= $vfiltros["id_status"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro)
            {
                $sql->where('t_tramites.id_status','=', $filtro);
            });
        }

        if(array_key_exists('anio', $vfiltros)){
            $filtro= $vfiltros["anio"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro){
                if($filtro!=0) { 
                    $sql->whereRaw('YEAR(t_tramites.created_at)='.$filtro);
                }                    
            });
        }

        $vqueryToDB = $vqueryToDB->where('t_tramites.id_tipo_tramite', 1);  
        $vqueryToDB = $vqueryToDB->whereNull('t_tramites.deleted_at');  

        if(array_key_exists('limit', $vfiltros)){
            $filtro= $vfiltros["limit"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro)
            {
                $sql->limit($filtro);
            });
        }   
       
        return $vqueryToDB;
     }

    public static function queryToGlobalDB($vfiltros=[])
     {
        /**
         * Consulta principal a la tabla t_tramites para traer el listado de tramites
         * 11 de Agosto de 2023
         * */
        $vqueryToDB=T_Tramites::select(
            't_tramites.id'
        );       
       
        if(array_key_exists('anio', $vfiltros)){
            $filtro= $vfiltros["anio"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro){
                if($filtro!=0) { 
                    $sql->whereRaw('YEAR(t_tramites.created_at)='.$filtro);
                }                    
            });
        }

        if(array_key_exists('tipo_tramite', $vfiltros)){
            $filtro= $vfiltros["tipo_tramite"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro)
            {
                $sql->where('t_tramites.id_tipo_tramite','=', $filtro);
            });
        }
 
        $vqueryToDB = $vqueryToDB->whereNull('t_tramites.deleted_at');      
       
        return $vqueryToDB;
     }


    public static function queryToSearchDB($vfiltros=[])
     {
        /**
         * Consulta principal a la tabla t_tramites para buscar tramites
         * 07 de Septiembre de 2023
         * */
        $vqueryToDB=T_Tramites::select(
            't_tramites.*'
        );        
             
        if(array_key_exists('id_registro', $vfiltros)){
            $filtro= $vfiltros["id_registro"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro)
            {
                $sql->where('t_tramites.id_registro','=', $filtro);
            });
        }

        $vqueryToDB = $vqueryToDB->where('t_tramites.id_tipo_tramite', 1);  
        $vqueryToDB = $vqueryToDB->whereNull('t_tramites.deleted_at'); 
        return $vqueryToDB;
     }

    public static function queryToDetailsDB($vfiltros=[])
    {
        /**
         * Consulta principal a la tabla t_tramites para traer el listado de tramites
         * 11 de Agosto de 2023
         * */
        $vqueryToDB=T_Tramites::select(           
            't_tramites.folio',
            'c_status.nombre as status',
            'c_status.color as status_color',
            't_tramites.fecha_inicio',
            't_tramites.fecha_fin',
            't_tramite_constancia.folio_hacienda',
            't_registro.razon_social_o_nombre',
            't_registro.curp',
            't_registro.telefono',
            'd_domicilios.codigo_postal',
            'd_domicilios.calle',
            'd_domicilios.num_exterior',
            'd_domicilios.num_interior',
            'd_domicilios.colonia',
            'd_domicilios.entre_calle',
            'd_domicilios.y_calle',
            'c_municipios.nombre as municipio'
        );        
       
        $vqueryToDB = $vqueryToDB->leftJoin('t_registro', 't_tramites.id_registro', '=', 't_registro.id'); 
        $vqueryToDB = $vqueryToDB->leftJoin('d_personales', 't_registro.id_d_personal', '=', 'd_personales.id'); 
        $vqueryToDB = $vqueryToDB->leftJoin('d_domicilios', 'd_personales.id_d_domicilio', '=', 'd_domicilios.id'); 
        $vqueryToDB = $vqueryToDB->leftJoin('c_municipios', 'd_domicilios.id_municipio', '=', 'c_municipios.id'); 
        $vqueryToDB = $vqueryToDB->leftJoin('c_status', 't_tramites.id_status', '=', 'c_status.id'); 
        $vqueryToDB = $vqueryToDB->leftJoin('t_tramite_constancia', 't_tramites.id', '=', 't_tramite_constancia.id_tramite'); 
              
        if(array_key_exists('id_tramite', $vfiltros)){
            $filtro= $vfiltros["id_tramite"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro)
            {
                $sql->where('t_tramites.id','=', $filtro);
            });
        }

        $vqueryToDB = $vqueryToDB->where('t_tramites.id_tipo_tramite', 1);
        $vqueryToDB = $vqueryToDB->whereNull('t_tramites.deleted_at');     
       
        return $vqueryToDB;
    }

    public static function queryToGeneralesDB($vfiltros=[])
     {
        /**
         * Consulta para obtener los datos generales de un tramite
         * 11 de Agosto de 2023
         * */
        $vqueryToDB=T_Tramites::select(
            't_tramite_constancia.folio_hacienda',
            't_registro.razon_social_o_nombre',
            't_registro.curp',
            't_registro.rfc',
            't_registro.email as correo',
            't_registro.telefono',
            'c_municipios.nombre as municipio',
            'd_domicilios.codigo_postal',
            'd_domicilios.calle',
            'd_domicilios.num_exterior',
            'd_domicilios.num_interior',
            'd_domicilios.colonia',
            'd_domicilios.entre_calle',
            'd_domicilios.y_calle',
            't_tramites.id_status'
        );        
       
        $vqueryToDB = $vqueryToDB->leftJoin('t_registro', 't_tramites.id_registro', '=', 't_registro.id'); 
        $vqueryToDB = $vqueryToDB->leftJoin('c_status', 't_tramites.id_status', '=', 'c_status.id'); 
        $vqueryToDB = $vqueryToDB->leftJoin('t_tramite_constancia', 't_tramites.id', '=', 't_tramite_constancia.id_tramite'); 
        $vqueryToDB = $vqueryToDB->leftJoin('d_domicilios', 't_registro.id_d_domicilio', '=', 'd_domicilios.id');
        $vqueryToDB = $vqueryToDB->leftJoin('c_municipios', 'd_domicilios.id_municipio', '=', 'c_municipios.id');

        
        if(array_key_exists('id_tramite', $vfiltros)){
            $filtro= $vfiltros["id_tramite"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro)
            {
                $sql->where('t_tramites.id','=', $filtro);
            });
        }

        $vqueryToDB = $vqueryToDB->where('t_tramites.id_tipo_tramite', 1);
        $vqueryToDB = $vqueryToDB->whereNull('t_tramites.deleted_at');     
       
        return $vqueryToDB;
     }

    public static function getRazonSocial($id_tramite){
        $result = T_Tramites::select( 'r.razon_social_o_nombre', 't_tramites.fecha_fin');

        $result= $result->Join('t_registro as r', 't_tramites.id_registro', '=', 'r.id');    

        $result= $result->where('t_tramites.id', $id_tramite)->first();           

        return $result;
    } 

    public static function queryToGraph($vfiltros=[])

     {

        $vqueryToDB=T_Tramites::select(          

            DB::raw('COUNT(CASE WHEN MONTH(created_at) = 1 THEN created_at END) AS enero'),

            DB::raw('COUNT(CASE WHEN MONTH(created_at) = 2 THEN created_at END) AS febrero'),

            DB::raw('COUNT(CASE WHEN MONTH(created_at) = 3 THEN created_at END) AS marzo'),

            DB::raw('COUNT(CASE WHEN MONTH(created_at) = 4 THEN created_at END) AS abril'),

            DB::raw('COUNT(CASE WHEN MONTH(created_at) = 5 THEN created_at END) AS mayo'),

            DB::raw('COUNT(CASE WHEN MONTH(created_at) = 6 THEN created_at END) AS junio'),

            DB::raw('COUNT(CASE WHEN MONTH(created_at) = 7 THEN created_at END) AS julio'),

            DB::raw('COUNT(CASE WHEN MONTH(created_at) = 8 THEN created_at END) AS agosto'),

            DB::raw('COUNT(CASE WHEN MONTH(created_at) = 9 THEN created_at END) AS septiembre'),

            DB::raw('COUNT(CASE WHEN MONTH(created_at) = 10 THEN created_at END) AS octubre'),

            DB::raw('COUNT(CASE WHEN MONTH(created_at) = 11 THEN created_at END) AS noviembre'),

            DB::raw('COUNT(CASE WHEN MONTH(created_at) = 12 THEN created_at END) AS diciembre')

        );
    
        if(array_key_exists('anio', $vfiltros)){
            $filtro= $vfiltros["anio"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro){
                if($filtro!=0) { 
                    $sql->whereYear('t_tramites.created_at', $filtro);
                }                    
            });
        }

        $vqueryToDB = $vqueryToDB->where('t_tramites.id_tipo_tramite', 1);
        $vqueryToDB=$vqueryToDB->whereNull('deleted_at');

        return $vqueryToDB;

     }

    public static function queryToValida($vfiltros=[]){
        $vqueryToDB = T_Tramites::select(
            't_tramites.folio',
            't_registro.razon_social_o_nombre',
            't_registro.curp',
            't_registro.telefono',
            't_registro.rfc',
            't_registro.email',
            'c_tipo_tramite.clave as cve_tipo_tramite',
            'c_tipo_tramite.nombre as tipo_tramite',
            'c_status.nombre as status',
            't_tramites.fecha_inicio',
           
            't_tramites.firma',
            't_tramites.no_serie_firma',
            't_tramites.fecha_firma',
            't_tramites.secuencia_firma',
            't_tramites.responsable_firma'
        );

        $vqueryToDB = $vqueryToDB->leftJoin('t_registro', 't_tramites.id_registro', '=', 't_registro.id'); 
        $vqueryToDB= $vqueryToDB->Join('c_tipo_tramite', 't_tramites.id_tipo_tramite', '=', 'c_tipo_tramite.id');
        $vqueryToDB= $vqueryToDB->Join('c_status', 't_tramites.id_status', '=', 'c_status.id');

        if(array_key_exists('id_tramite', $vfiltros)){
            $filtro= $vfiltros["id_tramite"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro)
            {
                $sql->where('t_tramites.id','=', $filtro);
            });
        }

        $vqueryToDB = $vqueryToDB->where('t_tramites.id_tipo_tramite', 1);
        $vqueryToDB = $vqueryToDB->whereNull('t_tramites.deleted_at'); 
        
        return $vqueryToDB;
    }

    public static function queryToValidaDiploma($vfiltros=[]){
        $vqueryToDB = T_Tramites::select(
            't_tramites.folio',
            't_registro.razon_social_o_nombre',
            't_registro.curp',
            't_tramites.fecha_inicio',
            't_tramites.fecha_fin',
            'c_tipo_tramite.clave as cve_tipo_tramite',
            'c_tipo_tramite.nombre as tipo_tramite',
            'c_status.nombre as status',
            't_tramites.responsable_firma'
        );

        $vqueryToDB = $vqueryToDB->leftJoin('t_registro', 't_tramites.id_registro', '=', 't_registro.id'); 
        $vqueryToDB= $vqueryToDB->Join('c_tipo_tramite', 't_tramites.id_tipo_tramite', '=', 'c_tipo_tramite.id');
        $vqueryToDB= $vqueryToDB->Join('c_status', 't_tramites.id_status', '=', 'c_status.id');

        if(array_key_exists('id_tramite', $vfiltros)){
            $filtro= $vfiltros["id_tramite"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro)
            {
                $sql->where('t_tramites.id','=', $filtro);
            });
        }

        $vqueryToDB = $vqueryToDB->where('t_tramites.id_tipo_tramite', 2);
        $vqueryToDB = $vqueryToDB->whereNull('t_tramites.deleted_at'); 
        
        return $vqueryToDB;
    }

    public static function queryToCountRptDB($data=[]){
        $vqueryToDB =  T_Tramites::select(
            'c_municipios.clave',
            'c_municipios.nombre as municipio',
            DB::raw(
                '
                    COUNT( CASE WHEN MONTH(t_tramites.created_at) = 1 THEN 1 END) AS Enero,
                    COUNT( CASE WHEN MONTH(t_tramites.created_at) = 2 THEN 2 END) AS Febrero,
                    COUNT( CASE WHEN MONTH(t_tramites.created_at) = 3 THEN 3 END) AS Marzo,
                    COUNT( CASE WHEN MONTH(t_tramites.created_at) = 4 THEN 4 END) AS Abril,
                    COUNT( CASE WHEN MONTH(t_tramites.created_at) = 5 THEN 5 END) AS Mayo,
                    COUNT( CASE WHEN MONTH(t_tramites.created_at) = 6 THEN 6 END) AS Junio,
                    COUNT( CASE WHEN MONTH(t_tramites.created_at) = 7 THEN 7 END) AS Julio,
                    COUNT( CASE WHEN MONTH(t_tramites.created_at) = 8 THEN 8 END) AS Agosto,
                    COUNT( CASE WHEN MONTH(t_tramites.created_at) = 9 THEN 9 END) AS Septiembre,
                    COUNT( CASE WHEN MONTH(t_tramites.created_at) = 10 THEN 10 END) AS Octubre,
                    COUNT( CASE WHEN MONTH(t_tramites.created_at) = 11 THEN 11 END) AS Noviembre,
                    COUNT( CASE WHEN MONTH(t_tramites.created_at) = 12 THEN 12 END) AS Diciembre,
                    COUNT(*) as total
                '
            )
        );        

        $vqueryToDB= $vqueryToDB->Join('t_registro', 't_tramites.id_registro', '=', 't_registro.id');
        $vqueryToDB= $vqueryToDB->leftJoin('d_domicilios', 't_registro.id_d_domicilio', '=', 'd_domicilios.id');
        $vqueryToDB= $vqueryToDB->leftJoin('c_municipios', 'd_domicilios.id_municipio', '=', 'c_municipios.id');

        if(array_key_exists('anio', $data)){
            $filtro= $data["anio"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro)
            {
                $sql->whereRaw('YEAR(t_tramites.created_at)='.$filtro);
            });
        }

        $vqueryToDB = $vqueryToDB->where('t_tramites.id_tipo_tramite', 1);
        $vqueryToDB= $vqueryToDB->where('c_municipios.id_estado', 7);       
        $vqueryToDB= $vqueryToDB->groupBy(DB::raw('c_municipios.clave WITH ROLLUP'));

        return $vqueryToDB; 
    }

    public static function queryToEstadisticaMpioDB($data=[]){
        $vqueryToDB =  T_Tramites::select(
            'c_regiones.clave as clave_region',
            'c_regiones.nombre as region', 
            'c_municipios.nombre as municipio',
            DB::raw('COUNT(*) as total')
        );        

        $vqueryToDB= $vqueryToDB->Join('t_registro', 't_tramites.id_registro', '=', 't_registro.id');
        $vqueryToDB= $vqueryToDB->leftJoin('d_domicilios', 't_registro.id_d_domicilio', '=', 'd_domicilios.id');
        $vqueryToDB= $vqueryToDB->leftJoin('c_municipios', 'd_domicilios.id_municipio', '=', 'c_municipios.id');
        $vqueryToDB= $vqueryToDB->leftJoin('c_regiones', 'c_municipios.id_region', '=', 'c_regiones.id');

        if($data["f_inicio"] != NULL)
        {
            if(array_key_exists('f_inicio', $data)){
                $filtro= $data["f_inicio"];
                
               $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro){
                    $sql->where('t_tramites.created_at','>=',$filtro.' 00:00:00');
                }); 
                       
            }
        }

        if($data["f_fin"] != NULL)
        {
            if(array_key_exists('f_fin', $data)){
                $filtro= $data["f_fin"];
                
               $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro){
                    $sql->where('t_tramites.created_at','<=',$filtro.' 23:59:59');
                }); 
                       
            }
        }

        $vqueryToDB = $vqueryToDB->where('t_tramites.id_tipo_tramite', 1);
        $vqueryToDB= $vqueryToDB->groupBy(DB::raw('c_regiones.clave WITH ROLLUP'));       

        return $vqueryToDB; 
    }

    public static function queryToDetailMpio($data=[]){
        $vqueryToDB =  T_Tramites::select(
            't_registro.curp',
            't_registro.razon_social_o_nombre',           
            't_tramite_constancia.folio_hacienda',
            't_tramites.fecha_inicio',
            't_tramites.fecha_fin',
            't_tramites.fecha_envio',
            't_tramites.folio',
            'c_status.nombre as status'
        );        

        $vqueryToDB= $vqueryToDB->Join('t_tramite_constancia', 't_tramite_constancia.id_tramite', '=', 't_tramites.id');
        $vqueryToDB= $vqueryToDB->Join('t_registro', 't_tramites.id_registro', '=', 't_registro.id');
        $vqueryToDB= $vqueryToDB->leftJoin('d_domicilios', 't_registro.id_d_domicilio', '=', 'd_domicilios.id');
        $vqueryToDB= $vqueryToDB->leftJoin('c_municipios', 'd_domicilios.id_municipio', '=', 'c_municipios.id');
        $vqueryToDB= $vqueryToDB->leftJoin('c_regiones', 'c_municipios.id_region', '=', 'c_regiones.id');
        $vqueryToDB= $vqueryToDB->leftJoin('c_status', 't_tramites.id_status', '=', 'c_status.id');

        $vqueryToDB = $vqueryToDB->where('t_tramites.id_tipo_tramite', 1);
        
        if($data["f_inicio"] != NULL)
        {
            if(array_key_exists('f_inicio', $data)){
                $filtro= $data["f_inicio"];
                
               $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro){
                    $sql->where('t_tramites.created_at','>=',$filtro.' 00:00:00');
                }); 
                       
            }
        }

        if($data["f_fin"] != NULL)
        {
            if(array_key_exists('f_fin', $data)){
                $filtro= $data["f_fin"];
                
               $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro){
                    $sql->where('t_tramites.created_at','<=',$filtro.' 23:59:59');
                }); 
                       
            }
        }

        if($data["id_municipio"] > 0)
        {
            if(array_key_exists('id_municipio', $data)){
                $filtro= $data["id_municipio"];
                
               $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro){
                    $sql->where('c_municipios.id','=',$filtro);
                }); 
                       
            }
        }

        return $vqueryToDB; 
    }




    /*************************************************************************/

    public static function queryToSearchTramitesUserDB($vfiltros=[])
     {
        /**
         * Consulta principal a la tabla t_tramites para buscar tramites
         * 07 de Septiembre de 2023
         * */
        $vqueryToDB=T_Tramites::select(
            't_tramites.*'
        );        
             
        if(array_key_exists('id_registro', $vfiltros)){
            $filtro= $vfiltros["id_registro"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro)
            {
                $sql->where('t_tramites.id_registro','=', $filtro);
            });
        }

        //$vqueryToDB = $vqueryToDB->where('t_tramites.id_tipo_tramite', 1);  
        $vqueryToDB = $vqueryToDB->whereNull('t_tramites.deleted_at'); 
        return $vqueryToDB;
     }


    /*Consultas para las solicitudes de hospital*/    
    public static function queryToHospitalDB($vfiltros=[])
     {
        /**
         * Consulta principal a la tabla t_tramites para traer el listado de tramites
         * 11 de Agosto de 2023
         * */
        $vqueryToDB=T_Tramites::select(
            't_tramites.id',
            't_tramites.folio',
            'c_status.nombre as status',
            'c_status.color as status_color',
            't_tramites.fecha_inicio',
            't_tramites.fecha_fin',
            't_registro.razon_social_o_nombre',
            't_registro.curp',
            't_registro.telefono',
            't_tramites.id_status'
        );        
       
        $vqueryToDB = $vqueryToDB->leftJoin('t_registro', 't_tramites.id_registro', '=', 't_registro.id'); 
        $vqueryToDB = $vqueryToDB->leftJoin('c_status', 't_tramites.id_status', '=', 'c_status.id'); 
        $vqueryToDB = $vqueryToDB->leftJoin('t_tramite_constancia', 't_tramites.id', '=', 't_tramite_constancia.id_tramite'); 
        
        if(array_key_exists('id_usuario_r', $vfiltros)){
            $filtro= $vfiltros["id_usuario_r"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro)
            {
                $sql->where('t_tramites.id_usuario_r','=', $filtro);
            });
        }

        if(array_key_exists('id_status', $vfiltros)){
            $filtro= $vfiltros["id_status"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro)
            {
                $sql->where('t_tramites.id_status','=', $filtro);
            });
        }

        if(array_key_exists('anio', $vfiltros)){
            $filtro= $vfiltros["anio"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro){
                if($filtro!=0) { 
                    $sql->whereRaw('YEAR(t_tramites.created_at)='.$filtro);
                }                    
            });
        }

        if(array_key_exists('id_tramite', $vfiltros)){
            $filtro= $vfiltros["id_tramite"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro)
            {
                $sql->where('t_tramites.id','=', $filtro);
            });
        }

        $vqueryToDB = $vqueryToDB->where('t_tramites.id_tipo_tramite', 2);  
        $vqueryToDB = $vqueryToDB->whereNull('t_tramites.deleted_at');  

        if(array_key_exists('limit', $vfiltros)){
            $filtro= $vfiltros["limit"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro)
            {
                $sql->limit($filtro);
            });
        }   
       
        return $vqueryToDB;
     }

    public static function queryToGralHospitalDB($vfiltros=[])
     {
        /**
         * Consulta para obtener los datos generales de un tramite
         * 11 de Agosto de 2023
         * */
        $vqueryToDB=T_Tramites::select(
            't_tramite_constancia.folio_hacienda',
            't_registro.razon_social_o_nombre',
            't_registro.curp',           
            't_tramites.id_status',
            'c_hospitales.nombre as hospital'
        );        
       
        $vqueryToDB = $vqueryToDB->leftJoin('t_registro', 't_tramites.id_registro', '=', 't_registro.id'); 
        $vqueryToDB = $vqueryToDB->leftJoin('c_status', 't_tramites.id_status', '=', 'c_status.id'); 
        $vqueryToDB = $vqueryToDB->leftJoin('t_tramite_constancia', 't_tramites.id', '=', 't_tramite_constancia.id_tramite'); 
        $vqueryToDB = $vqueryToDB->leftJoin('c_hospitales', 't_registro.id_hospital', '=', 'c_hospitales.id');
       
        
        if(array_key_exists('id_tramite', $vfiltros)){
            $filtro= $vfiltros["id_tramite"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro)
            {
                $sql->where('t_tramites.id','=', $filtro);
            });
        }

        $vqueryToDB = $vqueryToDB->where('t_tramites.id_tipo_tramite', 2);
        $vqueryToDB = $vqueryToDB->whereNull('t_tramites.deleted_at');     
       
        return $vqueryToDB;
     }

    public static function queryToDetailsHospitalDB($vfiltros=[])
    {
        /**
         * Consulta principal a la tabla t_tramites para traer el listado de tramites
         * 11 de Agosto de 2023
         * */
        $vqueryToDB=T_Tramites::select(           
            't_tramites.folio',
            'c_status.nombre as status',
            'c_status.color as status_color',
            't_tramites.fecha_inicio',
            't_tramites.fecha_fin',
            't_tramite_constancia.folio_hacienda',
            't_registro.razon_social_o_nombre',
            't_registro.curp',
            'c_hospitales.nombre as hospital'
        );        
       
        $vqueryToDB = $vqueryToDB->leftJoin('t_registro', 't_tramites.id_registro', '=', 't_registro.id'); 
        $vqueryToDB = $vqueryToDB->leftJoin('d_personales', 't_registro.id_d_personal', '=', 'd_personales.id');
        $vqueryToDB = $vqueryToDB->leftJoin('c_hospitales', 't_registro.id_hospital', '=', 'c_hospitales.id'); 
        $vqueryToDB = $vqueryToDB->leftJoin('c_status', 't_tramites.id_status', '=', 'c_status.id'); 
        $vqueryToDB = $vqueryToDB->leftJoin('t_tramite_constancia', 't_tramites.id', '=', 't_tramite_constancia.id_tramite'); 
              
        if(array_key_exists('id_tramite', $vfiltros)){
            $filtro= $vfiltros["id_tramite"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro)
            {
                $sql->where('t_tramites.id','=', $filtro);
            });
        }

        $vqueryToDB = $vqueryToDB->where('t_tramites.id_tipo_tramite', 2);
        $vqueryToDB = $vqueryToDB->whereNull('t_tramites.deleted_at');     
       
        return $vqueryToDB;
    }

    public static function queryToGraphHospital($vfiltros=[])

     {

        $vqueryToDB=T_Tramites::select(          

            DB::raw('COUNT(CASE WHEN MONTH(created_at) = 1 THEN created_at END) AS enero'),

            DB::raw('COUNT(CASE WHEN MONTH(created_at) = 2 THEN created_at END) AS febrero'),

            DB::raw('COUNT(CASE WHEN MONTH(created_at) = 3 THEN created_at END) AS marzo'),

            DB::raw('COUNT(CASE WHEN MONTH(created_at) = 4 THEN created_at END) AS abril'),

            DB::raw('COUNT(CASE WHEN MONTH(created_at) = 5 THEN created_at END) AS mayo'),

            DB::raw('COUNT(CASE WHEN MONTH(created_at) = 6 THEN created_at END) AS junio'),

            DB::raw('COUNT(CASE WHEN MONTH(created_at) = 7 THEN created_at END) AS julio'),

            DB::raw('COUNT(CASE WHEN MONTH(created_at) = 8 THEN created_at END) AS agosto'),

            DB::raw('COUNT(CASE WHEN MONTH(created_at) = 9 THEN created_at END) AS septiembre'),

            DB::raw('COUNT(CASE WHEN MONTH(created_at) = 10 THEN created_at END) AS octubre'),

            DB::raw('COUNT(CASE WHEN MONTH(created_at) = 11 THEN created_at END) AS noviembre'),

            DB::raw('COUNT(CASE WHEN MONTH(created_at) = 12 THEN created_at END) AS diciembre')

        );
    
        if(array_key_exists('anio', $vfiltros)){
            $filtro= $vfiltros["anio"];
            $vqueryToDB= $vqueryToDB->where( function($sql) use ($filtro){
                if($filtro!=0) { 
                    $sql->whereYear('t_tramites.created_at', $filtro);
                }                    
            });
        }

        $vqueryToDB = $vqueryToDB->where('t_tramites.id_tipo_tramite', 2);
        $vqueryToDB=$vqueryToDB->whereNull('deleted_at');

        return $vqueryToDB;

     }
 }