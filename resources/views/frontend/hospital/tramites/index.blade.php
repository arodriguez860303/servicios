@extends('layouts.frontend_hospital')

@section('meta')
	<meta name="csrf-token" content="{{ csrf_token() }}" />		
@endsection

@section('css')
	<link href="{{ asset('template_hospital/datatable/dataTables.bootstrap4.min.css') }}" rel="stylesheet"/>
@endsection

@section('js')
	<script src="{{ asset('js/generales/jsHeaderHospital.js') }}"></script>
	<script src="{{ asset('template_hospital/datatable/jquery.dataTables.min.js') }}"></script>
	<script src="{{ asset('template_hospital/datatable/dataTables.bootstrap4.min.js') }}"></script>
	<script src="{{ asset('js/hospital/index.js') }}"></script>
@endsection

@section('breadcrumb')
	<li class="breadcrumb-item active">Historial de tramites</li>
@endsection

@section('script')
	encabezado();
	existe_tramite();
@endsection

@section('content')
	<div class="row">
		<div class="col-md-12">
			<div class="widget-area-2 proclinic-box-shadow">
				<div class="row">
					<div class="col-md-8">
						<h3 class="widget-title">Historial de trámites</h3>
					</div>
					<div class="col-md-4" style="text-align: right;">						
						<a href="{{ route('mis-tramites-hospital.create') }}" class="btn btn-outline-secondary btn-sm btn-nuevo"><i class="fa fa-plus"></i> Nuevo trámite</a>
					</div>
				</div>

				<div id="table-tramites"></div>				
			</div>
		</div>
	</div>
@endsection