<div class="row">
	<div class="col-md-6">
		<div class="form-group row m-b-15">
			<label for="nombre" class="col-form-label col-md-3">Nombre*</label>
			<div class="col-md-9">
				{!! Form::text('nombre', null, ['id'=>'nombre', 'placeholder'=>'',  'class'=>'form-control m-b-5']) !!}				
				<div id="el-nombre" class="invalid-feedback lbl-error"></div>
			</div>
		</div>
		<div class="form-group row m-b-15">
			<label for="ap_paterno" class="col-form-label col-md-3">A. paterno*</label>
			<div class="col-md-9">
				{!! Form::text('ap_paterno', null, ['id'=>'ap_paterno', 'placeholder'=>'',  'class'=>'form-control m-b-5']) !!}				
				<div id="el-ap_paterno" class="invalid-feedback lbl-error"></div>
			</div>
		</div>
		<div class="form-group row m-b-15">
			<label for="ap_materno" class="col-form-label col-md-3">A. materno*</label>
			<div class="col-md-9">
				{!! Form::text('ap_materno', null, ['id'=>'ap_materno', 'placeholder'=>'',  'class'=>'form-control m-b-5']) !!}				
				<div id="el-ap_materno" class="invalid-feedback lbl-error"></div>
			</div>
		</div>
	</div>

	<div class="col-md-6">
		<div class="form-group row m-b-15">
			<label for="curp" class="col-form-label col-md-3">Curp*</label>
			<div class="col-md-9">
				{!! Form::text('curp', null, ['id'=>'curp', 'placeholder'=>'',  'class'=>'form-control m-b-5', 'oninput'=>"validarCurp(this)", 'maxlength'=>18]) !!}
				<pre id="resCurp"></pre>		
				<div id="el-curp" class="invalid-feedback lbl-error"></div>
			</div>
		</div>

		<div class="form-group row m-b-15">
			<label for="id_hospital" class="col-form-label col-md-3">Hospital al que pertenece*</label>
			<div class="col-md-9">
				<select id="id_hospital" name="id_hospital"  class="form-control default-select2" data-size="10" data-live-search="true" data-style="btn-white"></select>
				<div id="el-id_hospital" class="invalid-feedback lbl-error"></div>			
			</div>
		</div>
	</div>
</div>

<legend>Cuenta de usuario</legend>
<p><b>Advertencia:</b> La contraseña deberá tener por lo menos <b>10 caracteres</b> de longitud, contener por lo menos <b>1 número</b>, <b>1 letra minúscula</b>, <b>1 letra mayúscula</b> y <b>1 caracter especial</b>(@$!%*#?&.).</p>
<div class="row">
	<div class="col-md-6">
		<div class="form-group row m-b-15">
			<label for="nickname" class="col-form-label col-md-3">Usuario*</label>
			<div class="col-md-9">
				{!! Form::text('nickname', null, ['id'=>'nickname', 'placeholder'=>'',  'class'=>'form-control m-b-5']) !!}				
				<div id="el-nickname" class="invalid-feedback lbl-error"></div>
			</div>
		</div>
	</div>
	<div class="col-md-6"></div>
</div>
<div class="row">
	
	<div class="col-md-6">
		<div class="form-group row m-b-15">
			<label for="password" class="col-form-label col-md-3">Contraseña*</label>
			<div class="col-md-9">
				{!! Form::password('password', ['id'=>'password', 'placeholder'=>'',  'class'=>'form-control m-b-5', 'data-toggle'=>'password', 'data-placement'=>'after']) !!}				
				<div id="el-password" class="invalid-feedback lbl-error"></div>
			</div>
		</div>
	</div>
	<div class="col-md-6">
		<div class="form-group row m-b-15">
			<label for="password_confirmation" class="col-form-label col-md-3">Confirmación*</label>
			<div class="col-md-9">
				{!! Form::password('password_confirmation', ['id'=>'password_confirmation', 'placeholder'=>'',  'class'=>'form-control m-b-5', 'data-toggle'=>'password', 'data-placement'=>'after']) !!}				
				<div id="el-password_confirmation" class="invalid-feedback lbl-error"></div>
			</div>
		</div>		
	</div>
</div>

<div class="form-group row m-b-0">
	
	<div class="col-md-12 col-sm-12 text-right">
		<a class="btn btn-dark text-white " href="/servicios-dipris" role="button">Regresar</a>
		{!! Form::button('Crear cuenta', ['class' => 'btn btn-primary', 'type' => 'button', 'data-uk-tooltip'=>'{pos:bottom}', 'title'=>'Guardar', 'onclick'=>'save(this);']) !!}
	</div>
</div>