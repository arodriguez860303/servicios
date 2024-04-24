<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\HomeController;
use App\Http\Controllers\Frontend\CrearCuentaController;
use App\Http\Controllers\Frontend\MisTramitesController;
use App\Http\Controllers\Frontend\ObservacionesController;
use App\Http\Controllers\Backend\TramitesController;
use App\Http\Controllers\Backend\ImpresionController;
use App\Http\Controllers\Backend\DashboardController;
use App\Http\Controllers\Backend\AdminController;
use App\Http\Controllers\Backend\ReportesController;
use App\Http\Controllers\FoliosController;
use App\Http\Controllers\Catalogos\UsuariosController;
use App\Http\Controllers\CombosController;
use App\Http\Controllers\ValidacionController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
	return redirect('/login');
});

Auth::routes();
Route::get('/home', [HomeController::class, 'index'])->name('home');

/*Rutas para crear cuenta*/
Route::get('crear-cuenta/registro', [CrearCuentaController::class, 'create'])->name('crear-cuenta.registro');
Route::post('crear-cuenta/registro', [CrearCuentaController::class, 'store'])->name('crear-cuenta.store');
Route::get('crear-cuenta/{id}/notificacion', [CrearCuentaController::class, 'notificacion'])->name('crear-cuenta.notificacion');

/*Crear registro para hospitales*/
Route::get('crear-cuenta/registro-hospitales', [CrearCuentaController::class, 'create_hospital'])->name('crear-cuenta.registro-hospitales');
Route::post('crear-cuenta/registro-hospitales', [CrearCuentaController::class, 'store_hospital'])->name('crear-cuenta.store-hospitales');


Route::get('password/recuperar', [CrearCuentaController::class, 'recuperar_password']);

Route::get('tramites-hospital/diploma/{id}/validar', [ValidacionController::class, 'getValidaDiploma']); 

Route::get('tramites/constancia/{id}/validar', [ValidacionController::class, 'getValida']); 

Route::get('tipo/get-municipios', 'CombosController@getMunicipios');
Route::get('tipo/get-tipo-tramite', 'CombosController@getTipoTramite');
Route::get('tipo/get-hospitales', 'CombosController@getHospitales');

