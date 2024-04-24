<div class="modal fade" id="mdl_documento">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">Subir documento</h4>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			</div>
            <form id="frm-subir-adjunto" name="frm-subir-adjunto" enctype="multipart/form-data" accept-charset="UTF-8">

	            <input type="hidden" id="id_registro" name="id_registro" value="{{$id_registro}}">
	            <input type="hidden" id="id_documento" name="id_documento" value="0">

				<div class="modal-body">
	                <h4 id="mdl_lbl_documento"></h4><br>

					<div class="form-group row m-b-15">
						<label for="archivosubido" class="col-form-label col-md-3">Archivo*</label>
						<div class="col-md-9">
	                        <input type="file" id="archivosubido" name="archivosubido" class="form-control">
	                        <div id="el-archivosubido" class="invalid-feedback lbl-error"></div>
						</div>
					</div>

				</div>

				<div class="modal-footer">
					<div class="spinner_no_wait">
	                	<button type="button" class="btn btn-primary" onclick="upload_file('frm-subir-adjunto')"><i class="fa fa-search fa-upload"></i> Subir</button>
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