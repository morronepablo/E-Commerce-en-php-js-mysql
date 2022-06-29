<?php
  session_start();
  include_once $_SERVER["DOCUMENT_ROOT"].'/commerce/Views/Layouts/header.php';
?>
    <title>Inicio | Morrone</title>
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Inicio</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="/commerce/">Inicio</a></li>
              <li class="breadcrumb-item active">Ecommerce</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>
    <style>
      .titulo_producto{
        color: #000;
      }
      .titulo_producto:visited{
        color: #000;
      }
      .titulo_producto:focus{
        border-bottom: 1px solid;
      }
      .titulo_producto:hover{
        border-bottom: 1px solid;
      }
      .titulo_producto:active{
        background: #000;
        color: #fff;
      }
    </style>
    <section class="content">

      <!-- Default box -->
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">Productos</h3>
        </div>
        <div class="card-body">
          <div id="productos" class="row">
            <div id="loader_3" class="overlay">
              <i class="fas fa-4x fa-sync-alt fa-spin"></i>
            </div>
          </div>
        </div>
        <!-- /.card-body -->
        <div class="card-footer">
          Footer
        </div>
        <!-- /.card-footer-->
      </div>
      <!-- /.card -->

    </section>
<?php
  include_once $_SERVER["DOCUMENT_ROOT"].'/commerce/Views/Layouts/footer.php';
?>
<script src="/commerce/index.js"></script>
      