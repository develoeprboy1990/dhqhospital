<!-- Sweet alert start -->
  <script src="<?php echo base_url();?>assets/js/sweetalert.min.js"></script>
<!-- Sweet alert end -->
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>HONDA | Log in</title>
  <link rel="icon" href="<?php echo base_url();?>images/Honda-logo.png" type="image/ico">
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="<?php echo base_url();?>assets/theme/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="<?php echo base_url();?>assets/theme/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="<?php echo base_url();?>assets/theme/bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="<?php echo base_url();?>assets/theme/dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="<?php echo base_url();?>assets/css/style.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="<?php echo base_url();?>assets/theme/plugins/iCheck/square/blue.css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="<?php echo base_url();?>assets/css/css.css">
</head>
<body class="hold-transition login-page" style="background: black; overflow:hidden;">
<div class="login-box">
  <div class="login-logo">
    <img src="<?php echo base_url('images/Honda-logo.png');?>" height="60" width="40">
    <a href="<?php echo base_url('/Login');?>"><b>HONDA</b> AVENUE</a>
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Sign in to start your session</p>

    <form method="post" action="<?php echo base_url('/WebLogin/validate'); ?>">
      <?php
  
      if($msg=$this->session->flashdata('msg'))
      {
        echo $msg;  
      }
      
      ?>
      <div class="form-group has-feedback">
        <input type="email" name="email" class="my-control form-control" placeholder="Email" autocomplete="off" required>
        <span class="text-danger"><?php echo form_error('email'); ?></span>
      <!-- <?php
  
      if($msg=$this->session->flashdata('emailerror'))
      {
        echo $msg;  
      }
      
      ?> -->
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" name="password" class="my-control form-control" placeholder="Password" required>
      <!-- <?php
  
      if($msg=$this->session->flashdata('pass'))
      {
        echo $msg;  
      }
      
      ?> -->
        <span class="text-danger"><?php echo form_error('password'); ?></span>
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <!-- <div class="col-xs-8">
          <div class="checkbox icheck"> -->
            <!-- <label>
              <input type="checkbox"> Remember Me
            </label> -->
         <!--  </div>
        </div> -->
        <!-- /.col -->
        <div class="col-xs-4"></div>
        <div class="col-xs-4">
          <button type="submit" name="submit" class="btn btn-primary btn-block btn-flat" style="margin-bottom: 10px;">Sign In</button>
        </div>
        <div class="col-xs-4"></div>
        <?php
        //echo '<label class="text-danger">'.$this->session->flashdata('error');.'</label>';
        ?>
        <!-- /.col -->
      </div>
    </form>

    <div class="social-auth-links text-center">
      <p>- OR -</p>
      <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using
        Facebook</a>
      <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign in using
        Google+</a>
    </div>
    <!-- /.social-auth-links -->

    <!-- <a href="#">I forgot my password</a><br> -->
    <a href="<?php echo base_url('/Register');?>" class="text-center">Register a new Membership</a>

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 3 -->
<script src="<?php echo base_url();?>assets/theme/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="<?php echo base_url();?>assets/theme/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="<?php echo base_url();?>assets/theme/plugins/iCheck/icheck.min.js"></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' /* optional */
    });
  });
</script>
</body>
</html>
