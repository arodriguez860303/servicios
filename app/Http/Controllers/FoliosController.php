<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Models\Catalogos\C_Folios;
use App\Http\Requests\Catalogos\FoliosRequest;
use DB;

class FoliosController extends Controller
{	
    private $route='folios';
    private $_afterFolio;
    public function __construct()
    {
        view()->share('title', 'Folios');
        view()->share('current_route', $this->route);       
    }

    public function getResults(Request $vrequest)
     {
        // Descripción: Función para consultar todos folios
        // Creación: Martes, 22 de Agosto de 2023
        // Versión: 1.0.0

        $vHTTPCode=200;
        $vresponse=['codigo'=>1, 'mensaje'=>'Exito', 'icono'=>'success'];
        try {
            $vfilter=array();
            switch ($vrequest->method) {
                case 'show':
                    $vresponse['respuesta']=C_Folios::find(['id'=>$vrequest->id])->first();
                  break; 
                case 'get':
                    $filtro=array();     
                    $vresponse['respuesta']=C_Folios::lstFolios($filtro)->get();
                  break;               
                default:
                    $vresponse=['codigo'=>0, 'mensaje'=>'Lo sentimos! Metodo no definido.', 'icono'=>'warning'];
                  break;
            }
        }
        catch (Exception $vexception) {
            $vHTTPCode=500;
            $vresponse=[
                'codigo'=>-1,
                'mensaje'=>'Error en el servidor! Comuniquese con su administrador '. $vexception->getMessage(),
                'icono'=>'danger'
            ];
        }
        return response()->json($vresponse, $vHTTPCode);
     }

    public function index() 
    { 
      return view('folios.index');
    }

    public function create(){
        return view('folios.create');
    }

    public function edit($id){        
        return view('folios.edit', ['id'=>$id]);
    }

    public function store(FoliosRequest $request)
    {
    	$vstatusHTTP=201;
        $vresponse=['icono'=>'warning', 'codigo'=> 0, 'mensaje'=> 'No se pudieron insertar los datos, intente de nuevo.'];

        $is_masivo=$request->input('chkRango');
        $multiple=0;
        $folioDe;
        $folioA;

        if($is_masivo!=null)
        {
        	$multiple=1;
           	$folioDe = trim($request->input('txtRangoDe'));
           	$folioA = trim($request->input('txtRangoA'));

           	if($folioDe > $folioA){              

                $vresponse=['icono'=>'warning', 'codigo'=> 0, 'mensaje'=> 'El rango inicial no puede ser mayor al rango final.'];

                return response()->json($vresponse, $vstatusHTTP, [], JSON_HEX_APOS|JSON_HEX_QUOT);
            }
        }
        
        $post = $request->only('id', 'txtFolio');
        $post['id_tipo_tramite'] = 1;

        //valido para saber si es una edicion o una insercion nueva
        if(isset($post['id']))
        {
            $id=$post['id'];
            $datos = C_Folios::find($post['id']);          
        }
        else
        {
            $id=0;
            $datos= new C_Folios;
        }

        try {
                DB::beginTransaction();

                	if($multiple==0)
	                {
	                    $this->_afterFolio = trim($request->input('txtFolio'));
	                    $post['folio']=trim($request->input('txtFolio'));
	                    //guardo los datos
	                    $datos->fill($post)->save(); 
	                    unset($datos);                                  
	                }
	                else
	                {
	                    for ($i=$folioDe; $i <= $folioA ; $i++) { 
	                        $this->_afterFolio = $i;
	                        $datosMasivo= new C_Folios;
	                        //guardo los datos
	                        $post['folio'] = $i;
	                        $datosMasivo->fill($post)->save(); 
	                        unset($datosMasivo);                       
	                    }
	                }

	                if(isset($post['id']))
	                    $msg= "El folio fue modificado satisfactoriamente";                
	                else{
	                    if($multiple==0)
	                        $msg= "El folio fue creado satisfactoriamente";
	                    else
	                        $msg= "Los folios fueron creados satisfactoriamente";
	                }

	                $vresponse=['icono'=>'success', 'codigo'=> 1, 'mensaje'=> $msg];

                DB::commit();
            }
            catch ( Exception $e ) {
	            DB::rollback();

	            $codigoE = $e->errorInfo[1];
	            if($codigoE==1062)
	                $mensajeError = "El folio ".$this->_afterFolio." no se puede ingresar porque ya existe un registro en la base de datos.";
	            else
	                $mensajeError = $e->getMessage();

	            $vstatusHTTP=500;
	            $vrespuesta=[
	                'icono'=>'danger', 
	                'codigo'=> -1, 
	                'message'=> 'Error en el servidor, verifiquelo con el administrador, '. $mensajeError
	            ];
        }
        return response()->json($vresponse, $vstatusHTTP, [], JSON_HEX_APOS|JSON_HEX_QUOT);
    }
}