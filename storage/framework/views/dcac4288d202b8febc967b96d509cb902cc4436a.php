<div class="row">
  <div class="col-xl-8 col-xxl-9 d-flex flex-column">
    <!-- Earnings Summary -->
    <div class="block block-rounded flex-grow-1 d-flex flex-column">
      <div class="block-header block-header-default">
        <h3 class="block-title">Grafica de solicitudes ingresadas por mes</h3>
        <div class="block-options">
          <button type="button" class="btn-block-option" data-toggle="block-option" data-action="state_toggle" data-action-mode="demo">
            <i class="si si-refresh"></i>
          </button>
        </div>
      </div>
      
      <div class="block-content bg-body-light">
        <div class="row items-push text-center w-100">
          <div class="col-sm-4">
            <dl class="mb-0">
              <dt class="fs-3 fw-bold d-inline-flex align-items-center space-x-2">
                <i class="fa fa-caret-up fs-base text-success"></i>
                <span id="spTotalConstancias">0</span>
              </dt>
              <dd class="fs-sm fw-medium text-muted mb-0">Constancias alimentos</dd>
            </dl>
          </div>
          <div class="col-sm-4">
            <dl class="mb-0">
              <dt class="fs-3 fw-bold d-inline-flex align-items-center space-x-2">
                <i class="fa fa-caret-up fs-base text-info"></i>
                <span id="spTotalDiplomas">0</span>
              </dt>
              <dd class="fs-sm fw-medium text-muted mb-0">Diplomas hospital</dd>
            </dl>
          </div>
          <div class="col-sm-4">
            <dl class="mb-0">
              <dt class="fs-3 fw-bold d-inline-flex align-items-center space-x-2">
                <i class="fa fa-caret-up fs-base text-success"></i>
                <span id="spGlobal">0</span>
              </dt>
              <dd class="fs-sm fw-medium text-muted mb-0">Padron global</dd>
            </dl>
          </div>
        </div>
      </div>

      <div class="block-content block-content-full flex-grow-1 d-flex align-items-center">      
        <canvas id="bar-chart" height="120px"></canvas>
      </div>

    </div>
    <!-- END Earnings Summary -->
  </div>

  <div class="col-xl-4 col-xxl-3 d-flex flex-column">


    <div class="block block-rounded block-link-pop text-center">
      <div class="block-content block-content-full bg-primary-darker">
        <img class="img-avatar img-avatar-thumb" src="<?php echo e(asset('img/concluido.png')); ?>" alt="">
      </div>
      <div class="block-content block-content-full block-content-sm bg-primary-dark">
        <p class="fw-semibold text-white mb-0">Concluidos</p>
        <p class="fs-sm text-white-75 mb-0">
          Trámites
        </p>
      </div>
      <div class="block-content block-content-full">
        <div class="row g-sm">
          <div class="col-6">
            <p class="mb-2">
              <i class="fa fa-fw fa-box text-body-color-dark"></i>
            </p>
            <p class="fs-sm fw-medium text-muted mb-0 _concluido" onclick="load_detalle(3);">
              <span id="spConcluido">0</span> <br> Constancias
            </p>
          </div>
          <div class="col-6">
            <p class="mb-2">
              <i class="fa fa-fw fa-certificate text-body-color-dark"></i>
            </p>
            <p class="fs-sm fw-medium text-muted mb-0 _concluido" onclick="load_detalle_hospital(3);">
              <span id="spConcluidoHospital">0</span> <br> Diplomas
            </p>
          </div>
        </div>
      </div>
    </div>

    <div class="block block-rounded block-link-pop text-center">
      <div class="block-content block-content-full bg-primary">
        <img class="img-avatar img-avatar-thumb" src="<?php echo e(asset('img/cancelado.png')); ?>" alt="">
      </div>
      <div class="block-content block-content-full block-content-sm bg-primary-light">
        <p class="fw-semibold text-white mb-0">Cancelados</p>
        <p class="fs-sm text-white-75 mb-0">
          Trámites
        </p>
      </div>
      <div class="block-content block-content-full">
        <div class="row g-sm">
          <div class="col-6">
            <p class="mb-2">
              <i class="fa fa-fw fa-box text-body-color-dark"></i>
            </p>
            <p class="fs-sm fw-medium text-muted mb-0 _cancelado" onclick="load_detalle(7);">
              <span id="spCancelado">0</span> <br> Constancias
            </p>
          </div>
          <div class="col-6">
            <p class="mb-2">
              <i class="fa fa-fw fa-certificate text-body-color-dark"></i>
            </p>
            <p class="fs-sm fw-medium text-muted mb-0 _cancelado" onclick="load_detalle_hospital(7);">
              <span id="spCanceladoHospital">0</span> <br> Diplomas
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div><?php /**PATH D:\laragon\www\salud\dipris\resources\views/dashboard/targets_graph.blade.php ENDPATH**/ ?>