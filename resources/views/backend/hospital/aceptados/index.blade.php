@extends('layouts.backend')

@section('meta')
    <meta name="csrf-token" content="<?= csrf_token() ?>">
@endsection

@section('css')
  @include('helpers.cssTable')
  <link href="{{ asset('template_backend/css/cssHeader.css') }}" type="text/css" rel="stylesheet">  
@endsection

@section('title')
  TRAMITES HOSPITAL
@endsection

@section('descripcion')
  Listado de solicitudes aceptadas para expedicion de Diploma de hospital
@endsection

@section('buttons')  
@endsection

@section('content')
  <style>
    .dataTables_filter, .dataTables_info { display: none; }    
  </style>
  @include('helpers.headerWithSearchH')

  <div class="block-content block-content-full">
      <div id="table-tramites" class="table-tramites"></div>
  </div>
@endsection

@section('js')
  @include('helpers.jsTable')
  <script src="{{ asset('backend/hospital/index_aceptados.js') }}"></script>
@endsection

@section('script')
  $("._aceptadoH").addClass("active");
@endsection