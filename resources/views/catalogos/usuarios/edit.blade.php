@extends('layouts.backend')

@section('meta')
    <meta name="csrf-token" content="<?= csrf_token() ?>">
@endsection

@section('css')
  <link href="{{ asset('template_backend/css/cssHeader.css') }}" type="text/css" rel="stylesheet">  
@endsection

@section('title')
  USUARIOS
@endsection

@section('descripcion')
  Editar cuenta de usuario
@endsection

@section('buttons')  
    <a href="{{ route($current_route.'.index') }}" class="btn btn-outline-secondary"><i class="fa fa-fw fa-arrow-rotate-left"></i> Regresar</a>
    <button type="button" class="btn btn-outline-success btn-guardar" id="btn-guardar"><i class="fa fa-fw fa-save"></i> Guardar</button>
@endsection

@section('content') 
  	@include('helpers.headerSimple') 

  	<div class="block block-rounded">
	  	<div class="block-content">
	  		<div id="dvErrors" class="dvErrors"></div>
		    <div class="row">
		    	<div class="col-md-12 col-lg-12">
		        	<form id="frmUsuario" name="frmUsuario" onsubmit="return false;">
		        		<input type="hidden" id="id" name="id" value="{{$id}}">
						@include('catalogos.usuarios.form')
					</form>
				</div>
			</div>
		</div>
	</div>
@endsection

@section('js')
  <script src="{{ asset('backend/usuarios/edit.js') }}"></script>
  <script src="{{ asset('backend/usuarios/showPass.js') }}"></script>
  <script src="{{ asset('backend/validate.js') }}"></script>
@endsection

@section('script')  
@endsection