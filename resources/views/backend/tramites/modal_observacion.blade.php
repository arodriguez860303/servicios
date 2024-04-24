<div class="modal fade" id="mdlObservacion" tabindex="-1" role="dialog" aria-labelledby="mdlObservacion" aria-hidden="true">
  <div class="modal-dialog modal-dialog-slideleft" role="document">
    <div class="modal-content">
      <div class="block block-rounded block-transparent mb-0">
        <div class="block-header block-header-default">
          <h3 class="block-title">Agregar observación</h3>
          <div class="block-options">
            <button type="button" class="btn-block-option" data-bs-dismiss="modal" aria-label="Close">
              <i class="fa fa-fw fa-times"></i>
            </button>
          </div>
        </div>
        <div class="block-content fs-sm">
          <form id="frmObservacion" name="frmObservacion">
              <input type="hidden" id="_tramite" name="_tramite" value="{{$id_tramite}}">
              <input type="hidden" id="id_c_documento" name="id_c_documento" value="0">
              <input type="hidden" id="id_documento_tramite" name="id_documento_tramite" value="0">

              <h4 id="mdl_lbl_documento" class="fw-light"></h4><br>
              <div class="mb-4">
                      <label class="form-label" for="example-textarea-input-alt">Ingrese la descripción de la observación</label>
                      <textarea class="form-control form-control-alt" id="txtObservacion" name="txtObservacion" rows="5" placeholder="Ingresar descripción.."></textarea>
                    </div>
          </form>          
        </div>
        <div class="block-content block-content-full text-end bg-body">
          <button type="button" class="btn btn-sm btn-alt-secondary me-1" data-bs-dismiss="modal" onclick="cancelarObservacion();">Cancelar</button>
          <button type="button" id="btn-guardar-observacion" class="btn btn-sm btn-primary" onclick="agregarObservacion();">Aceptar</button>
        </div>
      </div>
    </div>
  </div>
</div>