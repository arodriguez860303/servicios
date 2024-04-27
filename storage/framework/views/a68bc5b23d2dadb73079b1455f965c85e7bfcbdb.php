<div class="modal fade" id="mdl_rechazo">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">Rechazar solicitud</h4>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			</div>
			<form id="frmRechazar" name="frmRechazar">
			<?php echo csrf_field(); ?>
			<div class="modal-body">				
				<input type="hidden" name="hdIdConstRechazo" id="hdIdConstRechazo" value="<?php echo e($id_constancia); ?>" />
				<legend>¿ Esta seguro de <b>rechazar</b> la constancia ?</legend>

				<p><b>Nota: </b>La solicitud será rechazada y podra el interesado corregir las observaciones que se describan a continuacion.</p>

				<div class="form-group row m-b-15">
					<label for="txtMotivo" class="col-form-label col-md-3">Motivo *</label>
					<div class="col-md-9">
						<?php echo Form::textarea('txtMotivo', null, ['id'=>'txtMotivo', 'placeholder'=>'',  'class'=>'form-control m-b-5']); ?>				
						<div id="el-txtMotivo" class="invalid-feedback lbl-error"></div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger btn-enviar" id="btn-enviar">
					<i class="fa fa-ban"></i> Sí, estoy seguro
				</button>
				<a href="javascript:;" class="btn btn-white" data-dismiss="modal">Cerrar</a>
			</div>
			</form>
		</div>
	</div>
</div>	<?php /**PATH D:\laragon\www\tramites_dipris\c-dipris\resources\views/backend/constancias/mdRechazar.blade.php ENDPATH**/ ?>