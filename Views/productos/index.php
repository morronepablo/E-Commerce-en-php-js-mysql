<?php
  session_start();
  include_once $_SERVER["DOCUMENT_ROOT"].'/commerce/Views/Layouts/header.php';
?>
<!-- Modal Crear Producto -->
<div class="modal fade" id="modal_crear_producto" role="dialog">
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

<!-- Modal Editar Solicitud -->
<div class="modal fade" id="modal_editar_sol" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Editar solicitud marca</h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="card card-widget widget-user">
                    <div class="widget-user-header bg-info">
                        <h3 id="widget_nombre_sol" class="widget-user-username"></h3>
                        <h5 id="widget_desc_sol" class="widget-user-desc"></h5>
                    </div>
                    <div class="widget-user-image">
                        <img id="widget_imagen_sol" class="img-circle elevation-2" src="" alt="imagen solicitud">
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
                <form id="form-marca_mod_sol" enctype="multipart/form-data">
                    <input type="hidden" id="id_marca_mod_sol" name="id_marca_mod_sol">
                    <div class="form-group">
                        <label for="nombre_mod_sol">Nombre</label>
                        <input type="text" name="nombre_mod_sol" class="form-control" id="nombre_mod_sol" placeholder="Ingrese nombre">
                    </div>
                    <div class="form-group">
                        <label for="desc_mod_sol">Descripción</label>
                        <input type="text" name="desc_mod_sol" class="form-control" id="desc_mod_sol" placeholder="Ingrese una descripción">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputFile">Imagen</label>
                        <div class="input-group">
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" name="imagen_mod_sol" id="imagen_mod_sol">
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

<!-- Modal Rechazar Solicitud -->
<div class="modal fade" id="modal_rechazar_sol" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Rechazar solicitud marca</h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="card card-widget widget-user">
                    <div class="widget-user-header bg-info">
                        <h3 id="widget_nombre_sol_rechazar" class="widget-user-username"></h3>
                        <h5 id="widget_desc_sol_rechazar" class="widget-user-desc"></h5>
                    </div>
                    <div class="widget-user-image">
                        <img id="widget_imagen_sol_rechazar" class="img-circle elevation-2" src="" alt="imagen solicitud">
                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <div class="col-sm-12 border-right">
                                <div class="description-block">
                                    <h5 class="description-header">Solicitante</h5>
                                    <span id="solicitante" class="description-text"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <form id="form-marca_rechazar_sol" enctype="multipart/form-data">
                    <input type="hidden" id="id_marca_rechazar_sol" name="id_marca_rechazar_sol">
                    <input type="hidden" id="nombre_rechazar_sol" name="nombre_rechazar_sol">
                    <div class="form-group">
                        <label for="observaciones">Observaciones</label>
                        <textarea style="height: 150px" type="text" name="observaciones" class="form-control" id="observaciones" placeholder="Ingrese observaciones"></textarea>
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

<title>Productos | Morrone</title>
<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 id="btn_adm">Productos <button class="btn btn-success ml-3" type="button" data-bs-toggle="modal" data-bs-target="#modal_crear_producto">Crear producto</button></h1>
                <h1 id="btn_ven">Productos <button class="btn btn-success ml-3" type="button" data-bs-toggle="modal" data-bs-target="#modal_crear_solicitud">Crear solicitud</button></h1>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="/commerce/ ">Inicio</a></li>
                    <li class="breadcrumb-item active">Productos</li>
                </ol>
            </div>
        </div>
    </div><!-- /.container-fluid -->
</section>

<section class="content">
    <div class="card">
        <div class="card-header p-2">
            <ul class="nav nav-pills">
                <li class="nav-item"><a class="nav-link active" href="#tab_productos" data-toggle="tab">Productos</a></li>
                <li class="nav-item"><a class="nav-link" href="#tab_sol" data-toggle="tab">Solicitudes</a></li>
                <li class="nav-item"><a class="nav-link" href="#tab_por_aprobar" data-toggle="tab">Solicitudes por aprobar</a></li>
            </ul>
        </div>
        <div class="card-body">
            <div class="tab-content">
                <div class="tab-pane active" id="tab_productos">
                    <table id="productos" class="table table-hover">
                        <thead class="bg-info">
                            <tr>
                                <th>Productos</th>
                            </tr>
                        </thead>
                        <tbody>
            
                        </tbody>
                    </table>
                </div>
                <div class="tab-pane" id="tab_sol">
                    <table id="mis_solicitudes_productos" class="table table-hover">
                        <thead class="bg-info">
                            <tr>
                                <th>Mis solicitudes de productos</th>
                            </tr>
                        </thead>
                        <tbody>
            
                        </tbody>
                    </table>
                </div>
                <div class="tab-pane" id="tab_por_aprobar">
                    <table id="solicitudes_por_aprobar" class="table table-hover">
                        <thead class="bg-info">
                            <tr>
                                <th>Solicitudes por aprobar</th>
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
  include_once $_SERVER["DOCUMENT_ROOT"].'/commerce/Views/Layouts/footer.php';
?>
<script src="/commerce/Views/Productos/index.js"></script>