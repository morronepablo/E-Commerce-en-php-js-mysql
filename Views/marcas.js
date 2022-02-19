$(document).ready(function() {
    Loader();
    $('#btn_adm').hide();
    $('#btn_ven').hide();
    //setTimeout(verificar_sesion, 2000);
    bsCustomFileInput.init();
    verificar_sesion();
    // toastr.options = {
    //     'debug': false,
    //     'positionClass': 'toast-bottom-full-width',
    //     'onclick': null,
    //     'fadeIn': 300,
    //     'fadeOut': 1000,
    //     'timeOut': 5000,
    //     'extendedTimeOut': 1000
    // }
    
    async function read_notificaciones() {
        funcion = "read_notificaciones";
        let data = await fetch('../Controllers/NotificacionController.php',{
            method: 'POST',
            headers: {'Content-Type':'application/x-www-form-urlencoded'},
            body: 'funcion=' + funcion
        })
        if(data.ok) {
            let response = await data.text();
            //console.log(response);
            try {
                let notificaciones = JSON.parse(response);
                //console.log(notificaciones);
                let template1 = '';
                let template = `
                <a class="nav-link" data-toggle="dropdown" href="#">`;
                    if(notificaciones.length == 0) {
                        template += `
                            <i class="far fa-bell"></i>
                        `;
                        template1 += `
                            Notificaciones
                        `;
                    } else {
                        template += `
                            <i class="far fa-bell"></i>
                            <span class="badge badge-warning navbar-badge">${notificaciones.length}</span>
                        `;
                        template1 += `
                            Notificaciones <span class="badge badge-warning right">${notificaciones.length}</span>
                        `;
                    }
                template += `</a>
                <div id="notificaciones" class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                `;
                $('#nav_cont_noti').html(template1);
                
                template += `
                    <span class="dropdown-item dropdown-header">${notificaciones.length} Notificaciones</span>
                `;
                notificaciones.forEach(notificacion => {
                    let fecha = moment(notificacion.fecha+' '+notificacion.hora, 'DD/MM/YYYY HH/:mm');
                    let horas = moment(notificacion.hora, 'HH/:mm');
                    let fecha_hora;
                    if(notificacion.hoy == '1') {
                        fecha_hora = horas.fromNow();
                    } else {
                        fecha_hora = fecha.format('LLL');
                    }
                    template += `
                    <div class="dropdown-divider"></div>
                        <a href="../${notificacion.url_1}&&noti=${notificacion.id}" class="dropdown-item">
                            <div class="media">
                                <img src="../Util/Img/producto/${notificacion.imagen}" alt="User Avatar" class="img-size-50 img-circle mr-3">
                                <div class="media-body">
                                    <h3 class="dropdown-item-title">
                                        ${notificacion.titulo}
                                    </h3>
                                    <p class="text-sm">${notificacion.asunto}</p>
                                    <p class="text-sm text-muted">${notificacion.contenido}</p>
                                    <span class="float-right text-muted text-sm">${fecha_hora}</span>
                                </div>
                            </div>
                        </a>
                    <div class="dropdown-divider"></div>
                    `;
                });
                template += `
                <a href="../Views/notificaciones.php" class="dropdown-item dropdown-footer">Ver todas las notificaciones</a>
                </div>`;
                $('#notificacion').html(template);
            } catch (error) {
                console.error(error);
                console.log(response);
                
            }

        } else {
            Swal.fire({
                icon: 'error',
                title: data.statusText,
                text: 'Hubo un conflicto de código: ' + data.status,
            })

        }
    }

    async function read_favoritos() {
        funcion = "read_favoritos";
        let data = await fetch('../Controllers/FavoritoController.php',{
            method: 'POST',
            headers: {'Content-Type':'application/x-www-form-urlencoded'},
            body: 'funcion=' + funcion
        })
        if(data.ok) {
            let response = await data.text();
            //console.log(response);
            try {
                let favoritos = JSON.parse(response);
                //console.log(favoritos);
                let template1 = '';
                let template = `
                <a class="nav-link" data-toggle="dropdown" href="#">`;
                if(favoritos.length == 0) {
                    template += `
                        <i class="far fa-heart"></i>
                    `;
                    template1 += `
                        Favoritos
                    `;
                } else {
                    template += `
                        <i class="far fa-heart"></i>
                        <span class="badge badge-warning navbar-badge">${favoritos.length}</span>
                    `;
                    template1 += `
                        Favoritos <span class="badge badge-warning right">${favoritos.length}</span>
                    `;
                }
                template +=`
                </a>
                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">`;                
                template += `
                    <span class="dropdown-item dropdown-header">${favoritos.length} Favoritos</span>
                `;
                favoritos.forEach(favorito => {
                    let fecha = moment(favorito.fecha+' '+favorito.hora, 'DD/MM/YYYY HH/:mm');
                    let horas = moment(favorito.hora, 'HH/:mm');
                    let fecha_hora;
                    if(favorito.hoy == '1') {
                        fecha_hora = horas.fromNow();
                    } else {
                        fecha_hora = fecha.format('LLL');
                    }
                    template += `
                    <div class="dropdown-divider"></div>
                        <a href="../${favorito.url}" class="dropdown-item">
                            <div class="media">
                                <img src="../Util/Img/producto/${favorito.imagen}" alt="User Avatar" class="img-size-50 img-circle mr-3">
                                <div class="media-body">
                                    <h3 class="dropdown-item-title">
                                        ${favorito.titulo}
                                    </h3>
                                    
                                    <p class="text-sm text-muted">${favorito.precio}</p>
                                    <span class="float-right text-muted text-sm">${fecha_hora}</span>
                                </div>
                            </div>
                        </a>
                    <div class="dropdown-divider"></div>
                    `;
                });
                template += `
                    <a href="../Views/favoritos.php" class="dropdown-item dropdown-footer">Ver todos tus favoritos</a>
                </div>`;
                $('#nav_cont_fav').html(template1);
                $('#favorito').html(template);
            } catch (error) {
                console.error(error);
                console.log(response);
                
            }

        } else {
            Swal.fire({
                icon: 'error',
                title: data.statusText,
                text: 'Hubo un conflicto de código: ' + data.status,
            })

        }
    }

    function llenar_menu_superior(usuario) {
        let template = ``;
        if(usuario === undefined || usuario == '' || usuario == null) {
            template = `
            <li class="nav-item">
              <a class="nav-link" href="../Views/register.php" role="button">
                <i class="fas fa-user-plus"></i> Registrarse
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="../Views/login.php" role="button">
                <i class="far fa-user"></i> Iniciar sesión
              </a>
            </li>
            `;
        } else {
            template = `
            <li class="nav-item dropdown">
              <a class="nav-link" data-toggle="dropdown" href="#">
                <i class="fas fa-shopping-cart"></i>
                <span class="badge badge-danger navbar-badge">3</span>
              </a>
              <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                <a href="#" class="dropdown-item">
                  <div class="media">
                    <img src="../../dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
                    <div class="media-body">
                      <h3 class="dropdown-item-title">
                        Brad Diesel
                        <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span>
                      </h3>
                      <p class="text-sm">Call me whenever you can...</p>
                      <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                    </div>
                  </div>
                </a>
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item">
                  <div class="media">
                    <img src="../../dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
                    <div class="media-body">
                      <h3 class="dropdown-item-title">
                        John Pierce
                        <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span>
                      </h3>
                      <p class="text-sm">I got your message bro</p>
                      <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                    </div>
                  </div>
                </a>
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item">
                  <div class="media">
                    <img src="../../dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
                    <div class="media-body">
                      <h3 class="dropdown-item-title">
                        Nora Silvester
                        <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span>
                      </h3>
                      <p class="text-sm">The subject goes here</p>
                      <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p>
                    </div>
                  </div>
                </a>
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item dropdown-footer">See All Messages</a>
              </div>
            </li>
            <li id="notificacion" class="nav-item dropdown">
              
            </li>
            <li id="favorito" class="nav-item dropdown">
              
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <img  src="../Util/Img/Users/${usuario.avatar}" width="30" height="30" class="img-fluid img-circle" alt="">
                <span>${usuario.user}</span>
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                <li><a class="dropdown-item" href="../Views/mi_perfil.php"><i class="fas fa-user-cog"></i> Mi perfil</a></li>
                <li><a class="dropdown-item" href="#"><i class="fas fa-shopping-basket"></i> Mi pedidos</a></li>
                <li><a class="dropdown-item" href="../Controllers/logout.php"><i class="fas fa-user-times"></i> Cerrar sesión</a></li>
              </ul>
            </li>
            `;
        }
        $('#loader_1').hide(500);
        $('#menu_superior').html(template);
    }

    function llenar_menu_lateral(usuario) {
        let template = ``;
        if(usuario === undefined || usuario == '' || usuario == null) {
            
        } else {
            template = `
            <li class="nav-header">PERFIL</li>
            <li id="nav_notificaciones" class="nav-item">
                <a id="active_nav_notificaciones" href="../Views/notificaciones.php" class="nav-link">
                <i class="nav-icon far fa-bell"></i>
                <p id="nav_cont_noti">
                    Notificaciones
                </p>
                </a>
            </li>
            <li id="nav_favoritos" class="nav-item">
                <a id="active_nav_favoritos" href="../Views/favoritos.php" class="nav-link">
                <i class="nav-icon far fa-heart"></i>
                <p id="nav_cont_fav">
                    Favoritos
                </p>
                </a>
            </li>`;
            if(usuario.tipo_usuario == 1) {
                template+=`<li class="nav-header">PRODUCTO</li>
                <li id="nav_marcas" class="nav-item">
                    <a id="active_nav_marcas" href="../Views/marcas.php" class="nav-link">
                    <i class="nav-icon fas fa-apple-alt"></i>
                    <p id="nav_cont_marc">
                        Marcas
                    </p>
                    </a>
                </li>
                `;
            }
            if(usuario.tipo_usuario == 2) {
                template+=`<li class="nav-header">PRODUCTO</li>
                <li id="nav_marcas" class="nav-item">
                    <a id="active_nav_marcas" href="../Views/marcas.php" class="nav-link">
                    <i class="nav-icon fas fa-apple-alt"></i>
                    <p id="nav_cont_marc">
                        Marcas
                    </p>
                    </a>
                </li>
                `;
            }
            if(usuario.tipo_usuario == 3) {
                template+=`<li class="nav-header">PRODUCTO</li>
                <li id="nav_marcas" class="nav-item">
                    <a id="active_nav_marcas" href="../Views/marcas.php" class="nav-link">
                    <i class="nav-icon fas fa-apple-alt"></i>
                    <p id="nav_cont_marc">
                        Marcas
                    </p>
                    </a>
                </li>
                `;
            }
        }
        $('#loader_2').hide(500);
        $('#menu_lateral').html(template);
    }

    async function verificar_sesion() {
        funcion = "verificar_sesion";
        let data = await fetch('../Controllers/UsuarioController.php',{
            method: 'POST',
            headers: {'Content-Type':'application/x-www-form-urlencoded'},
            body: 'funcion='+funcion
        })
        if(data.ok) {
            let response = await data.text();
            //conselo.log(response);
            try {
                if(response != '') {
                    let sesion = JSON.parse(response);
                    if(sesion.tipo_usuario != 4) {
                        llenar_menu_superior(sesion);
                        llenar_menu_lateral(sesion);
                        $('#active_nav_marcas').addClass('active');
                        $('#avatar_menu').attr('src', '../Util/Img/Users/' + sesion.avatar);
                        $('#usuario_menu').text(sesion.user);
                        read_notificaciones();
                        read_favoritos();
                        read_all_marcas();
                        if(sesion.tipo_usuario == 1 || sesion.tipo_usuario ==2) {
                            CloseLoader();
                            $('#btn_adm').show();
                        } else if(sesion.tipo_usuario == 3) {
                            read_tus_solicitudes();
                            CloseLoader();
                            $('#btn_ven').show();
                        }
                    } else {
                        location.href='../index.php';
                    }
                } else {
                    location.href='login.php';
                }
            } catch (error) {
                console.error(error);
                console.log(response);
            }
        } else {
            Swal.fire({
                icon: 'error',
                title: data.statusText,
                text: 'Hubo un conflicto de código: ' + data.status,
            })
        }
    }

    async function read_all_marcas() {
        let funcion = "read_all_marcas";
        let data = await fetch('../Controllers/MarcaController.php',{
            method: 'POST',
            headers: {'Content-Type':'application/x-www-form-urlencoded'},
            body: 'funcion=' + funcion
        })
        if(data.ok) {
            let response = await data.text();
            //console.log(response);
            try {
                let marcas = JSON.parse(response);
                console.log(marcas);
                
                $('#marca').DataTable( {
                    data: marcas,
                    "aaSorting": [],
                    "searching": true,
                    "scrollX": true,
                    "autoWidth": false,
                    "responsive": true,
                    "processing": true,
                    columns: [
                        { data: "nombre" },
                        { data: "descripcion" },
                        {
                            "render": function(data, type, datos, meta) {
                                return `<img width="100" height="100" src="../Util/Img/marca/${datos.imagen}">`;
                            }
                        },
                        { data: "fecha_creacion" },
                        {
                            "render": function(data, type, datos, meta) {
                                if(datos.tipo_usuario == 3) {
                                    return `<button class="alerta_usuario btn btn-info" title="Editar marca" type="button"><i class="fas fa-pencil-alt"></i></button>
                                        <button class="alerta_usuario btn btn-danger" title="Eliminar marca" type="button"><i class="fas fa-trash-alt"></i></button>`;
                                } else {
                                    return `<button id="${datos.id}" nombre="${datos.nombre}" img="${datos.imagen}" desc="${datos.descripcion}" class="edit btn btn-info" title="Editar marca" type="button" data-bs-toggle="modal" data-bs-target="#modal_editar_marca"><i class="fas fa-pencil-alt"></i></button>
                                        <button id="${datos.id}" nombre="${datos.nombre}" img="${datos.imagen}" class="remove btn btn-danger" title="Eliminar marca" type="button"><i class="fas fa-trash-alt"></i></button>`;
                                }
                            }
                        }
                    ],
                    "destroy": true,
                    "language": espanol
                });
            } catch (error) {
                console.error(error);
                console.log(response);
            }

        } else {
            Swal.fire({
                icon: 'error',
                title: data.statusText,
                text: 'Hubo un conflicto de código: ' + data.status,
            })

        }
    }

    async function read_tus_solicitudes() {
        let funcion = "read_tus_solicitudes";
        let data = await fetch('../Controllers/SolicitudMarcaController.php',{
            method: 'POST',
            headers: {'Content-Type':'application/x-www-form-urlencoded'},
            body: 'funcion=' + funcion
        })
        if(data.ok) {
            let response = await data.text();
            //console.log(response);
            try {
                let solicitudes = JSON.parse(response);
                console.log(solicitudes);
                
                $('#mis_solicitudes_marcas').DataTable( {
                    data: solicitudes,
                    "aaSorting": [],
                    "searching": true,
                    "scrollX": false,
                    "autoWidth": false,
                    "responsive": true,
                    "processing": true,
                    columns: [
                        { data: "nombre" },
                        { data: "descripcion" },
                        {
                            "render": function(data, type, datos, meta) {
                                return `<img width="100" height="100" src="../Util/Img/marca/${datos.imagen}">`;
                            }
                        },
                        { 
                            "render": function(data, type, datos, meta) {
                                if(datos.estado_envio == '0') {
                                    return `<button class="btn btn-primary">Enviar</button>`;
                                } else if (datos.estado_envio == '1') {
                                    return `<span class="badge bg-primary">Enviado</span>`;
                                } else if (datos.estado_envio == '2') {
                                    return `<span class="badge bg-success">Aceptado</span>`;
                                } else if (datos.estado_envio == '3') {
                                    return `<span class="badge bg-danger">Rechazado</span>`;
                                }
                            }
                        },
                        { 
                            "render": function(data, type, datos, meta) {
                                if(datos.estado_aprobado == '' || datos.estado_aprobado == null) {
                                    return `<span class="badge bg-info">En espera</span>`;
                                } else {
                                    return `<span>${datos.estado_aprobado}</span>`;
                                }
                            }
                        },
                        { data: "fecha_creacion" },
                        {
                            "render": function(data, type, datos, meta) {
                                if(datos.estado_envio == '0') {
                                    return `<button id="${datos.id}" nombre="${datos.nombre}" img="${datos.imagen}" desc="${datos.descripcion}" class="edit_solicitud btn btn-info" title="Editar solicitud" type="button" data-bs-toggle="modal" data-bs-target="#modal_editar_sol"><i class="fas fa-pencil-alt"></i></button>
                                        <button id="${datos.id}" nombre="${datos.nombre}" img="${datos.imagen}" class="remove_solicitud btn btn-danger" title="Eliminar solicitud" type="button"><i class="fas fa-trash-alt"></i></button>`;
                                } else if (datos.estado_envio == '1') {
                                    return `<button class="alerta_solicitud_enviada btn btn-info" title="Editar solicitud" type="button"><i class="fas fa-pencil-alt"></i></button>
                                        <button class="alerta_solicitud_enviada btn btn-danger" title="Eliminar solicitud" type="button"><i class="fas fa-trash-alt"></i></button>`;
                                } else if (datos.estado_envio == '2') {
                                    return `<button class="alerta_solicitud_aprobada btn btn-info" title="Editar solicitud" type="button"><i class="fas fa-pencil-alt"></i></button>
                                    <button id="${datos.id}" nombre="${datos.nombre}" img="${datos.imagen}" class="remove_solicitud btn btn-danger" title="Eliminar solicitud" type="button"><i class="fas fa-trash-alt"></i></button>`;
                                } else if (datos.estado_envio == '3') {
                                    return `<button id="${datos.id}" nombre="${datos.nombre}" img="${datos.imagen}" desc="${datos.descripcion}" class="edit_solicitud btn btn-info" title="Editar solicitud" type="button" data-bs-toggle="modal" data-bs-target="#modal_editar_sol"><i class="fas fa-pencil-alt"></i></button>
                                        <button id="${datos.id}" nombre="${datos.nombre}" img="${datos.imagen}" class="remove_solicitud btn btn-danger" title="Eliminar solicitud" type="button"><i class="fas fa-trash-alt"></i></button>`;
                                }
                            }
                        }
                    ],
                    "destroy": true,
                    "language": espanol
                });
            } catch (error) {
                console.error(error);
                console.log(response);
            }

        } else {
            Swal.fire({
                icon: 'error',
                title: data.statusText,
                text: 'Hubo un conflicto de código: ' + data.status,
            })

        }
    }

    async function crear_marca(datos) {
        let data = await fetch('../Controllers/MarcaController.php',{
            method: 'POST',   //No va un headers cuando se envia un FormData
            body: datos
        })
        if(data.ok) {
            let response = await data.text();
            //console.log(response);
            try {
                let respuesta = JSON.parse(response);
                if(respuesta.mensaje == 'success') {
                    Swal.fire({
                        position: 'center',
                        icon: 'success',
                        title: 'Se ha creado la marca',
                        showConfirmButton: false,
                        timer: 1500
                    }).then(function() {
                        read_all_marcas();
                        $('#form-marca').trigger('reset');
                    })
                }
            } catch (error) {
                console.error(error);
                console.log(response);
                Swal.fire({
                    icon: 'error',
                    title: 'Error!',
                    text: 'No se pudo crear la marca, comuniquese con el administrador del sistema.',
                })
            }

        } else {
            Swal.fire({
                icon: 'error',
                title: data.statusText,
                text: 'Hubo un conflicto de código: ' + data.status,
            })

        }
    }

    $.validator.setDefaults({
        submitHandler: function () {
            let funcion = 'crear_marca';
            let datos = new FormData($('#form-marca')[0]);
            datos.append("funcion", funcion);
            crear_marca(datos);
        }
    });

    $('#form-marca').validate({
        rules: {
            nombre: {
                required: true,
            },
            desc: {
                required: true,
            },
            imagen: {
                required: true,
                extension: "png|jpg|jpeg|bmp"
            }
        },
        messages: {
            nombre: {
                required: "* Este campo es obligatorio"
            },
            desc: {
                required: "* Este campo es obligatorio"
            },
            imagen: {
                required: "* Este campo es obligatorio",
                extension: "* Debe elegir el formato de archivo png, jpg, jpeg, bmp"
            }
        },
        errorElement: 'span',
        errorPlacement: function (error, element) {
          error.addClass('invalid-feedback');
          element.closest('.form-group').append(error);
        },
        highlight: function (element, errorClass, validClass) {
          $(element).addClass('is-invalid');
          $(element).removeClass('is-valid');
        },
        unhighlight: function (element, errorClass, validClass) {
          $(element).removeClass('is-invalid');
          $(element).addClass('is-valid');
        }
    });

    $(document).on('click', '.edit', (e) => {
        let elemento    = $(this)[0].activeElement;
        let id          = $(elemento).attr('id');
        let nombre      = $(elemento).attr('nombre');
        let descripcion = $(elemento).attr('desc');
        let img         = $(elemento).attr('img');
        //console.log(id,nombre,img);
        $('#widget_nombre_marca').text(nombre);
        $('#widget_desc_marca').text(descripcion);
        $('#widget_imagen_marca').attr('src', '../Util/Img/marca/'+img);
        $('#nombre_mod').val(nombre);
        $('#desc_mod').val(descripcion);
        $('#id_marca_mod').val(id);
    });

    async function editar_marca(datos) {
        let data = await fetch('../Controllers/MarcaController.php',{
            method: 'POST',   //No va un headers cuando se envia un FormData
            body: datos
        })
        if(data.ok) {
            let response = await data.text();
            //console.log(response);
            try {
                let respuesta = JSON.parse(response);
                if(respuesta.mensaje == 'success') {
                    Swal.fire({
                        position: 'center',
                        icon: 'success',
                        title: 'Se ha editado la marca',
                        showConfirmButton: false,
                        timer: 1500
                    }).then(function() {
                        $('#widget_nombre_marca').text(respuesta.nombre_marca);
                        $('#widget_desc_marca').text(respuesta.desc_marca);
                        if(respuesta.img != '') {
                            $('#widget_imagen_marca').attr('src', '../Util/Img/marca/'+respuesta.img);
                        }
                        read_all_marcas();
                        $('#form-marca_mod').trigger('reset');
                        $('#modal_editar_marca').modal('hide')
                    })
                } else if (respuesta.mensaje == 'danger') {
                    Swal.fire({
                        icon: 'warning',
                        title: 'No alteró ningun cambio!',
                        text: 'Modifique algun cambio para realizar la edición.',
                    })
                }
            } catch (error) {
                console.error(error);
                console.log(response);
                if(response == 'error') {
                    Swal.fire({
                        icon: 'error',
                        title: 'Cuidado!',
                        text: 'No intente vulnerar el sistema, presione F5',
                    })
                }
            }

        } else {
            Swal.fire({
                icon: 'error',
                title: data.statusText,
                text: 'Hubo un conflicto de código: ' + data.status,
            })

        }
    }

    $.validator.setDefaults({
        submitHandler: function () {
            let funcion = 'editar_marca';
            let datos   = new FormData($('#form-marca_mod')[0]);
            datos.append('funcion', funcion);
            editar_marca(datos);
        }
    });

    $('#form-marca_mod').validate({
        rules: {
            nombre_mod: {
                required: true,
            },
            desc_mod: {
                required: true,
            },
            imagen_mod: {
                extension: "png|jpg|jpeg|bmp"
            }
        },
        messages: {
            nombre_mod: {
                required: "* Este campo es obligatorio"
            },
            desc_mod: {
                required: "* Este campo es obligatorio"
            },
            imagen_mod: {
                extension: "* Debe elegir el formato de archivo png, jpg, jpeg, bmp"
            }
        },
        errorElement: 'span',
        errorPlacement: function (error, element) {
          error.addClass('invalid-feedback');
          element.closest('.form-group').append(error);
        },
        highlight: function (element, errorClass, validClass) {
          $(element).addClass('is-invalid');
          $(element).removeClass('is-valid');
        },
        unhighlight: function (element, errorClass, validClass) {
          $(element).removeClass('is-invalid');
          $(element).addClass('is-valid');
        }
    });

    async function eliminar_marca(id, nombre) {
        let funcion = "eliminar_marca";
        let respuesta = '';
        let data = await fetch('../Controllers/MarcaController.php',{
            method: 'POST',
            headers: {'Content-Type':'application/x-www-form-urlencoded'},
            body: 'funcion=' + funcion + '&&id=' + id + '&&nombre=' + nombre
        })
        if(data.ok) {
            let response = await data.text();
            //console.log(response);
            try {
                respuesta = JSON.parse(response);
                
            } catch (error) {
                console.error(error);
                console.log(response);
                if(response == 'error') {
                    Swal.fire({
                        icon: 'error',
                        title: 'Cuidado!',
                        text: 'No intente vulnerar el sistema, presione F5',
                    })
                }
            }

        } else {
            Swal.fire({
                icon: 'error',
                title: data.statusText,
                text: 'Hubo un conflicto de código: ' + data.status,
            })

        }
        return respuesta;
    }

    $(document).on('click', '.remove', (e) => {
        let elemento = $(this)[0].activeElement;
        let id       = $(elemento).attr('id');
        let nombre   = $(elemento).attr('nombre');
        let img      = $(elemento).attr('img');
        const swalWithBootstrapButtons = Swal.mixin({
            customClass: {
              confirmButton: 'btn btn-success',
              cancelButton: 'btn btn-danger mr-2'
            },
            buttonsStyling: false
        })
          
        swalWithBootstrapButtons.fire({
            title: 'Está seguro de eliminar la marca '+nombre+' ?',
            text: "¡No podrás revertir esto!",
            imageUrl: '../Util/Img/marca/'+img,
            imageWidth: 100,
            imageHeight: 100,
            showCancelButton: true,
            confirmButtonText: '<i class="fas fa-check"></i>',
            cancelButtonText: '<i class="fas fa-times"></i>',
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {
                eliminar_marca(id, nombre).then(respuesta => {
                    if(respuesta.mensaje == 'success') {
                        swalWithBootstrapButtons.fire(
                            '¡Eliminado!',
                            'La marca '+nombre+' ha sido eliminada.',
                            'success'
                        )
                        read_all_marcas();
                    }
                })
            } else if (
              result.dismiss === Swal.DismissReason.cancel
            ) {
                swalWithBootstrapButtons.fire(
                    'Cancelado',
                    'No se ha eliminado la marca :)',
                    'error'
                )
            }
        })

    });

    $(document).on('click', '.alerta_usuario', (e) => {
        toastr.error('No tienes permiso para realizar esta acción', 'Error!');
    });

    $(document).on('click', '.alerta_solicitud_enviada', (e) => {
        toastr.warning('La solicitud ya fue enviada, no se puede editar ni eliminar', 'Cuidado !');
    });

    $(document).on('click', '.alerta_solicitud_aprobada', (e) => {
        toastr.warning('La solicitud fue aprobada, no se puede editar la solicitud', 'Cuidado !');
    });

    /* Creacion de solicitudes marca */
    async function crear_solicitud_marca(datos) {
        let data = await fetch('../Controllers/SolicitudMarcaController.php',{
            method: 'POST',   //No va un headers cuando se envia un FormData
            body: datos
        })
        if(data.ok) {
            let response = await data.text();
            //console.log(response);
            try {
                let respuesta = JSON.parse(response);
                if(respuesta.mensaje == 'success') {
                    Swal.fire({
                        position: 'center',
                        icon: 'success',
                        title: 'Se ha creado la solicitud marca',
                        showConfirmButton: false,
                        timer: 1500
                    }).then(function() {
                        read_tus_solicitudes();
                        $('#form-marca_sol').trigger('reset');
                    })
                }
            } catch (error) {
                console.error(error);
                console.log(response);
                if(response == "error_marca") {
                    Swal.fire({
                        icon: 'error',
                        title: 'Cuidado!',
                        text: 'La marca ya existe',
                    })
                } else if(response == "error_sol") {
                    Swal.fire({
                        icon: 'error',
                        title: 'Cuidado!',
                        text: 'Ya existe una solicitud para esta marca',
                    })
                }
            }

        } else {
            Swal.fire({
                icon: 'error',
                title: data.statusText,
                text: 'Hubo un conflicto de código: ' + data.status,
            })

        }
    }

    $.validator.setDefaults({
        submitHandler: function () {

            let funcion = 'crear_solicitud_marca';
            let datos = new FormData($('#form-marca_sol')[0]);
            datos.append("funcion", funcion);
            crear_solicitud_marca(datos);
        }
    });

    $('#form-marca_sol').validate({
        rules: {
            nombre_sol: {
                required: true,
            },
            desc_sol: {
                required: true,
            },
            imagen_sol: {
                required: true,
                extension: "png|jpg|jpeg|bmp"
            }
        },
        messages: {
            nombre_sol: {
                required: "* Este campo es obligatorio"
            },
            desc_sol: {
                required: "* Este campo es obligatorio"
            },
            imagen_sol: {
                required: "* Este campo es obligatorio",
                extension: "* Debe elegir el formato de archivo png, jpg, jpeg, bmp"
            }
        },
        errorElement: 'span',
        errorPlacement: function (error, element) {
          error.addClass('invalid-feedback');
          element.closest('.form-group').append(error);
        },
        highlight: function (element, errorClass, validClass) {
          $(element).addClass('is-invalid');
          $(element).removeClass('is-valid');
        },
        unhighlight: function (element, errorClass, validClass) {
          $(element).removeClass('is-invalid');
          $(element).addClass('is-valid');
        }
    });

    /* Editar solicitudes marca */

    $(document).on('click', '.edit_solicitud', (e) => {
        let elemento    = $(this)[0].activeElement;
        let id          = $(elemento).attr('id');
        let nombre      = $(elemento).attr('nombre');
        let descripcion = $(elemento).attr('desc');
        let img         = $(elemento).attr('img');
        //console.log(id,nombre,img,descripcion);
        $('#widget_nombre_sol').text(nombre);
        $('#widget_desc_sol').text(descripcion);
        $('#widget_imagen_sol').attr('src', '../Util/Img/marca/'+img);
        $('#nombre_mod_sol').val(nombre);
        $('#desc_mod_sol').val(descripcion);
        $('#id_marca_mod_sol').val(id);
    });

    async function editar_solicitud(datos) {
        let data = await fetch('../Controllers/SolicitudMarcaController.php',{
            method: 'POST',   //No va un headers cuando se envia un FormData
            body: datos
        })
        if(data.ok) {
            let response = await data.text();
            //console.log(response);
            try {
                let respuesta = JSON.parse(response);
                //console.log(respuesta);
                if(respuesta.mensaje == 'success') {
                    Swal.fire({
                        position: 'center',
                        icon: 'success',
                        title: 'Se ha editado la solicitud marca',
                        showConfirmButton: false,
                        timer: 1500
                    }).then(function() {
                        $('#widget_nombre_sol').text(respuesta.nombre_sol);
                        $('#widget_desc_sol').text(respuesta.desc_sol);
                        if(respuesta.img_sol != '') {
                            $('#widget_imagen_sol').attr('src', '../Util/Img/marca/'+respuesta.img_sol);
                        }
                        read_tus_solicitudes();
                        $('#form-marca_mod_sol').trigger('reset');
                        $('#modal_editar_sol').modal('hide')
                    })
                } else if (respuesta.mensaje == 'danger') {
                    Swal.fire({
                        icon: 'warning',
                        title: 'No alteró ningun cambio!',
                        text: 'Modifique algun cambio para realizar la edición.',
                    })
                }
            } catch (error) {
                console.error(error);
                console.log(response);
                if(response == 'error') {
                    Swal.fire({
                        icon: 'error',
                        title: 'Cuidado!',
                        text: 'No intente vulnerar el sistema, presione F5',
                    })
                }
            }

        } else {
            Swal.fire({
                icon: 'error',
                title: data.statusText,
                text: 'Hubo un conflicto de código: ' + data.status,
            })

        }
    }

    $.validator.setDefaults({
        submitHandler: function () {
            let funcion = 'editar_solicitud';
            let datos   = new FormData($('#form-marca_mod_sol')[0]);
            datos.append('funcion', funcion);
            editar_solicitud(datos);
        }
    });

    $('#form-marca_mod_sol').validate({
        rules: {
            nombre_mod_sol: {
                required: true,
            },
            desc_mod_sol: {
                required: true,
            },
            imagen_mod_sol: {
                extension: "png|jpg|jpeg|bmp"
            }
        },
        messages: {
            nombre_mod_sol: {
                required: "* Este campo es obligatorio"
            },
            desc_mod_sol: {
                required: "* Este campo es obligatorio"
            },
            imagen_mod_sol: {
                extension: "* Debe elegir el formato de archivo png, jpg, jpeg, bmp"
            }
        },
        errorElement: 'span',
        errorPlacement: function (error, element) {
          error.addClass('invalid-feedback');
          element.closest('.form-group').append(error);
        },
        highlight: function (element, errorClass, validClass) {
          $(element).addClass('is-invalid');
          $(element).removeClass('is-valid');
        },
        unhighlight: function (element, errorClass, validClass) {
          $(element).removeClass('is-invalid');
          $(element).addClass('is-valid');
        }
    });

    $(document).on('click', '.remove_solicitud', (e) => {
        alert('Eliminar solicitud');
    });


    function Loader(mensaje) {
        if(mensaje == '' || mensaje == null){
            mensaje = 'Cargando datos...';
        }
        Swal.fire({
            position: 'center',
            title: mensaje,
            html: '<i class="fas fa-4x fa-sync-alt fa-spin"></i>',
            showConfirmButton: false
        })
    }

    function CloseLoader(mensaje, tipo) {
        if(mensaje == '' || mensaje == null){
            Swal.close();
        } else {
            Swal.fire({
                position: 'center',
                icon: tipo,
                title: mensaje,
                showConfirmButton: false
            })
        }
    }

})

