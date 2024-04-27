<div class="row">
  <div class="col-md-8">
    <h4 class="fw-normal">Ingresar la información solicitada</h4>
  </div>      
</div>
<div class="row"> 
	<div class="col-lg-6 col-md-6">
		<div class="mb-4">
	      <label class="form-label" for="id_rol">Rol de usuario</label>
	      <select class="js-select2 form-select" id="id_rol" name="id_rol" style="width: 100%"></select>
	    </div>

		<div class="mb-4">
	      <label class="form-label" for="txtNombre">Nombre completo</label>
	      <input type="text" class="form-control" id="txtNombre" name="txtNombre" placeholder="Ingresa el nombre">
	    </div>

	    <div class="mb-4">
	      <label class="form-label" for="txtCorreo">Correo electrónico</label>
	      <input type="text" class="form-control" id="txtCorreo" name="txtCorreo" placeholder="Ingresa el correo">
	      <small class="f-s-12 text-grey-darker">Ingrese un correo valido</small>
	    </div>

	    <div class="row">
	    	<div class="col-lg-6 col-md-6">
	    		<div class="mb-4">
			      	<label class="form-label" for="txtNickname">Nickname</label>			      
			      	<input type="text" class="form-control" id="txtNickname" name="txtNickname" placeholder="Ingresa el nickname">			      
			      	<small class="f-s-12 text-grey-darker">Este es mediante el cual accesara al sistema</small>
			    </div>
	    	</div>

	    	<div class="col-lg-6 col-md-6">
	    		<div class="mb-4">
			      	<label class="form-label" for="txtPassword">Contraseña</label>
			      	<div class="input-group">
			      		<input type="password" class="form-control form-control-alt" id="txtPassword" name="txtPassword" placeholder="Ingresa la contraseña">
			      		<span class="input-group-text" onclick="mostrarContrasena();">
			      			<i class="far fa-eye" id="iconPass"></i>
			      		</span>
			      	</div>
			      <small class="f-s-12 text-grey-darker">Procura que la contraseña sea segura</small>
			    </div>
	    	</div>
	    </div>	    
	</div>	
</div>





			
			<?php /**PATH D:\laragon\www\salud\dipris\resources\views/catalogos/usuarios/form.blade.php ENDPATH**/ ?>