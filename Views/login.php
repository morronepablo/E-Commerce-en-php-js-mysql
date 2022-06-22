<?php
  session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Login | Morrone Shop</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/commerce/Util/Css/css/all.min.css">
  <!-- icheck bootstrap -->
  <!-- Theme style -->
  <link rel="stylesheet" href="/commerce/Util/Css/adminlte.min.css">
  <link rel="stylesheet" href="/commerce/Util/Css/toastr.min.css">
  <link rel="stylesheet" href="/commerce/Util/Css/sweetalert2.min.css">
  <link rel="icon" type="image/png" href="/commerce/Util/img/logo.png">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <img src="/commerce/Util/Img/logo.png" class="profile-user-img img-fluid img-circle" alt="">
    <a href="/commerce/"><b>Morrone</b> SHOP</a>
  </div>
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg">Inicie sesión</p>

      <form id="form-login">
        <div class="input-group mb-3">
          <input id="user" type="text" class="form-control" placeholder="Usuario" required>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-user"></span>
            </div>
          </div>
        </div>
        <div class="input-group mb-3">
          <input id="pass" type="password" class="form-control" placeholder="Contraseña" required>
          <div class="input-group-append">
            <div class="input-group-text">
              <span class="fas fa-lock"></span>
            </div>
          </div>
        </div>
            <div class="social-auth-links text-center mb-3">

            <button type="submit" href="#" class="btn btn-block btn-primary">
                Iniciar sesión
            </button>
        </div>
      </form>

      
      <!-- /.social-auth-links -->

      <p class="mb-1">
        <a href="">He olvidado mi contraseña</a>
      </p>
      <p class="mb-0">
        <a href="/commerce/Views/register.php" class="text-center">Registerse</a>
      </p>
    </div>
    <!-- /.login-card-body -->
  </div>
</div>
<!-- /.login-box -->

<!-- jQuery -->
<script src="/commerce/Util/Js/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/commerce/Util/Js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/commerce/Util/Js/adminlte.min.js"></script>
<script src="/commerce/Util/Js/toastr.min.js"></script>
<script src="/commerce/Util/Js/sweetalert2.min.js"></script>
<script src="/commerce/Views/login.js"></script>
</body>
</html>
