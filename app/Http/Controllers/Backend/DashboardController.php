<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Models\Backend\T_Tramites;


class DashboardController extends Controller
{
    public function __construct() {
        $this->middleware('auth');
    }

    public function index() 
    { 
      return view('dashboard.index');
    }
    
    public function getResults(Request $vrequest)
    {
        // Descripción: Función para datos del dashboard
        // Creación: Miercoles, 23 de Agosto de 2023
        // Versión: 1.0.0

        $vHTTPCode=200;
        $vresponse=['codigo'=>1, 'mensaje'=>'Exito', 'icono'=>'success'];
        try {
        		$varray=array();

        		$filtro=array();
                $anio = $vrequest->anio;

				$trProceso    = count(T_Tramites::queryToDB(['id_status'=>2, 'anio' => $anio])->get());
				$trObservado  = count(T_Tramites::queryToDB(['id_status'=>8, 'anio' => $anio])->get());
				$trSolventado = count(T_Tramites::queryToDB(['id_status'=>9, 'anio' => $anio])->get());
				$trAceptado   = count(T_Tramites::queryToDB(['id_status'=>10, 'anio' => $anio])->get());
				$trConcluido  = count(T_Tramites::queryToDB(['id_status'=>3, 'anio' => $anio])->get());
				$trCancelado  = count(T_Tramites::queryToDB(['id_status'=>7, 'anio' => $anio])->get());

                $ultimos             = T_Tramites::queryToDB(['limit'=>15, 'anio' => $anio])->get();
                $ultimosHospital     = T_Tramites::queryToHospitalDB(['limit'=>15, 'anio' => $anio])->get();
                $totalPorMes         = T_Tramites::queryToGraph(['anio' => $anio])->first();
                $totalPorMesHospital = T_Tramites::queryToGraphHospital(['anio' => $anio])->first();

                $global              = count(T_Tramites::queryToGlobalDB(['anio' => $anio, 'tipo_tramite'=> 1])->get());
                $globalHospital      = count(T_Tramites::queryToGlobalDB(['anio' => $anio, 'tipo_tramite'=> 2])->get());
		


                $trProcesoHospital    = count(T_Tramites::queryToHospitalDB(['id_status'=>2, 'anio' => $anio])->get());
                $trObservadoHospital  = count(T_Tramites::queryToHospitalDB(['id_status'=>8, 'anio' => $anio])->get());
                $trSolventadoHospital = count(T_Tramites::queryToHospitalDB(['id_status'=>9, 'anio' => $anio])->get());
                $trAceptadoHospital   = count(T_Tramites::queryToHospitalDB(['id_status'=>10, 'anio' => $anio])->get());
                $trConcluidoHospital  = count(T_Tramites::queryToHospitalDB(['id_status'=>3, 'anio' => $anio])->get());
                $trCanceladoHospital  = count(T_Tramites::queryToHospitalDB(['id_status'=>7, 'anio' => $anio])->get());

				$dataGraph = collect(
					[
						"enero"      => $totalPorMes->enero, 
						"febrero"    => $totalPorMes->febrero,
						"marzo"      => $totalPorMes->marzo,
						"abril"      => $totalPorMes->abril,
						"mayo"       => $totalPorMes->mayo,
						"junio"      => $totalPorMes->junio,
						"julio"      => $totalPorMes->julio,
						"agosto"     => $totalPorMes->agosto,
						"septiembre" => $totalPorMes->septiembre,
						"octubre"    => $totalPorMes->octubre,
						"noviembre"  => $totalPorMes->noviembre,
						"diciembre"  => $totalPorMes->diciembre
					]
				);

                $dataGraphHospital = collect(
                    [
                        "enero"      => $totalPorMesHospital->enero, 
                        "febrero"    => $totalPorMesHospital->febrero,
                        "marzo"      => $totalPorMesHospital->marzo,
                        "abril"      => $totalPorMesHospital->abril,
                        "mayo"       => $totalPorMesHospital->mayo,
                        "junio"      => $totalPorMesHospital->junio,
                        "julio"      => $totalPorMesHospital->julio,
                        "agosto"     => $totalPorMesHospital->agosto,
                        "septiembre" => $totalPorMesHospital->septiembre,
                        "octubre"    => $totalPorMesHospital->octubre,
                        "noviembre"  => $totalPorMesHospital->noviembre,
                        "diciembre"  => $totalPorMesHospital->diciembre
                    ]
                );
		
                $varray['totalProceso']      = $trProceso;
                $varray['totalObservado']    = $trObservado;
                $varray['totalSolventado']   = $trSolventado;
                $varray['totalAceptado']     = $trAceptado;
                $varray['totalConcluido']    = $trConcluido;
                $varray['totalCancelado']    = $trCancelado;
                $varray['ultimos']           = $ultimos;
                $varray['ultimosHospital']   = $ultimosHospital;
                $varray['totalPorMes']       = $totalPorMes;
                $varray['dataGraph']         = $dataGraph;
                $varray['dataGrapHospital']  = $dataGraphHospital;
                $varray['global']            = $global;
                $varray['globalHospital']    = $globalHospital;

                $varray['totalProcesoHospital']      = $trProcesoHospital;
                $varray['totalObservadoHospital']    = $trObservadoHospital;
                $varray['totalSolventadoHospital']   = $trSolventadoHospital;
                $varray['totalAceptadoHospital']     = $trAceptadoHospital;
                $varray['totalConcluidoHospital']    = $trConcluidoHospital;
                $varray['totalCanceladoHospital']    = $trCanceladoHospital;

        		$vresponse['respuesta']= $varray;
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

    public function getDetallesResults(Request $vrequest)
    {
    	$anio = $vrequest->anio;
        $id_status = $vrequest->id_status;

        // Descripción: Función para detalles de las solicitudes por status
        // Creación: Viernes, 25 de Agosto de 2023
        // Versión: 1.0.0

        $vHTTPCode=200;
        $vresponse=['codigo'=>1, 'mensaje'=>'Exito', 'icono'=>'success'];
        try {
        		$varray=array();

        		$filtro=array();
                $anio = $vrequest->anio;
                $id_status = $vrequest->id_status;
				$solicitudes    = T_Tramites::queryToDB(['id_status'=>$id_status, 'anio' => $anio])->get();
				
        		$vresponse['respuesta']= $solicitudes;
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

    public function detalles_tramite($id_status, $anio)
    {
    	return view('dashboard.detalle', ['id_status'=>$id_status, 'anio'=>$anio]);
    }

    public function detalles_tramite_hospital($id_status, $anio)
    {
        return view('dashboard.detalle_hospital', ['id_status'=>$id_status, 'anio'=>$anio]);
    }

    public function getResultsHospital(Request $vrequest)
    {
        $anio = $vrequest->anio;
        $id_status = $vrequest->id_status;

        // Descripción: Función para detalles de las solicitudes por status
        // Creación: Viernes, 25 de Agosto de 2023
        // Versión: 1.0.0

        $vHTTPCode=200;
        $vresponse=['codigo'=>1, 'mensaje'=>'Exito', 'icono'=>'success'];
        try {
                $varray=array();

                $filtro=array();
                $anio = $vrequest->anio;
                $id_status = $vrequest->id_status;
                $solicitudes    = T_Tramites::queryToHospitalDB(['id_status'=>$id_status, 'anio' => $anio])->get();
                
                $vresponse['respuesta']= $solicitudes;
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
}
