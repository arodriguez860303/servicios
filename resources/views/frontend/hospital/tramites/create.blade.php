@extends('layouts.frontend_hospital')

@section('meta')
	<meta name="csrf-token" content="{{ csrf_token() }}" />		
@endsection

@section('css')	
	<link href="{{ asset('css/wizard.css') }}" type="text/css" rel="stylesheet">   
@endsection

@section('js')
	<script src="{{ asset('js/generales/jsHeaderHospital.js') }}"></script>
	<script src="{{ asset('js/hospital/jsDatosGenerales.js') }}"></script>
	<script src="{{ asset('js/hospital/jsDocumentos.js') }}"></script>
	<script src="{{ asset('js/hospital/jsVideo.js') }}"></script>
	<script src="{{ asset('js/hospital/jsDatosDiploma.js') }}"></script>
	<script src="{{ asset('js/hospital/jsExamen.js') }}"></script>
	<script src="{{ asset('js/generales/jsHerramientas.js') }}"></script>
    <script src="{{ asset('js/generales/jsValidaInputFile.js') }}"></script> 
    <script src="{{ asset('js/hospital/jsEnviar.js') }}"></script>
    <script src="{{ asset('template_hospital/js/jquery.steps.min.js') }}"></script>
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-steps/1.1.0/jquery.steps.min.js"></script> -->
@endsection

@section('breadcrumb')
	<li class="breadcrumb-item active">Nuevo de tramite</li>
@endsection

@section('script')
	encabezado();
	statusConstancia();
	datos_generales();
	configMovie();
@endsection

@section('content')
	<form class="frmEnviar" id="frmEnviar" name="frmEnviar" enctype="multipart/form-data" accept-charset="UTF-8">
    	<input type="hidden" name="_token" id="_token" value="{{ csrf_token() }}" />        
        <input type="hidden" id="id_registro" name="id_registro" value="{{ $id_registro }}">    
    </form>

	<div class="row">
		<div class="col-md-12">
			<div class="widget-area-2 proclinic-box-shadow">
				<div class="row">
					<div class="col-md-6">
						<h3 class="widget-title">Creación de un nuevo trámite</h3>
					</div>
					<div class="col-md-6" style="text-align: right;">			
						<button class="btn ripple btn-outline-danger btn-cancelar btn-sm" onclick="cancelar_tramite('frmCancelar');" id="btn-cancelar"><i class="fa fa-times"></i> <b>Cancelar trámite</b></button>
						<a href="{{ route('mis-tramites-hospital.index') }}" class="btn btn-outline-secondary btn-sm"><i class="ti-back-left"></i> Regresar</a>		
						<button type="button" id="btn-enviar-tramite"  onclick="enviar_tramite('frmEnviar');" class="btn btn-success btn-sm btn-enviar-tramite" style="display: none;">Enviar trámite</button> 
					</div>
				</div>

				<div class="proclinic-widget">
					<div class="bd-example bd-example-tabs">
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item">
								<a class="nav-link active show" id="generales-tab" data-toggle="tab" href="#generales" role="tab" aria-controls="generales" aria-selected="false" onclick="datos_generales();">
									<span class="ti-user"></span> Generales <i id="iconGeneral"></i>
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" id="documentacion-tab" data-toggle="tab" href="#documentacion" role="tab" aria-controls="documentacion" aria-selected="false" onclick="cargar_documentos();">
									<span class="ti-briefcase"></span> Documentación <i id="iconDocumentos"></i>
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" id="curso-tab" data-toggle="tab" href="#curso" role="tab" aria-controls="curso" aria-selected="true">
									<span class="ti-desktop"></span> Curso <i id="iconVideo"></i>
								</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" id="evaluacion-tab" data-toggle="tab" href="#evaluacion" role="tab" aria-controls="evaluacion" aria-selected="true">
									<span class="ti-receipt"></span> Evaluación <i id="iconExamen"></i>
								</a>
							</li>
						</ul>
						<div class="tab-content" id="myTabContent">
							<div class="tab-pane fade active show" id="generales" role="tabpanel" aria-labelledby="generales-tab">
								<h5 class="card-title">Datos generales del solicitante</h5>
								@include('frontend.hospital.tramites.tabGenerales')
							</div>
							<div class="tab-pane fade" id="documentacion" role="tabpanel" aria-labelledby="documentacion-tab">
								<h5 class="card-title">Documentación requerida</h5>
								@include('frontend.hospital.tramites.tabDocumentacion')
							</div>
							<div class="tab-pane fade" id="curso" role="tabpanel" aria-labelledby="curso-tab">								
								<div class="row">
									<div class="col-md-6">
										<h5 class="card-title">Curso de capacitación</h5>	
									</div>
									<div class="col-md-6">
										<div class="pull-right" style="text-align: right;">
								            <button id='btnPlayPause' class='btn ripple btn-outline-success' title='play' accesskey="P" onclick='playPauseVideo();'>Comenzar el curso</button>
								            <button id='btnContinuar' class="btn ripple btn-outline-secondary" onclick="confirmarContinuarSinVer();">Continuar sin ver</button> 
								        </div>		
									</div>
								</div>
								@include('frontend.hospital.tramites.tabCurso')
							</div>
							<div class="tab-pane fade" id="evaluacion" role="tabpanel" aria-labelledby="evaluacion-tab">
								<div id="dvExamenPreguntas">
									<h5 class="card-title">Evaluación</h5>
									@include('frontend.hospital.tramites.tabEvaluacion')
								</div>

								<div id="dvCalificacionExamen" style="display: none;">
                                    @include('frontend.hospital.tramites.tabCalificacion')
                                </div>
							</div>
						</div>
					</div>
				</div>

				
			</div>
		</div>
	</div>
	@include('frontend.hospital.tramites.mdl_documento')
@endsection