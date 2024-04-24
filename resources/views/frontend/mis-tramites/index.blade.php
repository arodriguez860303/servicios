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
    <script src="{{ asset('js/frontend/jsIndex.js') }}"></script>  
@endsection

@section('buttons')		
	<div class="btn btn-list">		
		<a href="{{ route($current_route.'.create') }}" class="btn ripple btn-outline-primary btn-nuevo"><i class="fas fa-folder-open"></i> <b>Nuevo trámite</b></a>	
	</div>	
@endsection

@section('title')
	<h2 class="main-content-title tx-24 mg-b-5">Historial de tramites</h2>
@endsection

@section('breadcrumb')
    <li class="breadcrumb-item">{!! html_entity_decode(link_to_route($current_route.'.index', $title, null, [])) !!}</li>
    <li class="breadcrumb-item active">Expediente</li>
@endsection

@section('script')	
	encabezado();
	existe_tramite();
	cargar_mis_tramites();
@endsection

@section('content')
	<div id="dvHeader" name="dvHeader" class="dvHeader"></div>
	
	<div class="alert alert-dark mb-0" role="alert" id="dvNotificaObservacion" style="display: none;">
	  	<h4 class="alert-heading text-danger"><b>Usted tiene uno o mas trámites con <strong>"observaciones"</strong>.</b></h4>	  	
	  	<p class="mb-0 text-justify">La Direcci&oacute;n de Protecci&oacute;n contra Riesgos Sanitarios, tendrá por recibida una solicitud, para que se otorgue o niegue la constancia de manejo higienico de alimentos, cuando el solicitante solvente las observaciones.</p>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<div class="card custom-card overflow-hidden">
				<div class="card-body">
					<div>
						<h6 class="card-title mb-1">Trámites</h6>
						<p class="text-muted card-sub-title">Listado de tramites generados por el solicitante.</p>
					</div>
					<div id="table-tramites"></div>					
				</div>
			</div>
		</div>
	</div>	
@endsection