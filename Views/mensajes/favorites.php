<?php
include_once 'layouts/header.php';
?>
<title>Favoritos | Morrone</title>
<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>Favoritos</h1>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="../index.php">Inicio</a></li>
                    <li class="breadcrumb-item active">Favoritos</li>
                </ol>
            </div>
        </div>
    </div><!-- /.container-fluid -->
</section>
<section class="content">
    <div class="row">
        <div class="col-md-3">
            <button class="btn btn-outline-info btn-block mb-3"><i class="fas fa-plus mr-2"></i>Redactar</button>
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
                            <a href="../mensajes" class="nav-link">
                                <i class="fas fa-inbox"></i> Recibidos
                                <span class="badge bg-primary float-right">12</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="sent.php" class="nav-link">
                                <i class="far fa-envelope"></i> Enviados
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link active">
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
                    <h3 class="card-title">Favoritos</h3>
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
                    <table id="mensajes_favoritos" class="table table-hover mailbox-messages">
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
<script src="favorites.js"></script>