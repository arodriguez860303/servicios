 @extends('layouts.backend')

@section('meta')
    <meta name="csrf-token" content="<?= csrf_token() ?>">
@endsection

@section('css')
     <link rel="stylesheet" href="{{ asset('template_backend/css/cssInvoice.css') }}">
@endsection

@section('title')
  TRAMITES
@endsection

@section('descripcion')
  Detalles del tramite de Constancia de Manejo Higiénico de Alimentos
@endsection

@section('buttons') 
	<?php 
		$ruta='';
		if($id_status == 2) $ruta = 'proceso';
		else if($id_status == 8) $ruta = 'observados';
		else if($id_status == 5) $ruta = 'solventados';
		else if($id_status == 10) $ruta = 'aceptados';
		else if($id_status == 3) $ruta = 'concluidos';
		else if($id_status == 7) $ruta = 'cancelados';
	?>
	@if($id_status != 7)
	<button type="button" class="btn btn-outline-danger btn-cancelar-tramite" onclick="comfirmCancelarTramite();"><i class="fa fa-fw fa-times"></i> Cancelar trámite</button>
	@endif
	<button type="button" class="btn btn-outline-success btn-autorizar-tramite" id="btn-autorizar-tramite" style="display: none;" onclick="confirmarConclusion();"><i class="fa fa-fw fa-check"></i> Autorizar trámite</button>
	<button type="button" class="btn btn-outline-info btn-observar-tramite" id="btn-observar-tramite" style="display: none;" onclick="confirmarEnvioObs();"><i class="fa fa-fw fa-magnifying-glass"></i> Enviar observaciones</button>
	<a class="btn btn-outline-secondary" href="{{ route('tramites.'.$ruta) }}"><i class="fa fa-fw fa-arrow-rotate-left"></i> Regresar</a>
@endsection

@section('content')
	<input type="hidden" id="id_tramite" name="id_tramite" value="{{$id_tramite}}">
	<input type="hidden" id="id_status_gral_tramite" name="id_status_gral_tramite" value="{{$id_status}}">
	@include('backend.tramites.tab_gral')
	@include('backend.tramites.modal_observacion')
@endsection

@section('js')
 	<script src="{{ asset('backend/validate.js') }}"></script>
 	<script src="{{ asset('backend/tramites/jsSolicitante.js') }}"></script>
 	<script src="{{ asset('backend/tramites/jsConcluir.js') }}"></script>
 	<script src="{{ asset('backend/tramites/jsCancelar.js') }}"></script>
@endsection

@section('script')	
@endsection