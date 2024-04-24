@extends('layouts.frontend_hospital')

@section('meta')
	<meta name="csrf-token" content="{{ csrf_token() }}" />		
@endsection

@section('css')
@endsection

@section('js')
	<script src="{{ asset('js/generales/jsHeaderHospital.js') }}"></script>
	<script src="{{ asset('js/generales/jsHerramientas.js') }}"></script>
	<script src="{{ asset('js/generales/jsValidaInputFile.js') }}"></script>
	<script src="{{ asset('js/hospital/jsObservaciones.js') }}"></script>
@endsection

@section('breadcrumb')
	<li class="breadcrumb-item active">Observaciones del tramite</li>
@endsection

@section('script')
	encabezado();
	load_observaciones();
@endsection

@section('content')
	<input type="hidden" id="id_tramite" name="id_tramite" value="{{$id_tramite}}">
	<div class="row">
		<div class="col-md-12">
			<div class="widget-area-2 proclinic-box-shadow">
				<div class="row">
					<div class="col-md-8">
						<h3 class="widget-title">Observaciones</h3>
					</div>
					<div class="col-md-4" style="text-align: right;">
						<button type="button" class="btn btn-outline-success btn-enviar-solv btn-sm" id="btn-enviar-solv" style="display: none;" onclick="enviar_solventaciones();"><i class="fa fa-send"></i> <b>Enviar solventaciones</b></button>					
						<a href="{{ route('mis-tramites-hospital.index') }}" class="btn btn-outline-dark btn-sm"><i class="fa fa-reply-all"></i> Regresar</a>
					</div>
				</div>

				<div id="table-observaciones"></div>	
				
			</div>
		</div>
	</div>
	@include('frontend.hospital.observaciones.mdlSolventacion')
@endsection