/*Grupo de rutas que requieren autenticacion*/
Route::group(['middleware' => ['auth']], function () {		

	Route::get('registro/header', ['as'=>'registro.header','uses' =>'Frontend\MisTramitesController@header']);
	Route::post('tema/cambiar', [HomeController::class, 'cambiar_tema']);
    Route::post('modo-oscuro', [HomeController::class, 'modo_oscuro']);

	/*Inicio Rutas para el frontend*/
	Route::resource('mis-tramites', 'Frontend\MisTramitesController',['except'=>'show']);

	Route::get('mis-tramites/expediente', [MisTramitesController::class, 'getTramites']);

	Route::get('mis-tramites/datos-generales', [MisTramitesController::class, 'datos_generales'])->name('mis-tramites.datos-generales');
	Route::get('mis-tramites/datos-folio-hacienda', [MisTramitesController::class, 'datos_folio_hacienda'])->name('mis-tramites.datos-folio-hacienda');
	Route::post('mis-tramites/guardar-folio-hacienda', [MisTramitesController::class, 'store_folio_pago']);
	Route::post('mis-tramites/subir-documento', ['as'=>'mis-tramites.store-document','uses' =>'Frontend\DocumentacionController@store_document']);
	Route::post('mis-tramites/terminar-curso', [MisTramitesController::class, 'store_curso']);
	Route::post('mis-tramites/examen/responder', [MisTramitesController::class, 'store_examen']); 
	Route::get('mis-tramites/examen/datos', [MisTramitesController::class, 'datos_examen']); 

	Route::post('mis-tramites/examen/nueva-evaluacion', [MisTramitesController::class, 'store_nuevo_examen']); 
	Route::post('mis-tramites/cancelar', [MisTramitesController::class, 'cancelar_tramite']);

	Route::get('mis-tramites/{id_tramite}/observaciones', [ObservacionesController::class, 'observaciones']);
	Route::get('mis-tramites/observaciones/results', [ObservacionesController::class, 'lstObservaciones']);

	Route::post('mis-tramites/solventar-observacion', [ObservacionesController::class, 'solventar']);
	Route::post('mis-tramites/solventaciones/enviar', [ObservacionesController::class, 'enviar_solventaciones']);

	//Busco si ya tengo un tramite
	Route::get('mis-tramites/buscar', [MisTramitesController::class, 'buscar']);

	Route::get('mis-tramites/{id}/detalle', [MisTramitesController::class, 'detalle']);	

	Route::get('documentacion/tramite', ['as'=>'documentacion.tramite','uses' =>'Frontend\DocumentacionController@documentacion_tramite']);
	Route::get('documentacion/{id}/descargar', ['as'=>'documentacion.descargar','uses' =>'Frontend\DocumentacionController@download_adjunto']);
	Route::delete('documentacion/{id}/eliminar', ['as'=>'documentacion.eliminar','uses' =>'Frontend\DocumentacionController@delete_adjunto']);
	/*Fin Rutas para el frontend*/


	/*Inicio Rutas para el backend*/
	//Route::resource('tramites', 'Backend\TramitesController',['except'=>'show']);
	Route::get('tramites/get-results', [TramitesController::class, 'getResults']);
	Route::get('tramites/hospital/get-results', [TramitesController::class, 'getResultsHospital']);

	Route::get('tramites/proceso', [TramitesController::class, 'index_proceso'])->name('tramites.proceso');
	Route::get('tramites/observados', [TramitesController::class, 'index_observado'])->name('tramites.observados');
	Route::get('tramites/solventados', [TramitesController::class, 'index_solventado'])->name('tramites.solventados');
	Route::get('tramites/aceptados', [TramitesController::class, 'index_aceptado'])->name('tramites.aceptados');
	Route::get('tramites/concluidos', [TramitesController::class, 'index_concluido'])->name('tramites.concluidos');
	Route::get('tramites/cancelados', [TramitesController::class, 'index_cancelado'])->name('tramites.cancelados');


	Route::get('tramites/{id_tramite}/detalles', [TramitesController::class, 'show']);
	Route::get('tramites/datos-solicitante', [TramitesController::class, 'datos_generales']);
	Route::get('tramites/datos-generales-tramite', [TramitesController::class, 'datos_generales_tramite']);
	Route::get('tramites/datos-documentacion', [TramitesController::class, 'datos_documentacion']);
	Route::get('tramites/datos-documentacion/{id}/descargar', [TramitesController::class, 'download_adjunto']);
	Route::post('tramites/datos-documentacion/observar', [TramitesController::class, 'agregar_observacion']);
	Route::get('tramites/datos-observaciones', [TramitesController::class, 'getObservaciones']);
	Route::post('tramites/{id_tramite}/enviar-observaciones', [TramitesController::class, 'enviar_observaciones']);
	Route::get('tramites/resultados-evaluacion', [TramitesController::class, 'resultados_examen']);

	Route::get('tramites/datos-solventaciones', [TramitesController::class, 'getSolventaciones']);
	Route::post('tramites/datos-documentacion/aceptar', [TramitesController::class, 'aceptar_documento']);

	Route::post('tramites/datos-solventaciones/aceptar', [TramitesController::class, 'aceptar_solventacion']);
	Route::post('tramites/datos-solventaciones/negar', [TramitesController::class, 'negar_solventacion']);

	Route::post('tramites/autorizar', [TramitesController::class, 'concluir']);
	Route::post('tramites/cancelar', [TramitesController::class, 'cancelar']);
	
	Route::get('admin/tramites/index', [AdminController::class, 'index'])->name('admin.tramites.index');
	Route::post('admin/tramites/eliminar', [AdminController::class, 'eliminar']);

	Route::get('admin/tramites-hospital/index', [AdminController::class, 'index_hospital'])->name('admin.tramites-hospital.index');
	Route::post('admin/tramites-hospital/eliminar', [AdminController::class, 'eliminar_hospital']);
	/*Fin Rutas para el backend*/

	/*Inicio rutas de mantenimiento*/

	Route::get('dashboard/index', [DashboardController::class, 'index'])->name('dashboard.index');
	Route::get('dashboard/get-datos', [DashboardController::class, 'getResults']);
	Route::get('dashboard/tramites/{id_status}/anio/{anio}/detalles', [DashboardController::class, 'detalles_tramite']);
	Route::get('dashboard/get-detalles-solicitudes', [DashboardController::class, 'getDetallesResults']);

	Route::get('dashboard/tramites-hospital/{id_status}/anio/{anio}/detalles', [DashboardController::class, 'detalles_tramite_hospital']);
	Route::get('dashboard/get-solicitudes-hospital', [DashboardController::class, 'getResultsHospital']);


	Route::resource('folios', 'FoliosController',['except'=>'show']);
	Route::get('folios/listado', [FoliosController::class, 'getResults']);

	/*Fin rutas de mantenimiento*/

	/* Inicio rutas para impresion*/
	Route::get('constancia/{id}/imprimir', [ImpresionController::class, 'print_constancia'])->name('constancia.imprimir');	
	/* Termina rutas para impresion*/

	/*Inicio rutas para usuarios*/
	Route::resource('usuarios', 'Catalogos\UsuariosController',['except'=>'show']);
	Route::get('usuarios/get-results', [UsuariosController::class, 'getResults']);
	/*Fin rutas para usuarios*/

	/*Inicio rutas para combos*/
	Route::get('tipo/roles', [CombosController::class, 'tipoRoles']);
	/*Fin rutas para combos*/

	/*Inicio rutas de reportes*/
	Route::get('reportes', [ReportesController::class, 'index'])->name('reportes');
	Route::get('reportes/generar', [ReportesController::class, 'opciones'])->name('reportes.generar');
	/*Fin rutas de reportes*/

	//Rutas para hospital
	require base_path('routes/web_hospital.php');
});