let espanol = {
    "autoFill": {
        "cancel": "Cancelar",
        "fill": "Llenar las celdas con <i>%d<i><\/i><\/i>",
        "fillHorizontal": "Llenar las celdas horizontalmente",
        "fillVertical": "Llenar las celdas verticalmente"
    },
    "decimal": ",",
    "emptyTable": "No hay datos disponibles en la Tabla",
    "infoFiltered": "Filtrado de _MAX_ entradas totales",
    "infoThousands": ".",
    "lengthMenu": "Mostrar _MENU_ entradas",
    "loadingRecords": "Cargando...",
    "paginate": {
        "first": "Primera",
        "last": "Ultima",
        "next": "Siguiente",
        "previous": "Anterior"
    },
    "processing": "Procesando...",
    "search": "Busqueda:",
    "searchBuilder": {
        "add": "Agregar condición",
        "button": {
            "0": "Constructor de búsqueda",
            "_": "Constructor de búsqueda (%d)"
        },
        "clearAll": "Quitar todo",
        "condition": "Condición",
        "conditions": {
            "date": {
                "after": "Luego",
                "before": "Luego",
                "between": "Entre",
                "empty": "Vacio",
                "equals": "Igual"
            }
        },
        "data": "Datos",
        "deleteTitle": "Borrar regla de filtrado",
        "leftTitle": "Criterio de alargado",
        "logicAnd": "Y",
        "logicOr": "O",
        "rightTitle": "Criterio de endentado",
        "title": {
            "0": "Constructor de búsqueda",
            "_": "Constructor de búsqueda (%d)"
        },
        "value": "Valor"
    },
    "thousands": ".",
    "zeroRecords": "No se encontraron registros que coincidan con la búsqueda",
    "datetime": {
        "previous": "Anterior",
        "next": "Siguiente",
        "hours": "Hora",
        "minutes": "Minuto",
        "seconds": "Segundo",
        "amPm": [
            "AM",
            "PM"
        ],
        "months": {
            "0": "Enero",
            "1": "Febrero",
            "10": "Noviembre",
            "11": "Diciembre",
            "2": "Marzo",
            "3": "Abril",
            "4": "Mayo",
            "5": "Junio",
            "6": "Julio",
            "7": "Agosto",
            "8": "Septiembre",
            "9": "Octubre"
        },
        "unknown": "-",
        "weekdays": [
            "Dom",
            "Lun",
            "Mar",
            "Mie",
            "Jue",
            "Vie",
            "Sab"
        ]
    },
    "editor": {
        "close": "Cerrar",
        "create": {
            "button": "Nuevo",
            "title": "Crear nueva entrada",
            "submit": "Crear"
        },
        "edit": {
            "button": "Editar",
            "title": "Editar entrada",
            "submit": "Actualizar"
        },
        "remove": {
            "button": "Borrar",
            "title": "Borrar",
            "submit": "Borrar",
            "confirm": {
                "_": "Está seguro que desea borrar %d filas?",
                "1": "Está seguro que desea borrar 1 fila?"
            }
        },
        "multi": {
            "title": "Múltiples valores",
            "info": "La selección contiene diferentes valores para esta entrada. Para editarla y establecer todos los items al mismo valor, clickear o tocar aquí, de otra manera conservarán sus valores individuales.",
            "restore": "Deshacer cambios",
            "noMulti": "Esta entrada se puede editar individualmente, pero no como parte de un grupo."
        },
        "error": {
            "system": "Ocurrió un error de sistema (&lt;a target=\"\\\" rel=\"nofollow\" href=\"\\\"&gt;Más información)."
        }
    },
    "aria": {
        "sortAscending": ": orden ascendente",
        "sortDescending": ": orden descendente"
    },
    "info": "Mostrando _START_ a _END_ de _TOTAL_ entradas",
    "infoEmpty": "Mostrando 0 a 0 de 0 entradas"
};