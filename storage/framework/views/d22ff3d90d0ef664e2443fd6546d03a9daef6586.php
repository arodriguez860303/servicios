<div class="row">
	<div class="col-xl-6">
		<div class="panel panel-inverse" data-sortable-id="form-stuff-1">
			<div class="panel-heading">
				<h4 class="panel-title">Datos del usuario</h4>
				<div class="panel-heading-btn">
					<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
					<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-redo"></i></a>
					<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
					<a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
				</div>
			</div>
			<div class="panel-body">
				<div class="alert alert-muted">
					Por favor complete los datos que a continuación se solicitan
				</div>
				
				<div class="form-group row m-b-15">
					<label class="col-form-label col-md-3">Rol de usuario</label>
					<div class="col-md-9">
						<select class="form-control" id="id_rol" name="id_rol" style="width: 100%"></select>
					</div>
				</div>
				<div class="form-group row m-b-15">
					<label class="col-form-label col-md-3">Nombre completo</label>
					<div class="col-md-9">
						<input type="text" id="txtNombre" name="txtNombre" class="form-control m-b-5" placeholder="Ingresa el nombre completo del usuario" />
					</div>
				</div>
				<div class="form-group row m-b-15">
					<label class="col-form-label col-md-3">Correo</label>
					<div class="col-md-9">
						<input type="text" id="txtCorreo" name="txtCorreo" class="form-control m-b-5" placeholder="Ingresa el correo" />
					</div>
				</div>
				<div class="form-group row m-b-15">
					<label class="col-form-label col-md-3">Nickname</label>
					<div class="col-md-9">
						<input type="text" id="txtNickname" name="txtNickname" class="form-control m-b-5" placeholder="Ingresa el nickname" />
						<small class="f-s-12 text-grey-darker">Este es mediante el cual accesara al sistema.</small>
					</div>
				</div>
				<div class="form-group row m-b-15">
					<label class="col-form-label col-md-3">Contraseña</label>
					<div class="col-md-9">
						<input type="password" id="txtPassword" name="txtPassword" class="form-control m-b-5" placeholder="Ingresa el password" />
						<small class="f-s-12 text-grey-darker">Procura que la contraseña sea segura.</small>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</div>
<?php /**PATH D:\laragon\www\tramites_dipris\c-dipris\resources\views/catalogos/usuarios/form.blade.php ENDPATH**/ ?>