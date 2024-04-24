<?php

use App\Http\Controllers\Frontend\Hospital\MisTramitesHospitalController;
use App\Http\Controllers\Backend\TramitesHospitalController;
use App\Http\Controllers\Frontend\DocumentacionController;
use App\Http\Controllers\Frontend\Hospital\ObservacionesController;
use App\Http\Controllers\Backend\ImpresionController;

Route::get('registro/header-hospital', ['as'=>'registro.header_hospital','uses' =>'Frontend\Hospital\MisTramitesHospitalController@header_hospital']);

/*Ruta para buscar si ya existe un tramite que no haya sido enviado*/
Route::get('mis-tramites-hospital/buscar', [MisTramitesHospitalController::class, 'buscar']);

Route::resource('mis-tramites-hospital', 'Frontend\Hospital\MisTramitesHospitalController',['except'=>'show']);

/*Ruta para traer el historial de tramites*/
Route::get('mis-tramites-hospital/historial', [MisTramitesHospitalController::class, 'getTramites']);

/*Ruta para cargar los datos generales*/
Route::get('mis-tramites-hospital/generales', [MisTramitesHospitalController::class, 'datos_generales']);

/*Ruta para cargar la documentacion*/
Route::get('documentacion-hospital/tramite', [DocumentacionController::class, 'documentacion_hospital']);

/*Se guarda el archivo cargado*/
Route::post('mis-tramites-hospital/upload-file', [DocumentacionController::class, 'store_document_hospital']);

/*Ruta para eliminar un documento adjunto*/ 
Route::delete('documentacion-hospital/{id}/eliminar', [DocumentacionController::class, 'delete_adjunto_hospital']);

/*Ruta para finalizar el videotutorial*/
Route::post('mis-tramites-hospital/terminar-capacitacion', [MisTramitesHospitalController::class, 'store_capacitacion']);

/*Ruta para consultar los datos de la constancia de hospital*/
Route::get('mis-tramites-hospital/datos-diploma', [MisTramitesHospitalController::class, 'datos_diploma']);

/*Ruta para guardar las respuestas del examen*/
Route::post('mis-tramites-hospital/examen/store', [MisTramitesHospitalController::class, 'store_examen']); 

/*Obtener los resultados del examen*/
Route::get('mis-tramites-hospital/examen/resultados', [MisTramitesHospitalController::class, 'resultados_examen']); 

/*Ruta para volver a presentar la evaluacion*/
Route::post('mis-tramites-hospital/examen/nuevo', [MisTramitesHospitalController::class, 'store_nuevo_examen']); 

/*Rutas para cargar las observaciones*/
Route::get('mis-tramites-hospital/{id_tramite}/observaciones', [ObservacionesController::class, 'observaciones']);
Route::get('mis-tramites-hospital/observaciones/results', [ObservacionesController::class, 'getObservacionesCliente']);

/*Ruta para solventar una observacion*/
Route::post('mis-tramites-hospital/solventar-observacion', [ObservacionesController::class, 'solventar']);

/*Ruta para enviar las solventaciones*/
Route::post('mis-tramites-hospital/solventaciones/enviar', [ObservacionesController::class, 'enviar_solventaciones']);

/*Ruta para ver el detalle de mi solicitud*/
Route::get('mis-tramites-hospital/{id}/show', [MisTramitesHospitalController::class, 'show']);	

/*Ruta para cancelar un tramite desde el lado del cliente*/
Route::post('mis-tramites-hospital/solicitud/cancelar', [MisTramitesHospitalController::class, 'cancelar_tramite']);





/*Rutas para el administrador*/

/*Ruta para consultar solicitudes por status*/
Route::get('tramites-hospital/get-results', [TramitesHospitalController::class, 'getResults']);

/*Ruta para ver los detalles de un tramite*/
Route::get('tramites-hospital/{id_tramite}/detalle', [TramitesHospitalController::class, 'show']);

/*Rutas para cargar las solicitudes por status*/
Route::get('tramites-hospital/proceso', [TramitesHospitalController::class, 'index_proceso'])->name('tramites-hospital.proceso');
Route::get('tramites-hospital/observados', [TramitesHospitalController::class, 'index_observado'])->name('tramites-hospital.observados');
Route::get('tramites-hospital/solventados', [TramitesHospitalController::class, 'index_solventado'])->name('tramites-hospital.solventados');
Route::get('tramites-hospital/aceptados', [TramitesHospitalController::class, 'index_aceptado'])->name('tramites-hospital.aceptados');
Route::get('tramites-hospital/concluidos', [TramitesHospitalController::class, 'index_concluido'])->name('tramites-hospital.concluidos');
Route::get('tramites-hospital/cancelados', [TramitesHospitalController::class, 'index_cancelado'])->name('tramites-hospital.cancelados');

/*Carga los datos generales del tramite*/
Route::get('tramites-hospital/generales-tramite', [TramitesHospitalController::class, 'datos_generales']);

/*Carga los datos del solicitante*/
Route::get('tramites-hospital/datos-solicitante', [TramitesHospitalController::class, 'datos_solicitante']);

/*Carga la documentacion*/
Route::get('tramites-hospital/datos-documentacion', [TramitesHospitalController::class, 'datos_documentacion']);

/*Carga los resultados de la evaluacion*/
Route::get('tramites-hospital/resultados-evaluacion', [TramitesHospitalController::class, 'resultados_examen']);

/*Ruta para descargar un adjunto*/
Route::get('tramites-hospital/documentacion/{id}/descargar', [TramitesHospitalController::class, 'download_adjunto']);

/*Ruta para observar un documento*/
Route::post('tramites-hospital/documentacion/observar', [TramitesHospitalController::class, 'agregar_observacion']);

/*Ruta para cargar las observaciones*/
Route::get('tramites-hospital/get-observaciones', [TramitesHospitalController::class, 'getObservaciones']);

/*Ruta para dar por valido un documento*/
Route::post('tramites-hospital/documentacion/aceptar', [TramitesHospitalController::class, 'aceptar_documento']);

/*Ruta para enviar las observaciones*/
Route::post('tramites-hospital/{id_tramite}/send-observaciones', [TramitesHospitalController::class, 'send_observaciones']);

/*Carga las solventaciones en el administrador*/
Route::get('tramites-hospital/load-solventaciones', [TramitesHospitalController::class, 'getSolventaciones']);

/*Ruta para dar por valida la solventacion de un documento*/
Route::post('tramites-hospital/solventaciones/aceptar', [TramitesHospitalController::class, 'aceptar_solventacion']);

/*Ruta para negar la solventacion de un documento*/
Route::post('tramites-hospital/solventaciones/negar', [TramitesHospitalController::class, 'negar_solventacion']);

/*Ruta para concluir y dar por autorizado un tramite*/
Route::post('tramites-hospital/autorizar', [TramitesHospitalController::class, 'concluir']);

/*Ruta para imprimir el diploma*/
Route::get('tramites-hospital/diploma/{id}/imprimir', [ImpresionController::class, 'print_diploma_hospital'])->name('diploma.imprimir');

/*Ruta para cancelar un tramite*/
Route::post('tramites-hospital/cancelar', [TramitesHospitalController::class, 'cancelar']);