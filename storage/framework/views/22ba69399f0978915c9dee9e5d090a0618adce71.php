<div class="user_heading bg-flat">
    <div class="user_heading_avatar">
        <div class="thumbnail">
            <img alt="Logo" src="<?php echo e(asset('img/logos/avatar.jpg')); ?>" class="logo" width="100%" />
        </div>
    </div>
    <div class="user_heading_content">
        <div class="row">
            <div class="col-md-8">
                <h2 class="heading_b uk-margin-bottom">
                    <span class="uk-text-truncate"><?php echo e(Auth::User()->name); ?></span>
                    <span class="sub-heading"></span>
                </h2>
                <ul class="user_stats">
                    <li>                                       
                        <span class="uk-margin-right">
                            <i class="fas fa-id-card"></i>
                            <span class="uk-text-small">Rol: <?php echo e(Auth::user()->roles->pluck('name')[0]); ?></span>
                        </span>
                        <span class="uk-margin-right">
                            <i class="fas fa-globe"></i>
                            <span class="uk-text-small">Correo: <?php echo e(Auth::User()->email); ?></span>
                        </span>
                        <span class="uk-margin-right">
                            <i class="fas fa-calendar"></i>
                            <span class="uk-text-small">Fecha registro: <?php echo e(Auth::User()->created_at); ?></span>
                        </span>                      
                    </li>
                </ul>
            </div>
            <div class="col-md-4 text-end p-3">                
                   <div class="input-group">
                    <input type="text" id="searchData" class="form-control form-control-alt" placeholder="Ingresar dato a buscar...." />
                        <button class="btn btn-alt-secondary">
                            <i class="fa fa-search"></i>
                        </button>
                  </div>
            </div>
        </div>
    </div>
</div> <?php /**PATH D:\laragon\www\salud\dipris\resources\views/helpers/headerWithSearchH.blade.php ENDPATH**/ ?>