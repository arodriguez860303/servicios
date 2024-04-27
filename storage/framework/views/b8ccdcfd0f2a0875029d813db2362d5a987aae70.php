<!DOCTYPE html>
<html lang="en">
<head>        
        <meta charset="utf-8" />
        <title>DIPRIS | Plataforma Digital para la Atención de Trámites Administrativos</title>
        <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
        <meta content="" name="Portal del contratista" />
        <meta content="" name="Secretaría de la Honestidad y Función Pública" />
        				
        <!-- Google Fonts -->
		<link href="https://fonts.googleapis.com/css?family=Roboto|Roboto+Slab" rel="stylesheet"> 		
		<link rel="icon" type="image/png" href="<?php echo e(asset('img/icono.ico')); ?>" sizes="16x16">

		<!-- CSS Global Compulsory -->
		<link href="<?php echo e(asset('assets/vendor/bootstrap/bootstrap.min.css')); ?>" rel="stylesheet">
		<link href="<?php echo e(asset('assets/vendor/bootstrap/offcanvas.css')); ?>" rel="stylesheet">
        		
		<!-- CSS Implementing Plugins -->
		<link href="<?php echo e(asset('assets/vendor/icon-awesome/css/font-awesome.min.css')); ?>" rel="stylesheet">
		<link href="<?php echo e(asset('assets/vendor/icon-line-pro/style.css')); ?>" rel="stylesheet">
		<link href="<?php echo e(asset('assets/vendor/icon-line/css/simple-line-icons.css')); ?>" rel="stylesheet">
		<link href="<?php echo e(asset('assets/vendor/icon-hs/style.css')); ?>" rel="stylesheet">
		<link href="<?php echo e(asset('assets/vendor/dzsparallaxer/dzsparallaxer.css')); ?>" rel="stylesheet">
		<link href="<?php echo e(asset('assets/vendor/dzsparallaxer/dzsscroller/scroller.css')); ?>" rel="stylesheet">
		<link href="<?php echo e(asset('assets/vendor/dzsparallaxer/advancedscroller/plugin.css')); ?>" rel="stylesheet">
		<link href="<?php echo e(asset('assets/vendor/animate.css')); ?>" rel="stylesheet">
		<link href="<?php echo e(asset('assets//vendor/typedjs/typed.css')); ?>" rel="stylesheet">
		<link href="<?php echo e(asset('assets/vendor/hamburgers/hamburgers.min.css')); ?>" rel="stylesheet">
		<link href="<?php echo e(asset('assets/vendor/fancybox/jquery.fancybox.css')); ?>" rel="stylesheet">
		<link href="<?php echo e(asset('assets/vendor/slick-carousel/slick/slick.css')); ?>" rel="stylesheet">

		<link href="<?php echo e(asset('assets/css/unify-core.css')); ?>" rel="stylesheet">
		<link href="<?php echo e(asset('assets/css/unify-components.css')); ?>" rel="stylesheet">
		<link href="<?php echo e(asset('assets/css/unify-globals.css')); ?>" rel="stylesheet">

		<link href="<?php echo e(asset('assets/css/custom.css')); ?>" rel="stylesheet">
		<link href="<?php echo e(asset('assets/css/personalizado.css')); ?>" rel="stylesheet">
		<link href="<?php echo e(asset('assets/css/login.css')); ?>" rel="stylesheet">

		<link href="<?php echo e(asset('css/login.css')); ?>" rel="stylesheet">
		<link href="<?php echo e(asset('css/my-style.css')); ?>" rel="stylesheet">

		<link href="<?php echo e(asset('template/plugins/sweet-alert/sweetalert.css')); ?>" rel="stylesheet">
		        
        <?php echo $__env->yieldContent('styles'); ?>
    </head>

    <style>
		@media (max-width:800px){
			#principalPeque{display:block}
			#principalGrande{display:none}
			#logo{text-align:center}
			#texto{text-align:center}
			#texto h1{font-size:2em}
		}
		@media (min-width:800px){
			#principalPeque{display:none}
			#principalGrande{display:block}
			#logo{text-align:right}
			#texto h1{font-size:3.7em}
		}
    </style>
    
    <body>
		<header id="js-header" class="u-header u-header--sticky-top u-header--toggle-section" data-header-fix-moment="300">	
								
        </header>
					
        <section class="dzsparallaxer auto-init height-is-based-on-content use-loading mode-scroll dzsprx-readyall" data-options='{direction: "reverse", settings_mode_oneelement_max_offset: "150"}'>
            <div class="divimage dzsparallaxer--target w-100 u-bg-overlay g-bg-img-hero g-bg-bluegray-opacity-0_1--after" style="height: 100%; background-image: url(<?php echo e(asset('img/banners/salud.jpg')); ?>)";></div>
            <div class="container u-bg-overlay__inner text-center g-py-120" id="principalGrande"></div> 
            <div class="container u-bg-overlay__inner text-center g-py-70" id="principalPeque"></div> 
        </section>

		<section class="d-block d-sm-none">
            <div class="g-brd-around  g-brd-1 g-brd-gray-light-v4-top g-brd-gray-light-v4-bottom g-color-white-opacity-0_9 g-bg-color-menu" role="alert">
				<div class="container">
					<nav class="navbar navbar-expand-lg navbar-light g-pa-0 g-right-0 g-pt-4 g-pb-4 g-bg-color-menu">
						<a class="navbar-brand g-color-morado g-font-weight-600 g-font-size-16  d-none d-sm-none d-md-none d-lg-none d-xl-block g-text-underline--hover" href="comision_seg_vig/"></a>
						<a class="navbar-brand g-color-morado g-font-weight-600 g-font-size-16  d-sm-block d-md-block d-lg-block d-xl-none g-text-underline--hover" href="comision_seg_vig/"></a>
						<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<ul class="navbar-nav ml-auto g-font-size-15 g-font-weight-100">
								<li class="nav-item g-mx-3--lg"><a class="nav-link g-color-black-opacity-0_9 g-color-white--hover g-bg-morado--hover g-rounded-3" href="#">Acerca de</a></li>
								<li class="nav-item g-mx-3--lg"><a class="nav-link g-color-black-opacity-0_9 g-color-white--hover g-bg-morado--hover g-rounded-3" href="crear-cuenta/registro">Crea tu cuenta</a></li>
							</ul>
						</div>
					</nav>
				</div>      
			</div>
		</section>
		<section>
            <!-- begin #page-container -->
            <div class="container-front">		
                <div id="content" class="container">                    
                    <?php echo $__env->yieldContent('content'); ?>
                </div>
            </div>
            <!-- end #page-container -->            
            							
			<?php echo $__env->yieldContent('contenttt'); ?>
			<br>
			<div class="container">
				<div class="note note-default " style="text-align:justify">								
					<div class="note-content">
						<h5><b>Importante</b></h5>
						<p class="r-d-5">                            
							Para el &oacute;ptimo funcionamiento del sistema utiliza las <b>versiones</b> m&aacute;s <b>actualizadas</b> de los siguientes navegadores:							
							<img src="<?php echo e(asset('img/iconos/chrome.png')); ?>"> Google Chrome <img src="<?php echo e(asset('img/iconos/mozilla.png')); ?>"> Mozilla Firefox
						</p>
					</div>
				</div>
			</div>                                    
			<br>				
		</section>					
		<!-- PAGINA -->

		<footer class="g-bg-black-opacity-0_9 g-color-white-opacity-0_8 g-py-20">
			<div class="container">
				<div class="row d-sm-block d-md-block d-lg-block d-xl-none">
                    <div class="col-md-10 text-center text-md-left g-mb-10 g-mb-0--md">
                        <small class="d-block g-font-size-default g-mr-10 g-mb-10 g-mb-0--md g-font-weight-300 text-center"><a href="" class="g-color-white-opacity-0_8 g-color-white--hover">Sistema DIPRIS</a></small>
         		    </div>
                </div>
														
				<div class="row">
								
					<div class="col-lg-2 col-md-6 g-mb-20 g-mb-0--lg d-none d-sm-none d-md-none d-lg-none d-xl-block">
                        <img class="img-fluid" src="<?php echo e(asset('img/logos/salud.png')); ?>" alt="Logo">
                    </div>
								
					<div class="col-md-8 text-center text-md-left g-mb-10 g-mb-0--md d-none d-sm-none d-md-none d-lg-none d-xl-block">
						<div class="row">
							<div class="col-md-12">
								<div class="d-lg-flex">
									<small class="d-block g-font-size-default g-mr-10 g-mb-10 g-mb-0--md g-font-weight-300">Tr&aacute;mites y Servicios:</small>
									<ul class="u-list-inline">
										<li class="list-inline-item"><a class="g-color-white-opacity-0_8 g-color-white--hover" href="http://www.chiapas.gob.mx/tramites">Buscar servicios</a></li>
										    <li class="list-inline-item"><span>|</span></li>
											<li class="list-inline-item"><a class="g-color-white-opacity-0_8 g-color-white--hover" href="http://www.chiapas.gob.mx/servicios-pago-de-derechos">Pago de Derechos</a></li>
											<li class="list-inline-item"><span>|</span></li>
											<li class="list-inline-item"><a class="g-color-white-opacity-0_8 g-color-white--hover" href="http://www.chiapas.gob.mx/servicios-por-entidad">Servicios por Entidad</a></li>
											<li class="list-inline-item"><span>|</span></li>
											<li class="list-inline-item"><a class="g-color-white-opacity-0_8 g-color-white--hover" href="http://www.chiapas.gob.mx/servicios-por-internet">Servicios por Internet</a></li>
							        </ul>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="d-lg-flex">
									<small class="d-block g-font-size-default g-mr-10 g-mb-10 g-mb-0--md">Mantente informado:</small>
										<ul class="u-list-inline">
											<li class="list-inline-item"><a class="g-color-white-opacity-0_8 g-color-white--hover" href="http://www.chiapas.gob.mx/tv">TV</a></li>
											<li class="list-inline-item"><span>|</span></li>
											<li class="list-inline-item"><a class="g-color-white-opacity-0_8 g-color-white--hover" href="http://www.chiapas.gob.mx/radio">Radio</a></li>
											<li class="list-inline-item"><span>|</span></li>
											<li class="list-inline-item"><a class="g-color-white-opacity-0_8 g-color-white--hover" href="http://www.chiapas.gob.mx/prensa">Prensa</a></li>
											<li class="list-inline-item"><span>|</span></li>
											<li class="list-inline-item"><a class="g-color-white-opacity-0_8 g-color-white--hover" href="http://www.chiapas.gob.mx/redes">Redes sociales</a></li>
										</ul>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-2 align-self-center d-none d-sm-none d-md-none d-lg-none d-xl-block">
						<ul class="list-inline text-center text-md-right mb-0">
							<li class="list-inline-item g-mr-10"><a class="u-icon-v3 u-icon-size--xs g-bg-white-opacity-0_1 g-bg-white-opacity-0_2--hover g-color-white-opacity-0_6" target="_blank" href="#"><i class="fa fa-facebook"></i></a></li>
							<li class="list-inline-item g-mr-10"><a class="u-icon-v3 u-icon-size--xs g-bg-white-opacity-0_1 g-bg-white-opacity-0_2--hover g-color-white-opacity-0_6" target="_blank" href="#"><i class="fa fa-instagram"></i></a></li>
							<li class="list-inline-item g-mr-10"><a class="u-icon-v3 u-icon-size--xs g-bg-white-opacity-0_1 g-bg-white-opacity-0_2--hover g-color-white-opacity-0_6" target="_blank" href="#"><i class="fa fa-twitter"></i></a></li>
						</ul>
					</div>
				</div>
							
			</div>
		</footer>

		<script src="<?php echo e(asset('assets/vendor/jquery/jquery.min.js')); ?>"></script>	        
		<script src="<?php echo e(asset('assets/vendor/jquery-migrate/jquery-migrate.min.js')); ?>"></script>	        
		<script src="<?php echo e(asset('assets/vendor/popper.js/popper.min.js')); ?>"></script>	        
		<script src="<?php echo e(asset('assets/vendor/bootstrap/bootstrap.min.js')); ?>"></script>	     

		<script src="<?php echo e(asset('template/plugins/sweet-alert/sweetalert.min.js')); ?>"></script>	          

		<script src="<?php echo e(asset('assets/vendor/hs-megamenu/src/hs.megamenu.js')); ?>"></script>	        
		<script src="<?php echo e(asset('assets/vendor/dzsparallaxer/dzsparallaxer.js')); ?>"></script>	        
		<script src="<?php echo e(asset('assets/vendor/dzsparallaxer/dzsscroller/scroller.js')); ?>"></script>	        
		<script src="<?php echo e(asset('assets/vendor/dzsparallaxer/advancedscroller/plugin.js')); ?>"></script>	        
		<script src="<?php echo e(asset('assets/vendor/fancybox/jquery.fancybox.min.js')); ?>"></script>	        
		<script src="<?php echo e(asset('assets/vendor/slick-carousel/slick/slick.js')); ?>"></script>	

		<script src="<?php echo e(asset('assets/js/hs.core.js')); ?>"></script>	        
		<script src="<?php echo e(asset('assets/vendor/typedjs/typed.min.js')); ?>"></script>	        
		<script src="<?php echo e(asset('assets/js/components/hs.header.js')); ?>"></script>	        
		<script src="<?php echo e(asset('assets/js/helpers/hs.hamburgers.js')); ?>"></script>	        
		<script src="<?php echo e(asset('assets/js/components/hs.dropdown.js')); ?>"></script>	        
		<script src="<?php echo e(asset('assets/js/components/hs.popup.js')); ?>"></script>	        
		<script src="<?php echo e(asset('assets/js/components/hs.carousel.js')); ?>"></script>	        
		<script src="<?php echo e(asset('assets/js/components/hs.go-to.js')); ?>"></script>	

		<script src="<?php echo e(asset('assets/js/custom.js')); ?>"></script>	          
								
		<?php echo $__env->yieldContent('js'); ?>

		<script type="text/javascript">       	
            
			$(document).on('ready', function () {
		
				$.HSCore.components.HSHeader.init($('#js-header'));
				$.HSCore.helpers.HSHamburgers.init('.hamburger');
						
				$('.js-mega-menu').HSMegaMenu({
					event: 'hover',
					pageContainer: $('.container'),
				    breakpoint: 991
				});
						
				$.HSCore.components.HSDropdown.init($('[data-dropdown-target]'), {
					afterOpen: function () {
						$(this).find('input[type="search"]').focus();
					}
				});
						
				$.HSCore.components.HSPopup.init('.js-fancybox');
						
				$.HSCore.components.HSCarousel.init('.js-carousel');				    
						
				$.HSCore.components.HSGoTo.init('.js-go-to');
			});
        </script>
        

        <script type="text/javascript">
        	var vuri = window.location.origin + '/servicios-dipris';

        	<?php echo $__env->yieldContent('script'); ?>
        </script>
	</body>
    
</html><?php /**PATH D:\laragon\www\salud\dipris\resources\views/layouts/frontend_cuenta.blade.php ENDPATH**/ ?>