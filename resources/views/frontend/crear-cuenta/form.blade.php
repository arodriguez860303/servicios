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
		<div class="form-group row m-b-15 dvHospital" style="display: none;">
			<label for="id_hospital" class="col-form-label col-md-3">Hospital al que pertenece*</label>
			<div class="col-md-9">
				<select id="id_hospital" name="id_hospital"  class="form-control default-select2" data-size="10" data-live-search="true" data-style="btn-white"></select>
				<div id="el-id_hospital" class="invalid-feedback lbl-error"></div>			
			</div>
		</div>
		<div class="form-group row  m-b-15">
			<label class="col-form-label col-md-3">Género*</label>
			<div class="col-md-9">
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="sexo" id="sexo_1" value="1" {{ $chk_sexo_1 }}>
					<label class="form-check-label" for="sexo_1">Masculino</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="sexo" id="sexo_2" value="2" {{ $chk_sexo_2 }}>
					<label class="form-check-label" for="sexo_2">Femenino</label>
				</div>
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
			<label for="rfc" class="col-form-label col-md-3">R.F.C.</label>
			<div class="col-md-9">
				{!! Form::text('rfc', null, ['id'=>'rfc', 'placeholder'=>'',  'class'=>'form-control m-b-5', 'maxlength'=>13]) !!}
				<pre id="resRfc"></pre>
				<div id="el-rfc" class="invalid-feedback lbl-error"></div>
			</div>
		</div>		
		<div class="form-group row m-b-15">
			<label for="telefono" class="col-form-label col-md-3">Teléfono*</label>
			<div class="col-md-9">
				{!! Form::text('telefono', null, ['id'=>'telefono', 'placeholder'=>'',  'class'=>'form-control m-b-5']) !!}
				<div id="el-telefono" class="invalid-feedback lbl-error"></div>
			</div>
		</div>
		<div class="form-group row m-b-15">
			<label for="correo" class="col-form-label col-md-3">Correo electrónico*</label>
			<div class="col-md-9">
				{!! Form::text('correo', null, ['id'=>'correo', 'placeholder'=>'',  'class'=>'form-control m-b-5', 'oninput'=>"validarCorreo(this)"]) !!}
				<pre id="resCorreo"></pre>
				<div id="el-correo" class="invalid-feedback lbl-error"></div>
				<small class="f-s-12 text-grey-darker">Nota: A este correo se enviaran notificaciones del sistema. </small>				
			</div>
		</div>
			
	</div>	
</div>

<legend>Domicilio</legend>
<div class="row">
	<div class="col-md-6">

		<div class="form-group row m-b-15">
			<label for="id_municipio" class="col-form-label col-md-3">Municipio*</label>
			<div class="col-md-9">
				<select id="id_municipio" name="id_municipio"  class="form-control default-select2" data-size="10" data-live-search="true" data-style="btn-white"></select>
				<div id="el-id_municipio" class="invalid-feedback lbl-error"></div>			
			</div>
		</div>

		<div class="form-group row m-b-15">
			<label for="calle" class="col-form-label col-md-3">Calle*</label>
			<div class="col-md-9">
				{!! Form::text('calle', null, ['id'=>'calle', 'placeholder'=>'',  'class'=>'form-control m-b-5']) !!}
				<div id="el-calle" class="invalid-feedback lbl-error"></div>
			</div>
		</div>

		<div class="form-group row m-b-15">
			<label for="entre_calle" class="col-form-label col-md-3">Entre calle*</label>
			<div class="col-md-9">
				{!! Form::text('entre_calle', null, ['id'=>'entre_calle', 'placeholder'=>'',  'class'=>'form-control m-b-5']) !!}
				<div id="el-entre_calle" class="invalid-feedback lbl-error"></div>
			</div>
		</div>

		<div class="form-group row m-b-15">
			<label for="y_calle" class="col-form-label col-md-3">Y calle*</label>
			<div class="col-md-9">
				{!! Form::text('y_calle', null, ['id'=>'y_calle', 'placeholder'=>'',  'class'=>'form-control m-b-5']) !!}
				<div id="el-y_calle" class="invalid-feedback lbl-error"></div>
			</div>
		</div>
		
	</div>

	<div class="col-md-6">
		<div class="form-group row m-b-15">
			<label for="num_exterior" class="col-form-label col-md-3">Numero exterior*</label>
			<div class="col-md-9">
				{!! Form::text('num_exterior', null, ['id'=>'num_exterior', 'placeholder'=>'',  'class'=>'form-control m-b-5']) !!}
				<div id="el-num_exterior" class="invalid-feedback lbl-error"></div>
			</div>
		</div>

		<div class="form-group row m-b-15">
			<label for="num_interior" class="col-form-label col-md-3">Numero interior</label>
			<div class="col-md-9">
				{!! Form::text('num_interior', null, ['id'=>'num_interior', 'placeholder'=>'',  'class'=>'form-control m-b-5']) !!}
				<div id="el-num_interior" class="invalid-feedback lbl-error"></div>
			</div>
		</div>

		<div class="form-group row m-b-15">
			<label for="colonia" class="col-form-label col-md-3">Colonia*</label>
			<div class="col-md-9">
				{!! Form::text('colonia', null, ['id'=>'colonia', 'placeholder'=>'',  'class'=>'form-control m-b-5']) !!}
				<div id="el-colonia" class="invalid-feedback lbl-error"></div>
			</div>
		</div>

		<div class="form-group row m-b-15">
			<label for="codigo_postal" class="col-form-label col-md-3">Codigo postal*</label>
			<div class="col-md-9">
				{!! Form::text('codigo_postal', null, ['id'=>'codigo_postal', 'placeholder'=>'',  'class'=>'form-control m-b-5']) !!}
				<div id="el-codigo_postal" class="invalid-feedback lbl-error"></div>
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