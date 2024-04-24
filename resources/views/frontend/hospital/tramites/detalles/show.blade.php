@extends('layouts.frontend_hospital')

@section('meta')
	<meta name="csrf-token" content="{{ csrf_token() }}" />		
@endsection

@section('css')
@endsection

@section('js')
	<script src="{{ asset('js/generales/jsHeaderHospital.js') }}"></script>
	<script src="{{ asset('js/hospital/jsDetalle.js') }}"></script>
@endsection

@section('breadcrumb')
	<li class="breadcrumb-item active">Detalles del tramite</li>
@endsection

@section('script')
	encabezado();
	datos_documentos();
	load_observaciones();
	datos_evaluacion();
@endsection

@section('content')
	<input type="hidden" id="id_tramite" name="id_tramite" value="{{$id}}">

	<div class="row">
		<div class="col-md-12">
			<div class="widget-area-2 proclinic-box-shadow">
				<div class="row">
					<div class="col-md-8">
						<h3 class="widget-title">Detalles del trámite</h3>
					</div>
					<div class="col-md-4" style="text-align: right;">						
						<a href="{{ route('mis-tramites-hospital.index') }}" class="btn btn-outline-secondary btn-sm"><i class="ti-back-left"></i> Regresar</a>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-8 ml-auto">
						<table class="table table-bordered table-striped">
							<tbody>
								<tr>
									<td><strong>Folio</strong></td>
									<td><strong>Status</strong></td>
									<td><strong>Fecha inicio</strong></td>
									<td><strong>Fecha fin</strong></td>
								</tr>

								<tr>
									
									<td>{{ $datos->folio }}</td>
									<td><span class="badge badge-{{$datos->status_color}}">{{$datos->status}}</span></td>
									<td>{{$datos->fecha_inicio}}</td>	
									<td>{{$datos->fecha_fin}}</td>
								</tr>
							</tbody>
						</table>
					</div>			
				</div>

				<div class="proclinic-widget">
					<div class="bd-example bd-example-tabs">
						<ul class="nav nav-tabs" id="myTab" role="tablist">							
							<li class="nav-item">
								<a class="nav-link active show" id="documentacion-tab" data-toggle="tab" href="#documentacion" role="tab" aria-controls="documentacion" aria-selected="false">
									<span class="ti-briefcase"></span> Documentación
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" id="observacion-tab" data-toggle="tab" href="#observacion" role="tab" aria-controls="observacion" aria-selected="true">
									<span class="ti-search"></span> Observaciones
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" id="evaluacion-tab" data-toggle="tab" href="#evaluacion" role="tab" aria-controls="evaluacion" aria-selected="true">
									<span class="ti-receipt"></span> Evaluación
								</a>
							</li>
						</ul>
						<div class="tab-content" id="myTabContent">

							<div class="tab-pane fade active show" id="documentacion" role="tabpanel" aria-labelledby="documentacion-tab">
								<h5 class="card-title">Documentación requerida</h5>
								<div id="dvDocumentacion" name="dvDocumentacion"></div>								
							</div>

							<div class="tab-pane fade" id="observacion" role="tabpanel" aria-labelledby="observacion-tab">
								<h5 class="card-title">Observaciones del trámite</h5>
								<div id="dvTblObservacion" name="dvTblObservacion"></div>								
							</div>

							<div class="tab-pane fade" id="evaluacion" role="tabpanel" aria-labelledby="evaluacion-tab">								
								<h5 class="card-title">Resultados de la evaluación</h5>
								<div id="dvDetalleCalificacion" name="dvDetalleCalificacion"></div>
							</div>

						</div>
					</div>
				</div>
								
			</div>
		</div>
	</div>
@endsection