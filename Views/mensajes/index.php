<?php
include_once 'layouts/header.php';
?>
<!-- Modal Crear Marca -->
<div class="modal fade modal-right" id="modal_crear_mensaje" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Mensaje nuevo</h5>
            </div>
            <div class="modal-body">
                <form id="form-mensaje" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="para">Para:</label>
                        <select name="para" id="para" class="form-control select2-info" data-dropdown-css-class="select2-info" style="width: 100%;"></select>
                    </div>
                    <div class="form-group">
                        <label for="asunto">Asunto:</label>
                        <input type="text" name="asunto" class="form-control" id="sunto" placeholder="Ingrese asunto">
                    </div>
                    <div class="form-group">
                        <label for="contenido">Contenido:</label>
                        <textarea type="text" style="height: 200px;" name="contenido" id="contenido" class="form-control" placeholder="Ingrese contenido"></textarea>
                    </div>
                    
            </div>
            <div class="modal-footer">
                <button type="button" id="cerrar_modal_crear_mensaje" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="submit" class="btn btn-primary">Enviar</button>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Fin Modal -->
<title>Mensajes | Morrone</title>
<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>Mensajes</h1>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="../index.php">Inicio</a></li>
                    <li class="breadcrumb-item active">Mensajes</li>
                </ol>
            </div>
        </div>
    </div><!-- /.container-fluid -->
</section>
<style>
    .modal.modal-right .modal-dialog {
        top: 145px;
        max-width: 500px;
        max-height: 500px;
        min-height: calc(100vh - 0);
    }
    .modal.modal-right.show .modal-dialog {
        transform: translate(0, 0);
    }
    .modal.modal-right .modal-content {
        height: calc(100vh - 0);
        overflow-y: auto;
    }
    .modal.modal-right .modal-dialog {
        transform: translate(100%, 0);
        margin: 0 0 0 auto;
    }
</style>
<section class="content">
    <div class="row">
        <div class="col-md-3">
            <button data-bs-toggle="modal" data-bs-target="#modal_crear_mensaje" class="btn btn-outline-info btn-block mb-3"><i class="fas fa-plus mr-2"></i>Redactar</button>
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Carpetas</h3>
                    <div class="card-tools">
                        <button type="button" class="btn btn-tool" data-card-widget="collapse">
                            <i class="fas fa-minus"></i>
                        </button>
                    </div>
                </div>
                <div class="card-body p-0">
                    <ul class="nav nav-pills flex-column">
                        <li class="nav-item">
                            <a id="recibidos" href="#" class="nav-link active  ">
                                
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="sent.php" class="nav-link">
                                <i class="far fa-envelope"></i> Enviados
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="favorites.php" class="nav-link">
                                <i class="far fa-star"></i> Favoritos
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="trash.php" class="nav-link">
                                <i class="far fa-trash-alt"></i> Papelera
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
        <div class="col-md-9">
            <div class="card card-info">
                <div class="card-header">
                    <h3 class="card-title">Recibidos</h3>
                </div>
                <div class="card-body p-0">
                    <div class="mailbox-controls">
                        <button type="button" title="Seleccionador grupal" class="btn btn-default btn-sm checkbox-toggle"><i class="far fa-square"></i>
                        </button>
                        <button type="button" title="Eliminar grupo seleccionado" class="btn btn-default btn-sm eliminar_mensajes">
                            <i class="far fa-trash-alt"></i>
                        </button>
                        <button type="button" title="Actualizar mensajes" class="btn btn-default btn-sm actualizar_mensajes">
                            <i class="fas fa-sync-alt"></i>
                        </button>
                    </div>
                    <table id="mensajes_recibidos" class="table table-hover mailbox-messages">
                        <thead class="table-primary">
                            <tr>
                                <th></th>
                                <th></th>
                                <th>Emisor</th>
                                <th>Asunto</th>
                                <th>Fecha</th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>


<?php
include_once 'layouts/footer.php';
?>
<script src="index.js"></script>