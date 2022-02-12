<?php
include_once 'Layouts/general/header.php';
?>
<!-- Modal Crear Marca -->
<div class="modal fade" id="modal_crear_marca" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Crear marca</h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="form-marca" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="nombre">Nombre</label>
                        <input type="text" name="nombre" class="form-control" id="nombre" placeholder="Ingrese nombre">
                    </div>
                    <div class="form-group">
                        <label for="desc">Descripción</label>
                        <input type="text" name="desc" class="form-control" id="desc" placeholder="Ingrese una descripción">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputFile">Imagen</label>
                        <div class="input-group">
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" name="imagen" id="imagen">
                                <label class="custom-file-label" for="exampleInputFile">Seleccione una imagen</label>
                            </div>
                        </div>
                    </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="submit" class="btn btn-primary">Guardar</button>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Fin Modal -->

<!-- Modal Editar Marca -->
<div class="modal fade" id="modal_editar_marca" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Editar marca</h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="card card-widget widget-user">
                    <div class="widget-user-header bg-info">
                        <h3 id="widget_nombre_marca" class="widget-user-username"></h3>
                        <h5 id="widget_desc_marca" class="widget-user-desc"></h5>
                    </div>
                    <div class="widget-user-image">
                        <img id="widget_imagen_marca" class="img-circle elevation-2" src="" alt="imagen marca">
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-sm-4 border-right">
                                <div class="description-block">
                                    <h5 class="description-header">3,200</h5>
                                    <span class="description-text">SALES</span>
                                </div>
                            </div>
                            <div class="col-sm-4 border-right">
                                <div class="description-block">
                                    <h5 class="description-header">13,000</h5>
                                    <span class="description-text">FOLLOWERS</span>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="description-block">
                                    <h5 class="description-header">35</h5>
                                    <span class="description-text">PRODUCTS</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <form id="form-marca_mod" enctype="multipart/form-data">
                    <input type="hidden" id="id_marca_mod" name="id_marca_mod">
                    <div class="form-group">
                        <label for="nombre_mod">Nombre</label>
                        <input type="text" name="nombre_mod" class="form-control" id="nombre_mod" placeholder="Ingrese nombre">
                    </div>
                    <div class="form-group">
                        <label for="desc_mod">Descripción</label>
                        <input type="text" name="desc_mod" class="form-control" id="desc_mod" placeholder="Ingrese una descripción">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputFile">Imagen</label>
                        <div class="input-group">
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" name="imagen_mod" id="imagen_mod">
                                <label class="custom-file-label" for="exampleInputFile">Seleccione una imagen</label>
                            </div>
                        </div>
                    </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="submit" class="btn btn-primary">Guardar</button>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Fin Modal -->

<!-- Modal Crear Solicitud -->
<div class="modal fade" id="modal_crear_solicitud" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Crear solicitud para marca</h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
                <div class="modal-body">
                    <form id="form-marca_sol" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="nombre_sol">Nombre</label>
                            <input type="text" name="nombre_sol" class="form-control" id="nombre_sol" placeholder="Ingrese nombre">
                        </div>
                        <div class="form-group">
                            <label for="desc_sol">Descripción</label>
                            <input type="text" name="desc_sol" class="form-control" id="desc_sol" placeholder="Ingrese una descripción">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputFile">Imagen</label>
                            <div class="input-group">
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" name="imagen_sol" id="imagen">
                                    <label class="custom-file-label" for="exampleInputFile">Seleccione una imagen</label>
                                </div>
                            </div>
                        </div>
                </div>
            <div class="modal-footer">
                <span>
                    Esta solicitud estará en lista de espera para ser enviada a todos los administradores para ser revisada, si los datos son correctos se aprobará, si no se le enviará un mensaje para que haga las correcciones correspondientes.
                </span>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="submit" class="btn btn-primary">Guardar</button>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Fin Modal -->

<title>Marcas | Morrone</title>
<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 id="btn_adm">Marcas <button class="btn btn-success ml-3" type="button" data-bs-toggle="modal" data-bs-target="#modal_crear_marca">Crear marca</button></h1>
                <h1 id="btn_ven">Marcas <button class="btn btn-success ml-3" type="button" data-bs-toggle="modal" data-bs-target="#modal_crear_solicitud">Crear solicitud</button></h1>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="../index.php">Inicio</a></li>
                    <li class="breadcrumb-item active">Marcas</li>
                </ol>
            </div>
        </div>
    </div><!-- /.container-fluid -->
</section>

<section class="content">
    <div class="card">
        <div class="card-header p-2">
            <ul class="nav nav-pills">
                <li class="nav-item"><a class="nav-link active" href="#tab_marcas" data-toggle="tab">Marcas</a></li>
                <li class="nav-item"><a class="nav-link" href="#tab_sol" data-toggle="tab">Solicitudes</a></li>
                <li class="nav-item"><a class="nav-link" href="#tab_por_aprobar" data-toggle="tab">Solicitudes por aprobar</a></li>
            </ul>
        </div>
        <div class="card-body">
            <div class="tab-content">
                <div class="tab-pane active" id="tab_marcas">
                    <table id="marca" class="table table-hover">
                        <thead>
                            <tr>
                                <th>Marca</th>
                                <th>Descripcion</th>
                                <th>Imagen</th>
                                <th>Fecha Creación</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
            
                        </tbody>
                    </table>
                </div>
                <div class="tab-pane" id="tab_sol">
                    tab2
                </div>
                <div class="tab-pane" id="tab_por_aprobar">
                    tab3
                </div>
            </div>
        </div>
    </div>
</section>
<?php
include_once 'Layouts/general/footer.php';
?>
<script src="marcas.js"></script>