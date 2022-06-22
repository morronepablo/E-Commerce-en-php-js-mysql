<?php
  session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Register | Morrone Shop</title>

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
<div class="modal fade" id="terminos" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="card card-success">
        <div class="card-header">
          <h5 class="card-title">Términos y condiciones</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="card-body">
          <p>
            * utilizaremos sus datos para generar publicidad de acuerdo a sus gustos.
          </p>
          <p>
            * la empresa no se hace responsable de fraudes o estafas.
          </p>
        </div>
        <div class="card-footer">
          <button type="button" class="btn btn-secondary btn-block" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
    </div>
  </div>
</div>
<body class="hold-transition login-page">
<div class="mt-5">
  <div class="login-logo">
    <img src="/commerce/Util/Img/logo.png" class="profile-user-img img-fluid img-circle" alt="">
    <a href="/commerce/"><b>Morrone</b> SHOP</a>
  </div>
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
        <p class="login-box-msg">Registrarse</p>

        <form id="form-register">
            <div class="row">
                <div class="col-sm-12">
                    <div class="form-group">
                        <label for="username">Usuario</label>
                        <input type="text" name="username" class="form-control" id="username" placeholder="Ingrese usuario">
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label for="pass">Contraseña</label>
                        <input type="password" name="pass" class="form-control" id="pass" placeholder="Ingrese contraseña">
                    </div>
                    <div class="form-group">
                        <label for="nombres">Nombres</label>
                        <input type="text" name="nombres" class="form-control" id="nombres" placeholder="Ingrese nombres">
                    </div>
                    <div class="form-group">
                        <label for="dni">D.N.I.</label>
                        <input type="text" name="dni" class="form-control" id="dni" placeholder="Ingrese D.N.I.">
                    </div>
                    <div class="form-group">
                        <label for="telefono">Teléfono</label>
                        <input type="text" name="telefono" class="form-control" id="telefono" placeholder="Ingrese teléfono">
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="form-group">
                        <label for="pass_repeat">Repetir contraseña</label>
                        <input type="password" name="pass_repeat" class="form-control" id="pass_repeat" placeholder="Ingrese de nuevo su contraseña">
                    </div>
                    <div class="form-group">
                        <label for="apellidos">Apellidos</label>
                        <input type="text" name="apellidos" class="form-control" id="apellidos" placeholder="Ingrese apellidos">
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="text" name="email" class="form-control" id="email" placeholder="Ingrese email">
                    </div>
                </div>
                <div class="col-sm-12">
                    <div class="form-group mb-0">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" name="terms" class="custom-control-input" id="terms">
                            <label class="custom-control-label" for="terms">Estoy de acuerdo con los <a href="#" data-toggle="modal" data-target="#terminos">términos de servicios</a>.</label>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.card-body -->
            <div class="card-footer text-center">
                <button type="submit" class="btn btn-lg bg-gradient-primary">Registrarme</button>
            </div>
        </form>
      
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
<script src="/commerce/Util/Js/jquery.validate.min.js"></script>
<script src="/commerce/Util/Js/additional-methods.min.js"></script>
<script src="/commerce/Util/Js/sweetalert2.min.js"></script>
<script src="/commerce/Views/register.js"></script>
</body>
</html>
