<div class="modal fade" id="mdl_solventacion">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">Subir documento de solventacion</h4>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			</div>
            <form id="frmEnviar" name="frmEnviar" enctype="multipart/form-data" accept-charset="UTF-8">
	            <input type="hidden" id="id_tramite" name="id_tramite" value="{{$id_tramite}}">
	            <input type="hidden" id="idObservacion" name="idObservacion" value="0">
	            <input type="hidden" id="id_documento" name="id_documento" value="0">

				<div class="modal-body">
	                <h5 id="mdl_lbl_documento"></h5><br>

	                <p><b>Observación: </b><span id="textObservacion"></span></p>

					<div class="form-group row m-b-15">
						<label for="archivosubido" class="col-form-label col-md-3">Archivo de solventación*</label>
						<div class="col-md-9">
	                        <input type="file" id="archivosubido" name="archivosubido" class="form-control">
	                        <div id="el-archivosubido" class="invalid-feedback lbl-error"></div>
						</div>
					</div>

				</div>

				<div class="modal-footer">
					<div class="spinner_no_wait">
	                	<button type="button" class="btn btn-primary" onclick="upload_solventacion('frmEnviar')"><i class="fa fa-search fa-upload"></i> Subir</button>
					</div>

					<div class="spinner_wait"  style="display:none">
						<button class="btn ripple btn-secondary" disabled type="button"><span aria-hidden="true" class="spinner-border spinner-border-sm" role="status"></span> Subiendo, por favor espere...</button>
					</div>
					
					<a href="javascript:;" class="btn btn-white" data-dismiss="modal">Cerrar</a>
				</div>
			</form>
		</div>
	</div>
</div>