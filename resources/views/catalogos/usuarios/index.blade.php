@extends('layouts.backend')

@section('meta')
    <meta name="csrf-token" content="<?= csrf_token() ?>">
@endsection

@section('css')
  @include('helpers.cssTable')
  <link href="{{ asset('template_backend/css/cssHeader.css') }}" type="text/css" rel="stylesheet">  
@endsection

@section('title')
  USUARIOS
@endsection

@section('descripcion')
  Listado de usuarios registrados en el sistema
@endsection

@section('buttons')  
    <a href="{{ route($current_route.'.create') }}" class="btn btn-outline-info"><i class="fas fa-plus"></i> <b>Nuevo usuario</b></a>
@endsection

@section('content')
  <style>
    .dataTables_filter, .dataTables_info { display: none; }    
  </style>
  @include('helpers.headerWithSearch')

  <div class="block-content block-content-full">
      <div id="table-usuarios" class="table-usuarios"></div>
  </div>
@endsection

@section('js')
  @include('helpers.jsTable')
  <script src="{{ asset('backend/usuarios/index.js') }}"></script>
@endsection

@section('script')
  $("._usuarios").addClass("active");
@endsection