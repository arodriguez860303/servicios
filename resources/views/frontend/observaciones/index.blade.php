@extends('layouts.frontend')

@section('meta')
	<meta name="csrf-token" content="{{ csrf_token() }}" />		
@endsection

@section('styles')	
	<link href="{{ asset('template/plugins/datatable/dataTables.bootstrap4.min.css') }}" rel="stylesheet"/>
	<link href="{{ asset('template/plugins/datatable/responsivebootstrap4.min.css') }}" rel="stylesheet"/>
	<link href="{{ asset('template/plugins/datatable/fileexport/buttons.bootstrap4.min.css') }}" rel="stylesheet"/>
@endsection

@section('js')	
	<script src="{{ asset('template/plugins/datatable/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('template/plugins/datatable/dataTables.bootstrap4.min.js') }}"></script>    
    <script src="{{ asset('js/generales/jsHeader.js') }}"></script>
    <script src="{{ asset('js/generales/jsHerramientas.js') }}"></script>
    <script src="{{ asset('js/generales/jsValidaInputFile.js') }}"></script>
    <script src="{{ asset('js/frontend/jsObservaciones.js') }}"></script>  
@endsection

@section('buttons')		
	<div class="btn btn-list">
		<button type="button" class="btn ripple btn-outline-primary btn-enviar-solv" id="btn-enviar-solv" style="display: none;" onclick="enviar_solventaciones();"><i class="fa fa-send"></i> <b>Enviar solventaciones</b></button>
		<a href="{{ route('mis-tramites.index') }}" class="btn ripple btn-outline-dark"><i class="fa fa-reply"></i> <b>Regresar</b></a>	
	</div>	
@endsection

@section('title')
	<h2 class="main-content-title tx-24 mg-b-5">Observaciones del tramite</h2>
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item">{!! html_entity_decode(link_to_route('mis-tramites.index', 'Mis trámites', null, [])) !!}</li>
    <li class="breadcrumb-item active">Expediente</li>
@endsection

@section('script')	
	encabezado();	
	cargar_observaciones();
@endsection

@section('content')
	<div id="dvHeader" name="dvHeader" class="dvHeader"></div>	
	<input type="hidden" id="id_tramite" name="id_tramite" value="{{$id_tramite}}">
	<div class="row">
		<div class="col-lg-12">
			<div class="card custom-card overflow-hidden">
				<div class="card-body">
					<div>
						<h6 class="card-title mb-1">Observaciones</h6>
						<p class="text-muted card-sub-title">Listado de observaciones del tramite revisado por la DIPRIS.</p>
					</div>
					<div id="table-observaciones"></div>					
				</div>
			</div>
		</div>
	</div>

	@include('frontend.observaciones.mdlSolventacion')
@endsection