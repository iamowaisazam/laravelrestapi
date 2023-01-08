<!DOCTYPE html>
<html lang="<?php echo e(str_replace('_', '-', app()->getLocale())); ?>">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="description" content="#" />
        <meta name="author" content="#" />
        <title> <?php echo $__env->yieldContent('title'); ?> </title>
    
        <meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">
        
        <!-- App favicon -->
        <link rel="shortcut icon" href="#">
        <link href="<?php echo e(asset('admin/assets/css/bootstrap.min.css')); ?>" rel="stylesheet" type="text/css" />
        <link href="<?php echo e(asset('admin/assets/css/icons.min.css')); ?>" rel="stylesheet" type="text/css" />
        <link href="<?php echo e(asset('admin/assets/css/theme.min.css')); ?>" rel="stylesheet" type="text/css" />
        <link href="<?php echo e(asset('admin/plugins/toast/toast.css')); ?>" rel="stylesheet" type="text/css" />
        
        <?php echo $__env->yieldContent('css'); ?>
    </head>
<body>

    <?php echo $__env->yieldContent('content'); ?>


   <!-- jQuery  -->
   <script src="<?php echo e(asset('admin/assets/js/jquery.min.js')); ?>"></script>
   <script src="<?php echo e(asset('admin/assets/js/bootstrap.bundle.min.js')); ?>"></script>
   <script src="<?php echo e(asset('admin/assets/js/theme.js')); ?>"></script>
   <script src="<?php echo e(asset('admin/plugins/toast/toast.js')); ?>"></script>
   <script src="<?php echo e(asset('js/app.js')); ?>" ></script>
   
   <?php echo $__env->make('admin.components.notifications', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

   <script>

    toastr.options = {
         "closeButton": true,
         "debug": false,
         "newestOnTop": false,
         "progressBar": false,
         "positionClass": "toast-top-right",
         "preventDuplicates": false,
         "onclick": null,
         "showDuration": "300",
         "hideDuration": "1000",
         "timeOut": "5000",
         "extendedTimeOut": "1000",
         "showEasing": "swing",
         "hideEasing": "linear",
         "showMethod": "fadeIn",
         "hideMethod": "fadeOut"
     }

   </script>

    <?php echo $__env->yieldContent('js'); ?>
</body>
</html><?php /**PATH C:\xampp\htdocs\api\resources\views/admin/layouts/auth.blade.php ENDPATH**/ ?>