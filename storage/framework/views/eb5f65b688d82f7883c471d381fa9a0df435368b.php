

<?php $__env->startSection('scripts'); ?>
    $(".toggle-password").click(function() {

        $(this).toggleClass("fa-eye fa-eye-slash");
        var input = $($(this).attr("toggle"));
        if (input.attr("type") == "password") {
        input.attr("type", "text");
        } else {
        input.attr("type", "password");
        }
    });
<?php $__env->stopSection(); ?>

<?php $__env->startSection('content'); ?>
<style>
    .field-icon {
      float: right;
      margin-left: -25px;
      margin-top: -25px;
      position: relative;
      z-index: 2;
    }

    .container{
      padding-top:50px;
      margin: auto;
    }
</style>

    <?php echo Form::open(['url' => 'login', 'method' => 'POST', 'class'=>'margin-bottom-0']); ?>

        <div class="form-group first">
            <label for="nickname">Usuario</label>
            <?php echo Form::text('nickname', old('nickname'),['id'=>'nickname', 'required'=>'true', 'class'=>'form-control']); ?>

        </div>
        <div class="form-group last mb-4">
            <label for="password">Contraseña</label>
            <?php echo Form::password('password', ['id'=>'password', 'required'=>'true', 'class'=>'form-control']); ?>  
            <span toggle="#password" class="fa fa-fw fa-eye field-icon toggle-password"></span>        
        </div>
        <input type="submit" value="Ingresar" class="btn text-white btn-block" style="background:#621132">  
    <?php echo Form::close(); ?>

    <div class="d-flex mb-5 align-items-center">
        <span class="ml-auto"><a href="#modal-alert" class="forgot-pass" data-toggle="modal">¿ Olvidaste tu usuario y/o contraseña ? <strong>Haz click aquí</strong></a></span> 
    </div>

    <div class="modal fade" id="modal-alert">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #621132; color: #f1f2f1;">
                    <h4 class="modal-title">Recuperación de contraseña</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                <div class="modal-body">
                    <div class="form-group row m-b-5">
                        <div class="alert alert-muted">
                            <code><b>Nota:</b></code> <span class="spNota">Los datos requeridos son obligatorios porque a traves de ellos se realizara la busqueda, de no ser asi se omitira.</span>
                        </div>
                    </div>

                    <div class="dvRecupera">
                      <form id="frmRecuperarPass" name="frmRecuperarPass" class="frmRecuperarPass">
                          <?php echo csrf_field(); ?>  
                          <div class="form-group" id="vpassword">
                            <div class="form-group row m-b-10">
                                <label for="txtCurp" class="col-form-label col-md-3">CURP*</label>
                                <div class="col-md-9">
                                    <input type="text" id="txtCurp" name="txtCurp" class="form-control m-b-5"  />
                                </div>
                            </div>

                            <div class="form-group row m-b-10">
                                <label for="txtCorreo" class="col-form-label col-md-3">Correo*</label>
                                <div class="col-md-9">
                                    <input type="email" id="txtCorreo" name="txtCorreo"  class="form-control m-b-5"  />
                                </div>
                            </div> 
                          </div>                       
                      </form>
                    </div>

                    <div class="dvContrasenia" style="display: none;">
                        
                        <div class="m-b-15">
                            <label for="lblNombre" class="col-form-label col-md-3"><b>Nombre</b></label>
                            <div class="col-md-9">
                              <label id="lblNombre"></label>
                            </div>
                        </div> 

                        <div class="m-b-15">
                            <label for="lblUsuario" class="col-form-label col-md-3"><b>Usuario</b></label>
                            <div class="col-md-9">
                              <label id="lblUsuario"></label>
                            </div>
                        </div>

                        <div class="m-b-15">
                            <label for="lblContrasenia" class="col-form-label col-md-3"><b>Contraseña</b></label>
                            <div class="col-md-9">
                              <label id="lblContrasenia"></label>
                            </div>
                        </div>
                    </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-block" onclick="salir_modal();" style="background:#BDBDBD; width:200px; margin:auto;">Salir</button>
                    <button type="button" onclick="recuperarPass()" id="btnAceptPass" class="btn text-white btn-block" style="background:#333333; width:200px; margin:auto;">Aceptar</button>
                </div>
            </div>
        </div>
    </div>  
<?php $__env->stopSection(); ?>
<?php echo $__env->make('layouts.login', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH D:\laragon\www\salud\dipris\resources\views/auth/login.blade.php ENDPATH**/ ?>