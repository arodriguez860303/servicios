 @extends('layouts.backend')

@section('meta')
    <meta name="csrf-token" content="<?= csrf_token() ?>">
@endsection

@section('css')
	<link href="{{ asset('template_backend/css/cssHeader.css') }}" type="text/css" rel="stylesheet">  
@endsection

@section('title')
  FOLIOS
@endsection

@section('descripcion')
  Creación de un nuevo folio
@endsection

@section('buttons') 
	<a class="btn btn-outline-secondary" href="{{ route($current_route.'.index') }}"><i class="fa fa-fw fa-arrow-rotate-left"></i> Regresar</a>
	<button type="button" class="btn btn-outline-success btn-guardar" id="btn-guardar"><i class="fa fa-fw fa-save"></i> Guardar</button>
@endsection

@section('content')	
	@include('helpers.headerSimple')
	<div class="block block-rounded">
	  	<div class="block-content">
	  		<div id="dvErrors" class="dvErrors"></div>
		    <div class="row">
		    	<div class="col-md-12 col-lg-12">
		        	<form id="frmFolio" name="frmFolio" onsubmit="return false;">
						@include('folios.form')
					</form>
				</div>
			</div>
		</div>
	</div>
@endsection

@section('js') 	
	<script src="{{ asset('backend/folios/jsCreate.js') }}"></script>
	<script src="{{ asset('backend/validate.js') }}"></script>
@endsection

@section('script')	
@endsection