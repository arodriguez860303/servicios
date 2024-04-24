 @extends('layouts.backend')

@section('meta')
    <meta name="csrf-token" content="<?= csrf_token() ?>">
@endsection

@section('css')
	<link href="{{ asset('template_backend/css/cssHeader.css') }}" type="text/css" rel="stylesheet">
	<link href="{{ asset('template_backend/js/plugins/flatpickr/flatpickr.min.css') }}" type="text/css" rel="stylesheet">
	<link href="{{ asset('template_backend/js/plugins/select2/css/select2.min.css') }}" type="text/css" rel="stylesheet">
@endsection

@section('title')
  Reportes
@endsection

@section('descripcion')
  Reportes estadisticos
@endsection

@section('buttons') 	
@endsection

@section('content')
	@include('helpers.headerSimple') 

  	<div class="block block-rounded">
	  	<div class="block-content">
	  		<div id="dvErrors" class="dvErrors"></div>
		    <div class="row">
		    	<div class="col-md-12 col-lg-12">		        	
					@include('reportes.form')					
				</div>
			</div>
		</div>
	</div>
@endsection

@section('js')
	<script src="{{ asset('backend/reportes/index.js') }}"></script>
	<script src="{{ asset('template_backend/js/plugins/flatpickr/flatpickr.min.js') }}"></script>
	<script src="{{ asset('template_backend/js/plugins/select2/js/select2.full.min.js') }}"></script>
@endsection

@section('script')
	$("._reportes").addClass("active");
	One.helpersOnLoad(['js-flatpickr', 'jq-select2']);
@endsection