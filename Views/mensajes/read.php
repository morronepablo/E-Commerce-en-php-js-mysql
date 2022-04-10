<?php
if (!empty($_GET['id']) && !empty($_GET['option'])) {
    session_start();
    $_SESSION['message-verification'] = $_GET['id'];
    $_SESSION['message-option'] = $_GET['option'];
    include_once 'layouts/header.php';
?>
    <title>Read | Morrone</title>
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h5 id="titulo_mensaje"></h5>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="../index.php">Inicio</a></li>
                        <li class="breadcrumb-item active">Read</li>
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
                                <a id="recibidos" href="../mensajes/" class="nav-link">
                                    <i class="fas fa-inbox"></i> Recibidos
                                    <span class="badge bg-primary float-right">12</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a id="enviados" href="#" class="nav-link">
                                    <i class="far fa-envelope"></i> Enviados
                                </a>
                            </li>
                            <li class="nav-item">
                                <a id="favoritos" href="#" class="nav-link">
                                    <i class="far fa-star"></i> Favoritos
                                </a>
                            </li>
                            <li class="nav-item">
                                <a id="papelera" href="#" class="nav-link">
                                    <i class="far fa-trash-alt"></i> Papelera
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-9">
                <div id="contenido_mensaje" class="card card-info">
                    
                </div>
            </div>
        </div>
    </section>


<?php
    include_once 'layouts/footer.php';
} else {
    header('Location: ../../index.php');
}
?>
<script src="read.js"></script>