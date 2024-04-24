@extends('layouts.frontend_cuenta')

@section('styles')	
@endsection

@section('js')	
	<script src="{{ asset('template/plugins/bootstrap-show-password/dist/bootstrap-show-password.js') }}"></script>	
	<script src="{{ asset('js/registro/crear-cuenta-hospital.js') }}"></script>	
	<script src="{{ asset('js/registro/jsExpresionesRegulares.js') }}"></script>	
@endsection

@section('breadcrumbs')    
@endsection

@section('script')	
@endsection

@section('content')
<style>
#resCurp {
    background-color: red;
    color: white;
    font-weight: bold;
}
#resCurp.ok {
    background-color: green;
}

#resRfc {
    background-color: red;
    color: white;
    font-weight: bold;
}
#resRfc.ok {
    background-color: green;
}

#resCorreo {
    background-color: red;
    color: white;
    font-weight: bold;
}
#resCorreo.ok {
    background-color: green;
}
</style>

	<h3>Crear cuenta para servicios hospitalarios</h3>
	<div class="panel panel-inverse">
		<div class="panel-heading ui-sortable-handle">			
			<h4 class="panel-title">Información del registro</h4>
		</div>		
		<div class="panel-body">
		    {!! Form::open(['route' => 'crear-cuenta.store-hospitales', 'method' => 'POST' , 'files' => true, 'id' => 'frm-1', 'enctype'=>'multipart/form-data', 'accept-charset'=>'UTF-8'], ['role' => 'form']) !!} 		    	
		        <div class="hpanel">
		            <div class="panel-body">
		                @include('frontend.crear-cuenta.hospital.form')
		            </div>
		        </div>
		    {!! Form::close() !!}
		</div>
	</div>
@endsection