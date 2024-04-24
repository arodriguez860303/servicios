@extends('layouts.frontend')

@section('meta')
	<meta name="csrf-token" content="{{ csrf_token() }}" />		
@endsection

@section('styles')
  <link href="{{ asset('css/cssInputFile.css') }}" rel="stylesheet"/>     
@endsection

@section('js')  
    <script src="{{ asset('template/plugins/jquery-steps/jquery.steps.min.js') }}"></script>
    <script src="{{ asset('js/generales/jsHeader.js') }}"></script>    
    <script src="{{ asset('js/generales/jsHerramientas.js') }}"></script>
    <script src="{{ asset('js/frontend/jsDatosGenerales.js') }}"></script>
    <script src="{{ asset('js/frontend/jsDocumentos.js') }}"></script>    
    <script src="{{ asset('js/frontend/jsVideo.js') }}"></script>  
    <script src="{{ asset('js/frontend/jsExamen.js') }}"></script>  
    <script src="{{ asset('js/frontend/jsEnviar.js') }}"></script>  
    <script src="{{ asset('js/generales/jsValidaInputFile.js') }}"></script>   
@endsection

@section('buttons')
<div class="btn btn-list">  
    <button class="btn ripple btn-outline-danger btn-cancelar" onclick="cancelar_tramite('frmCancelar');" id="btn-cancelar" style="display: none;"><i class="fas fa-times"></i> <b>Cancelar trámite actual</b></button>
		
	<button class="btn ripple btn-outline-primary btn-enviar" onclick="enviar_tramite('frmEnviar');" id="btn-enviar" style="display: none;"><i class="fe fe-navigation"></i> <b>Enviar trámite</b></button>

    <a href="{{ route($current_route.'.index') }}" class="btn ripple btn-outline-dark"><i class="fa fa-reply"></i> <b>Regresar</b></a>
</div>
@endsection

@section('title')
	<h2 class="main-content-title tx-24 mg-b-5">Nuevo trámite</h2>
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item">{!! html_entity_decode(link_to_route($current_route.'.index', $title, null, [])) !!}</li>
    <li class="breadcrumb-item active">Creación de un nuevo trámite</li>
@endsection

@section('script')	
	encabezado();
	datos_generales();
    datos_folio_pago();
    cargar_documentos();
    configMovie();

    $('.btn-generales').attr('onclick', 'confirmarStoreFolio()');
@endsection

@section('content')	
	<div id="dvHeader" name="dvHeader" class="dvHeader"></div>

    <form class="frmEnviar" id="frmEnviar" name="frmEnviar" enctype="multipart/form-data" accept-charset="UTF-8">
    	<input type="hidden" name="_token" id="_token" value="{{ csrf_token() }}" />        
        <input type="hidden" id="id_registro" name="id_registro" value="{{ $id_registro }}">    
    </form>
        <div class="row">
            <div class="col-lg-12 col-md-12">
                <div class="card custom-card">
                    <div class="card-body">
                        <div>
                            <h6 class="card-title mb-2">Información del trámite</h6>
                            <p class="text-muted card-sub-title">Por favor capture toda la informacion solicitada, y cerciorese de que sea correcta.</p>

                            <div class="border">
                                <div class="bg-light">
                                    <nav class="nav nav-tabs">
                                        <a class="nav-link active" data-toggle="tab" href="#tab1"><i class="fe fe-layers"></i> Mis datos <i id="iconGeneral"></i></a>
                                        <a class="nav-link" data-toggle="tab" href="#tab2" id="tabDocumentacion" style="display: none;"><i class="far fa-address-book"></i> Documentación <i id="iconDocumentos"></i></a>
                                        <a class="nav-link" data-toggle="tab" href="#tab3" id="tabVideo" style="display: none;"><i class="fas fa-video"></i> Curso <i id="iconVideo"></i></a>
                                        <a class="nav-link" data-toggle="tab" href="#tab4" id="tabEvaluacion" style="display: none;"><i class="fas fa-clipboard-list"></i> Evaluación <i id="iconExamen"></i></a>
                                    </nav>
                                </div>
                                <div class="card-body tab-content">
                                    <div class="tab-pane active show" id="tab1">
                                        <div class="row">
                                            <div class="col-xl-12 col-lg-12 col-md-12">
                                                <div class="card-body"> 
                                                    @include('frontend.mis-tramites.tab-generales')
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="tab-pane" id="tab2">
                                        <div class="row">
                                            <div class="col-xl-12 col-lg-12 col-md-12">
                                                <div class="card-body"> 
                                                    @include('frontend.mis-tramites.tab-documentos')
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="tab-pane" id="tab3">
                                        <div class="row">
                                            <div class="col-xl-12 col-lg-12 col-md-12">
                                                <div class="card-body"> 
                                                    @include('frontend.mis-tramites.tab-video')
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="tab-pane" id="tab4">
                                        <div class="row">
                                            <div class="col-xl-12 col-lg-12 col-md-12">
                                                <div class="card-body"> 
                                                    <div id="dvExamenPreguntas">
                                                      @include('frontend.mis-tramites.tab-evaluacion')
                                                    </div>

                                                    <div id="dvCalificacionExamen" style="display: none;">
                                                        @include('frontend.mis-tramites.tab-calificacion')
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


    @include('frontend.mis-tramites.mdl_documento')
@endsection