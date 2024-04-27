<div class="row">
  <div class="col-md-6 col-xl-6">
    <a class="block block-rounded text-center">
      <div class="block-content block-content-full block-content-sm bg-primary-darker border-bottom border-white-op">
        <p class="fw-semibold text-white mb-0">Constancias de manejo higienico de alimentos</p>
      </div>
      <div class="block-content block-content-full bg-primary-dark">
        <img class="img-avatar img-avatar-thumb img-avatar-rounded" src="<?php echo e(asset('template_backend/media/avatars/avatar10.jpg')); ?>" alt="">
      </div>
      <div class="block-content block-content-full">
        <div class="row g-sm">
          <div class="col-3">
            <div class="item item-circle mb-3 mx-auto border border-warning border-2 _proceso" onclick="load_detalle(2);">             
                <i class="fa fa-fw fa-circle-question text-warning"></i>            
            </div>
            <p class="fs-sm fw-medium text-muted mb-0">
              Proceso <br> <span id="spProceso"></span>
            </p>
          </div>
          <div class="col-3">
            <div class="item item-circle mb-3 mx-auto border border-dark border-2 _observado" onclick="load_detalle(8);">
              <i class="fa fa-fw fa-magnifying-glass text-dark"></i>
            </div>
            <p class="fs-sm fw-medium text-muted mb-0">
              Observados <br> <span id="spObservado"></span>
            </p>
          </div>
          <div class="col-3">
            <div class="item item-circle mb-3 mx-auto border border-info border-2 _solventado" onclick="load_detalle(9);">
              <i class="fa fa-fw fa-list-check text-info"></i>
            </div>
            <p class="fs-sm fw-medium text-muted mb-0">
              Solventados <br> <span id="spSolventado"></span>
            </p>
          </div>
          <div class="col-3">
            <div class="item item-circle mb-3 mx-auto border border-success border-2 _aceptado" onclick="load_detalle(10);">
              <i class="fa fa-fw fa-circle-check text-success"></i>
            </div>
            <p class="fs-sm fw-medium text-muted mb-0">
              Aceptados <br> <span id="spAceptado"></span>
            </p>
          </div>
        </div>
      </div>
    </a>
  </div>

  <div class="col-md-6 col-xl-6">
    <a class="block block-rounded text-center">
      <div class="block-content block-content-full block-content-sm bg-flat border-bottom border-white-op">
        <p class="fw-semibold text-white mb-0">Diplomas de servicio de hospital</p>
      </div>
      <div class="block-content block-content-full bg-flat-op">
        <img class="img-avatar img-avatar-thumb img-avatar-rounded" src="<?php echo e(asset('template_backend/media/avatars/avatar10.jpg')); ?>" alt="">
      </div>
      <div class="block-content block-content-full">
        <div class="row g-sm">
          <div class="col-3">
            <div class="item item-circle mb-3 mx-auto border border-warning border-2 _proceso" onclick="load_detalle_hospital(2);">
              <i class="fa fa-fw fa-circle-question text-warning"></i>
            </div>
            <p class="fs-sm fw-medium text-muted mb-0">
              Proceso <br> <span id="spProcesoHospital"></span>
            </p>
          </div>
          <div class="col-3">
            <div class="item item-circle mb-3 mx-auto border border-dark border-2  _observado" onclick="load_detalle_hospital(8);">
              <i class="fa fa-fw fa-magnifying-glass text-dark"></i>
            </div>
            <p class="fs-sm fw-medium text-muted mb-0">
              Observados <br> <span id="spObservadoHospital"></span>
            </p>
          </div>
          <div class="col-3">
            <div class="item item-circle mb-3 mx-auto border border-info border-2 _solventado" onclick="load_detalle_hospital(9);">
              <i class="fa fa-fw fa-list-check text-info"></i>
            </div>
            <p class="fs-sm fw-medium text-muted mb-0">
              Solventados <br> <span id="spSolventadoHospital"></span>
            </p>
          </div>
          <div class="col-3">
            <div class="item item-circle mb-3 mx-auto border border-success border-2 _aceptado" onclick="load_detalle_hospital(10);">
              <i class="fa fa-fw fa-circle-check text-success"></i>
            </div>
            <p class="fs-sm fw-medium text-muted mb-0">
              Aceptados <br> <span id="spAceptadoHospital"></span>
            </p>
          </div>
        </div>
      </div>
    </a>
  </div>
</div><?php /**PATH D:\laragon\www\salud\dipris\resources\views/dashboard/targets_status.blade.php ENDPATH**/ ?>