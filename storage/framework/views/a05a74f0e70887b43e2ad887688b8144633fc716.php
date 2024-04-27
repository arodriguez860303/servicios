<div class="fixed-bread width-full ">	
	<?php echo $__env->make('layouts.backend-breadcrumb', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
</div>

<div id="content" class="content">
	<?php echo $__env->yieldContent('content'); ?>
</div><?php /**PATH D:\laragon\www\tramites_dipris\c-dipris\resources\views/layouts/backend-content.blade.php ENDPATH**/ ?>