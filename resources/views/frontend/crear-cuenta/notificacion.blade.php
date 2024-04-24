@extends('layouts.frontend_cuenta')

@section('styles')	
@endsection

@section('js')	
@endsection

@section('breadcrumbs')    
@endsection

@section('script')	
@endsection

@section('content')

	<div class="panel panel-inverse">			
		<div class="panel-body">
		
			<section class="jumbotron text-center">
		        <div class="container">
		          <h1 class="jumbotron-heading">Notificación</h1>
		          
		          	<div class="row">
		        		<div class="col-md-12">
		        			<p class="lead text-muted">Estimado solicitante, su cuenta de registro para el uso del sistema de Constancia de Manejo Higiénico de Alimentos del DIPRIS, fue creada satisfactoriamente, a continuación se muestran sus datos de registro, se recomienda guardar los datos.</p>

		        			<p><h3>Solicitante: {!! $datos->razon_social !!}</h3></p>	
		        			<p><h3>Nombre de usuario: {!! $datos->nickname !!}</h3></p>	
		        			<p><h3>Contraseña: {!! $datos->recovery_pass !!}</h3></p>	
		        		</div>
		        	</div> 	        

		          <p>
		            <a href="{{ url('/login') }}" class="btn btn-primary my-2">Terminar</a>
		          </p>
		        </div>
	      	</section>
		</div>
	</div>
@endsection