 @extends('layouts.backend')

@section('meta')
    <meta name="csrf-token" content="<?= csrf_token() ?>">
@endsection

@section('css')
  @include('helpers.cssTable')
	<link href="{{ asset('template_backend/css/cssHeader.css') }}" type="text/css" rel="stylesheet">
@endsection

@section('title')
  FOLIOS
@endsection

@section('descripcion')
  Folios para las constancias
@endsection

@section('buttons') 
	<a class="btn btn-outline-info" href="{{ route($current_route.'.create') }}"><i class="fa fa-fw fa-plus"></i> Nuevo</a>	
@endsection

@section('content')
	<style>
    .dataTables_filter, .dataTables_info { display: none; }    
  </style>
  @include('helpers.headerWithSearch')
  <div class="block-content block-content-full">
      <div id="table-folios" class="table-folios"></div>
  </div>
@endsection

@section('js') 	
  @include('helpers.jsTable')
	<script src="{{ asset('backend/folios/jsIndex.js') }}"></script>
@endsection

@section('script')	
@endsection