
<?php $__env->startSection('title','Login'); ?> 
<?php $__env->startSection('css'); ?>
    

<?php $__env->stopSection(); ?>
<?php $__env->startSection('content'); ?>
<div class="bg-primary">
    <div class="container">
        <div class="row">
            <div class="m-auto col-md-6">
                <div class="d-flex align-items-center min-vh-100">
                    <div class="w-100 d-block bg-white shadow-lg rounded my-5">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="p-5">
                                    <form method="post" action="<?php echo e(route('admin.login_submit')); ?>"  class="user">
                                        <?php echo csrf_field(); ?>

                                        <div class="form-group">
                                            <label>Email</label>
                                            <input  name="email" type="email" class="form-control form-control-user" placeholder="Email Address" value="<?php echo e(old('email')); ?>"/>
                                            <?php if($errors->has('email')): ?>
                                             <span class="d-block mt-2 text-danger"><?php echo e($errors->first('email')); ?></span>    
                                            <?php endif; ?>
                                        </div>

                                        <div class="form-group">
                                            <label>Password</label>
                                            <input  name="password" type="password" class="form-control form-control-user"  placeholder="Password"  />
                                            <?php if($errors->has('password')): ?>
                                            <span class="d-block mt-2 text-danger"><?php echo e($errors->first('password')); ?></span>    
                                            <?php endif; ?>
                                        </div>

                                        <button type="submit" class="btn btn-success btn-block waves-effect waves-light"> Log In </button>
                                       
                                        <div class="text-center pt-3" >
                                            <a href="<?php echo e(route('admin.register')); ?>" >Dont Have Account ?</a>
                                        </div>
                                        
                                    </form>
                                </div> 
                            </div> 
                        </div> 
                    </div> 
                </div> 
            </div> 
        </div> 
    </div>
</div>
<?php $__env->stopSection(); ?>
<?php $__env->startSection('js'); ?>
    



<?php $__env->stopSection(); ?>
<?php echo $__env->make('admin.layouts.auth', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\xampp\htdocs\api\resources\views/admin/login.blade.php ENDPATH**/ ?>