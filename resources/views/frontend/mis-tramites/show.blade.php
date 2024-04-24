@extends('layouts.frontend')

@section('meta')
	<meta name="csrf-token" content="{{ csrf_token() }}" />		
@endsection

@section('styles')
@endsection

@section('js')	
    <script src="{{ asset('js/generales/jsHeader.js') }}"></script>
    <script src="{{ asset('js/frontend/jsDetalle.js') }}"></script>
@endsection

@section('buttons')		
	<div class="btn btn-list">		
		<a href="{{ route($current_route.'.index') }}" class="btn ripple btn-outline-dark"><i class="fa fa-reply"></i> <b>Regresar</b></a>
	</div>	
@endsection

@section('title')
	<h2 class="main-content-title tx-24 mg-b-5">Detalles del trámite</h2>
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item">{!! html_entity_decode(link_to_route($current_route.'.index', $title, null, [])) !!}</li>
    <li class="breadcrumb-item active">Expediente</li>
@endsection

@section('script')	
	encabezado();
	datos_documentos();
@endsection

@section('content')
	<div id="dvHeader" name="dvHeader" class="dvHeader"></div>
	<input type="hidden" id="id_tramite" name="id_tramite" value="{{$id}}">

	<div class="row">
        <div class="col-lg-12 col-md-12">
            <div class="card custom-card">
                <div class="card-body">
                	<div class="row">
						<div class="col-lg-12 col-md-12">
							<div class="main-content-label tx-13 mg-b-20">
								Datos generales del trámite
							</div>
							<div class="table-responsive ">
								<table class="table row table-borderless">
									<tbody class="col-lg-12 col-xl-6 p-0">
										<tr>
											<td><strong>Folio : </strong>{{ $datos->folio }}</td>
										</tr>
										<tr>
											<td><strong>Status : </strong> <span class="badge badge-{{$datos->status_color}}">{{$datos->status}}</span></td>
										</tr>
										<tr>
											<td><strong>Folio de pago : </strong>{{$datos->folio_hacienda}}</td>
										</tr>
									</tbody>
									<tbody class="col-lg-12 col-xl-6 p-0">
										<tr>
											<td><strong>Fecha inicio :</strong> {{$datos->fecha_inicio}}</td>
										</tr>
										<tr>
											<td><strong>Fecha fin :</strong> {{$datos->fecha_fin}}</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-lg-12 col-md-12">
							<div class="border">
                                <div class="bg-light">
                                    <nav class="nav nav-tabs">
                                        <a class="nav-link active" data-toggle="tab" href="#tab1" onclick="datos_documentos();"><i class="fas fa-address-book"></i> Documentación</a>
                                        <a class="nav-link" data-toggle="tab" href="#tab2" onclick="load_observaciones();"><i class="fas fa-search"></i> Observaciones</a>
                                        <a class="nav-link" data-toggle="tab" href="#tab3" onclick="datos_evaluacion();"><i class="fas fa-clipboard-list"></i> Evaluación</a>
                                    </nav>
                                </div>
                                <div class="card-body tab-content">
                                    <div class="tab-pane active show" id="tab1">
                                        <div class="row">
                                            <div class="col-xl-12 col-lg-12 col-md-12">
                                                <div class="card-body"> 
                                                	<div class="main-content-label tx-13 mg-b-20">
														Documentación del trámite
													</div>
                                                	<div class="row">
														<div class="col-lg-12 space-y-5">
															<div id="dvDocumentacion" name="dvDocumentacion"></div>
														</div>
													</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="tab-pane" id="tab2">
                                        <div class="row">
                                            <div class="col-xl-12 col-lg-12 col-md-12">
                                                <div class="card-body">
                                                	<div class="main-content-label tx-13 mg-b-20">
														Observaciones del trámite
													</div>
                                                	<div class="row">
														<div class="col-lg-12 space-y-5">
															<div id="dvTblObservacion" name="dvTblObservacion"></div>
														</div>
													</div>													
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="tab-pane" id="tab3">
                                        <div class="row">
                                            <div class="col-xl-12 col-lg-12 col-md-12">
                                                <div class="card-body"> 
                                                	<div class="main-content-label tx-13 mg-b-20">
														Resultados de la evaluación
													</div>
                                                	<div class="row">
														<div class="col-lg-12 space-y-5">
															<div id="dvDetalleCalificacion" name="dvDetalleCalificacion"></div>
														</div>
													</div>  
                                                </div>
                                            </div>
                                        </div>
                                    </div>                                    
                                </div>
                            </div>
						</div>
					</div>

                </div>
            </div>
        </div>
    </div>


	
@endsection
