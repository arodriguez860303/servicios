<div class="modal fade" id="mdl_foto">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">Actualizar la fotografia del solicitante</h4>
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			</div>
			<form id="frmFoto" name="frmFoto">
			<input type="hidden" name="_token" id="_token" value="<?php echo e(csrf_token()); ?>" />
			<div class="modal-body">				
				<input type="hidden" name="hdIdFoto" id="hdIdFoto" />
				<input type="hidden" name="hdIdConstanciaFoto" id="hdIdConstanciaFoto" value="<?php echo e($id_constancia); ?>" />
				<legend>¿ Esta seguro de <b>actualizar la fotografia del solicitante</b> ?</legend>

				<p><b>Nota: </b>Si actualizas la foto puede que no se refleje como la original.</p>	

				<input type="file" name="fldFotoCliente" id="fldFotoCliente" />  

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger btn-foto" id="btn-foto">
					<i class="fa fa-ban"></i> Sí, estoy seguro
				</button>
				<a href="javascript:;" class="btn btn-white" data-dismiss="modal">Cerrar</a>
			</div>
			</form>
		</div>
	</div>
</div>	<?php /**PATH D:\laragon\www\tramites_dipris\c-dipris\resources\views/backend/constancias/mdFoto.blade.php ENDPATH**/ ?>