<div class="modal fade" id="modal-alert">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #621132; color: #f1f2f1;">
                    <h4 class="modal-title">Restablecer  contraseña</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                </div>
                <div class="modal-body">
                    <div class="form-group row m-b-15">
                        <div class="alert alert-muted">
                            <code><b>Nota:</b></code> Los datos requeridos son obligatorios porque a traves de ellos se realizara la busqueda, de no ser asi se omitira.
                        </div>
                    </div>

                    <form id="frmRecuperarPass" name="frmRecuperarPass" class="frmRecuperarPass">
                        @csrf  
                        <div class="form-group" id="vpassword">
                        <div class="form-group row m-b-15">
                            <label for="txtCurp" class="col-form-label col-md-3">Curp*</label>
                            <div class="col-md-9">
                                <input type="text" id="txtCurp" name="txtCurp" class="form-control m-b-5"  />
                            </div>
                        </div>

                        <div class="form-group row m-b-15">
                            <label for="txtCorreo" class="col-form-label col-md-3">Correo*</label>
                            <div class="col-md-9">
                                <input type="email" id="txtCorreo" name="txtCorreo"  class="form-control m-b-5"  />
                            </div>
                        </div>                        
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-block" data-dismiss="modal" style="background:#BDBDBD; width:200px; margin:auto;">Salir</button>
                    <button type="button" onclick="recuperarPass()" id="btnAceptPass" class="btn text-white btn-block" style="background:#333333; width:200px; margin:auto;">Aceptar</button>
                </div>
            </div>
        </div>
    </div>