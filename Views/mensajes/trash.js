$(document).ready(function() {
    moment.locale('es');
    Loader();
    verificar_sesion();

    $('#modal_crear_mensaje').modal({
        backdrop: 'static',
        keyboard: false
    });
    $('#para').select2(
        {
            placeholder: 'Seleccione un destinatario',
            language: {
                noResults: function() {
                    return "No hay resultado";
                },
                searching: function() {
                    return "Buscando...";
                }
            }
        }
    );

    async function llenar_destinatarios() {
        funcion = "llenar_destinatarios";
        let data = await fetch('../../Controllers/UsuarioController.php',{
            method: 'POST',
            headers: {'Content-Type':'application/x-www-form-urlencoded'},
            body: 'funcion='+funcion
        })
        if(data.ok) {
            let response = await data.text();
            //conselo.log(response);
            try {
                let destinatarios = JSON.parse(response);
                let template = '';
                destinatarios.forEach(destinatario => {
                    template += `
                        <option value="${destinatario.id}">${destinatario.nombre_completo}</option>
                    `;
                });
                $('#para').html(template);
                $('#para').val('').trigger('change');

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

    async function read_notificaciones() {
        funcion = "read_notificaciones";
        let data = await fetch('../../Controllers/NotificacionController.php',{
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
                        <a href="../../${notificacion.url_1}&&noti=${notificacion.id}" class="dropdown-item">
                            <div class="media">
                                <img src="../../Util/Img/producto/${notificacion.imagen}" alt="User Avatar" class="img-size-50 img-circle mr-3">
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
                <a href="../../Views/notificaciones.php" class="dropdown-item dropdown-footer">Ver todas las notificaciones</a>
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
        let data = await fetch('../../Controllers/FavoritoController.php',{
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
                        <a href="../../${favorito.url}" class="dropdown-item">
                            <div class="media">
                                <img src="../../Util/Img/producto/${favorito.imagen}" alt="User Avatar" class="img-size-50 img-circle mr-3">
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
                    <a href="../../Views/favoritos.php" class="dropdown-item dropdown-footer">Ver todos tus favoritos</a>
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
              <a class="nav-link" href="../../Views/register.php" role="button">
                <i class="fas fa-user-plus"></i> Registrarse
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="../../Views/login.php" role="button">
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
                    <img src="../../../dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
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
                    <img src="../../../dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
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
                    <img src="../../../dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
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
                <img  src="../../Util/Img/Users/${usuario.avatar}" width="30" height="30" class="img-fluid img-circle" alt="">
                <span>${usuario.user}</span>
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                <li><a class="dropdown-item" href="../../Views/mi_perfil.php"><i class="fas fa-user-cog"></i> Mi perfil</a></li>
                <li><a class="dropdown-item" href="#"><i class="fas fa-shopping-basket"></i> Mi pedidos</a></li>
                <li><a class="dropdown-item" href="../../Controllers/logout.php"><i class="fas fa-user-times"></i> Cerrar sesión</a></li>
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
                <a id="active_nav_notificaciones" href="../../Views/notificaciones.php" class="nav-link">
                <i class="nav-icon far fa-bell"></i>
                <p id="nav_cont_noti">
                    Notificaciones
                </p>
                </a>
            </li>
            <li id="nav_favoritos" class="nav-item">
                <a id="active_nav_favoritos" href="../../Views/favoritos.php" class="nav-link">
                <i class="nav-icon far fa-heart"></i>
                <p id="nav_cont_fav">
                    Favoritos
                </p>
                </a>
            </li>
            <li id="nav_mensajes" class="nav-item">
                <a id="active_nav_mensajes" href="../../Views/mensajes" class="nav-link">
                <i class="nav-icon far fa-envelope"></i>
                <p id="nav_cont_mens">
                    Mensajes
                </p>
                </a>
            </li>`;
            if(usuario.tipo_usuario == 1) {
                template+=`<li class="nav-header">PRODUCTO</li>
                <li id="nav_marcas" class="nav-item">
                    <a id="active_nav_marcas" href="../../Views/marcas.php" class="nav-link">
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
                    <a id="active_nav_marcas" href="../../Views/marcas.php" class="nav-link">
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
                    <a id="active_nav_marcas" href="../../Views/marcas.php" class="nav-link">
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
        let data = await fetch('../../Controllers/UsuarioController.php',{
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
                    llenar_menu_superior(sesion);
                    llenar_menu_lateral(sesion);
                    $('#active_nav_mensajes').addClass('active');
                    $('#avatar_menu').attr('src', '../../Util/Img/Users/' + sesion.avatar);
                    $('#usuario_menu').text(sesion.user);
                    read_notificaciones();
                    read_favoritos();
                    llenar_destinatarios();
                    read_mensajes_papelera();
                    CloseLoader();
                } else {
                    location.href='../login.php';
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

    async function read_mensajes_papelera() {
        funcion = "read_mensajes_papelera";
        let data = await fetch('../../Controllers/DestinoController.php',{
            method: 'POST',
            headers: {'Content-Type':'application/x-www-form-urlencoded'},
            body: 'funcion='+funcion
        })
        if(data.ok) {
            let response = await data.text();
            //conselo.log(response);
            try {
                let mensajes = JSON.parse(response);
                console.log(mensajes);
                $('#mensajes_papelera').DataTable( {
                    data: mensajes,
                    "aaSorting": [],
                    "searching": true,
                    "scrollX": false,
                    "autoWidth": false,
                    "responsive": true,
                    "processing": true,
                    columns: [
                        { 
                            "render": function(data, type, datos, meta) {
                                return `
                                        <div class="icheck-primary">
                                            <input style="cursor: pointer;" class="select" type="checkbox" value="${datos.id}">
                                            <label for="check1"></label>
                                        </div>
                                `;
                            }
                        },
                        { 
                            "render": function(data, type, datos, meta) {
                                if(datos.favorito == '1') {
                                    return `<i class="fas fa-star text-warning"></i>`;
                                } else {
                                    return `<i class="far fa-star"></i>`;
                                }
                            }
                        },
                        {
                            "render": function(data, type, datos, meta) {
                                let variable;
                                if(datos.abierto == '0') {
                                    variable = `<a id="${datos.id}" E_D="${datos.E_D}" asunto="${datos.asunto}" favorito="${datos.favorito}" class="enviar_info_modal" href="" data-bs-toggle="modal" data-bs-target="#modal_ver_mensaje_trash" style="color: #000"><strong>${datos.E_D}</strong></a>`;
                                } else {
                                    variable = `<a id="${datos.id}" E_D="${datos.E_D}" asunto="${datos.asunto}" favorito="${datos.favorito}" class="enviar_info_modal" href="" data-bs-toggle="modal" data-bs-target="#modal_ver_mensaje_trash" style="color: #000">${datos.E_D}</a>`;
                                }
                                return variable;
                            }
                        },
                        { 
                            "render":function(data, type, datos, meta) {
                                let variable;
                                if(datos.abierto == '0') {
                                    variable = `<a id="${datos.id}" E_D="${datos.E_D}" asunto="${datos.asunto}" favorito="${datos.favorito}" class="enviar_info_modal" href="" data-bs-toggle="modal" data-bs-target="#modal_ver_mensaje_trash" style="color: #000"><strong>${datos.asunto}</strong></a>`;
                                } else {
                                    variable = `<a id="${datos.id}" E_D="${datos.E_D}" asunto="${datos.asunto}" favorito="${datos.favorito}" class="enviar_info_modal" href="" data-bs-toggle="modal" data-bs-target="#modal_ver_mensaje_trash" style="color: #000">${datos.asunto}</a>`;
                                }
                                return variable;
                            }
                        },
                        {
                            "data": "fecha_creacion"
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

    //Enable check and uncheck all functionality
    $('.checkbox-toggle').click(function () {
        var clicks = $(this).data('clicks')
        let inactivo = $('.checkbox-toggle').hasClass('inactivo');
        let activo = $('.checkbox-toggle').hasClass('activo');
        if (clicks) {
            //Uncheck all checkboxes
            if(inactivo == true) {
                $('.checkbox-toggle').removeClass('inactivo').addClass('activo');
                $('.mailbox-messages input[type=\'checkbox\']').prop('checked', true)
                $('.checkbox-toggle .far.fa-square').removeClass('fa-square').addClass('fa-check-square')
            } else {
                $('.checkbox-toggle').removeClass('activo').addClass('inactivo');
                $('.mailbox-messages input[type=\'checkbox\']').prop('checked', false)
                $('.checkbox-toggle .far.fa-check-square').removeClass('fa-check-square').addClass('fa-square')
            }
        } else {
            //Check all checkboxes
            if(inactivo == false) {
                $('.checkbox-toggle').removeClass('activo').addClass('inactivo');
                $('.mailbox-messages input[type=\'checkbox\']').prop('checked', false)
                $('.checkbox-toggle .far.fa-check-square').removeClass('fa-check-square').addClass('fa-square')
            } else {
                $('.checkbox-toggle').removeClass('inactivo').addClass('activo');
                $('.mailbox-messages input[type=\'checkbox\']').prop('checked', true)
                $('.checkbox-toggle .far.fa-square').removeClass('fa-square').addClass('fa-check-square')
            }
        }
        $(this).data('clicks', !clicks)
    })

    $('#mensajes_papelera').on('draw.dt', function() {
        $('.checkbox-toggle').removeClass('activo').addClass('inactivo');
        $('.mailbox-messages input[type=\'checkbox\']').prop('checked', false)
        $('.checkbox-toggle .far.fa-check-square').removeClass('fa-check-square').addClass('fa-square')
    })

    async function eliminar_mensajes_definitivamente(eliminados) {
        funcion = "eliminar_mensajes_definitivamente";
        let data = await fetch('../../Controllers/DestinoController.php',{
            method: 'POST',
            headers: {'Content-Type':'application/x-www-form-urlencoded'},
            body: 'funcion=' + funcion + '&&eliminados=' + JSON.stringify(eliminados)
        })
        if(data.ok) {
            let response = await data.text();
            //conselo.log(response);
            try {
                let respuesta = JSON.parse(response);
                if(respuesta.mensaje == 'success') {
                    toastr.success('Seccion de mensaje eliminado', 'Eliminados!');
                    read_mensajes_papelera();
                }
            } catch (error) {
                console.error(error);
                console.log(response);
                if(response == 'error') {
                    toastr.error('Algunos mensajes no se borraron ya que algunos de ellos fueron vulnerados', 'Error al eliminar!');
                    read_mensajes_papelera();
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

    $('.eliminar_mensajes').click(function () {
        let seleccionados = $('.select');
        let eliminados = [];
        $.each(seleccionados, function (index, input) { 
            if($(input).prop('checked') == true) {
                eliminados.push($(input).val());
            }
        });
        if(eliminados.length != 0) {
            eliminar_mensajes_definitivamente(eliminados);
        } else {
            toastr.warning('Seleccione los mensajes que desea eliminar', 'No se eliminó');
        }
    })

    async function restaurar_mensajes(eliminados) {
        funcion = "restaurar_mensajes";
        let data = await fetch('../../Controllers/DestinoController.php',{
            method: 'POST',
            headers: {'Content-Type':'application/x-www-form-urlencoded'},
            body: 'funcion=' + funcion + '&&eliminados=' + JSON.stringify(eliminados)
        })
        if(data.ok) {
            let response = await data.text();
            //conselo.log(response);
            try {
                let respuesta = JSON.parse(response);
                if(respuesta.mensaje == 'success') {
                    toastr.success('Seccion de mensaje restaurada', 'Restaurado!');
                    read_mensajes_papelera();
                }
            } catch (error) {
                console.error(error);
                console.log(response);
                if(response == 'error') {
                    toastr.error('Algunos mensajes no se restauraron ya que algunos de ellos fueron vulnerados', 'Error al restaurar!');
                    read_mensajes_papelera();
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

    $('.restaurar_mensajes').click(function () {
        let seleccionados = $('.select');
        let eliminados = [];
        $.each(seleccionados, function (index, input) { 
            if($(input).prop('checked') == true) {
                eliminados.push($(input).val());
            }
        });
        if(eliminados.length != 0) {
            restaurar_mensajes(eliminados);
        } else {
            toastr.warning('Seleccione los mensajes que desea eliminar', 'No se eliminó');
        }
    })

    $('.actualizar_mensajes').click(function () {
        toastr.info('Mensajes actualizados', 'Actualizado!');
        read_mensajes_papelera();
    })

    async function crear_mensaje(datos) {
        let data = await fetch('../../Controllers/MensajeController.php',{
            method: 'POST',
            body: datos
        })
        if(data.ok) {
            let response = await data.text();
            //conselo.log(response);
            try {
                let respuesta = JSON.parse(response);
                if(respuesta.mensaje == 'success') {
                    toastr.success('Mensaje enviado', 'Enviado!');
                    $('#form-mensaje').trigger('reset');
                    $('#para').val('').trigger('change');
                    $('#modal_crear_mensaje').modal('hide');
                }
            } catch (error) {
                console.error(error);
                console.log(response);
                if(response == 'error') {
                    toastr.error('No intente vulnerar el sistema', 'Error!');
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
            
            let funcion = 'crear_mensaje';
            let datos   = new FormData($('#form-mensaje')[0]);
            datos.append('funcion', funcion);
            crear_mensaje(datos);
        }
    });

    $('#form-mensaje').validate({
        rules: {
            para: {
                required: true,
            },
            asunto: {
                required: true,
            },
            contenido: {
                required: true,
            }
        },
        messages: {
            para: {
                required: "* Este campo es obligatorio"
            },
            asunto: {
                required: "* Este campo es obligatorio"
            },
            contenido: {
                required: "* Este campo es obligatorio"
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

    $('#cerrar_modal_crear_mensaje').click(function () {
        $('#form-mensaje').trigger('reset');
        $('#para').val('').trigger('change');
    })

    async function obtener_contenido_mensaje(id) {
        funcion = "obtener_contenido_mensaje";
        let data = await fetch('../../Controllers/DestinoController.php',{
            method: 'POST',
            headers: {'Content-Type':'application/x-www-form-urlencoded'},
            body: 'funcion=' + funcion + '&&id=' + id
        })
        if(data.ok) {
            let response = await data.text();
            //conselo.log(response);
            try {
                let respuesta = JSON.parse(response);
                //console.log(respuesta);
                $('#contenido_modal').html(respuesta.contenido);
            } catch (error) {
                console.error(error);
                console.log(response);
                if(response == 'error') {
                    toastr.error('Error', 'Error!');
                    //read_mensajes_papelera();
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

    $(document).on('click', '.enviar_info_modal', (e) => {
        let elemento = $(this)[0].activeElement;
        let id = $(elemento).attr('id');
        let E_D = $(elemento).attr('E_D');
        let asunto = $(elemento).attr('asunto');
        let favorito = $(elemento).attr('favorito');
        $('#asunto_modal').text(asunto);
        $('#E_D_modal').text(E_D);
        obtener_contenido_mensaje(id);
        let template = `
        <div class="mailbox-controls with-border text-center">
            <div class="btn-group">
                <button id="${id}" type="button" class="eliminar_mensaje_definitivamente btn btn-default btn-sm" data-container="body" title="Eliminar Definitivamente">
                    <i class="far fa-trash-alt"></i>
                </button>
                <button id="${id}" type="button" class="restaurar_mensaje btn btn-default btn-sm ml-2" data-container="body" title="Restaurar mensaje">
                    <i class="fas fa-trash-restore"></i>
                </button>
            </div>
            <button type="button" class="btn btn-default btn-sm ml-2" title="Imprimir">
                <i class="fas fa-print"></i>
            </button>
            <div class="h4 float-right mr-2">`;
            if(favorito == "1") {
                template += `<i class="fas fa-star text-warning" style="cursor: pointer"></i>`;
            } else {
                template += `<i class="far fa-star" style="cursor: pointer"></i>`;
            }   
        template += `
            </div>
        </div>
        `;
        $('#botones_trash').html(template);
    })

    async function eliminar_mensaje_definitivamente(id) {
        funcion = "eliminar_mensaje_definitivamente";
        let data = await fetch('../../Controllers/DestinoController.php',{
            method: 'POST',
            headers: {'Content-Type':'application/x-www-form-urlencoded'},
            body: 'funcion=' + funcion + '&&id=' + id
        })
        if(data.ok) {
            let response = await data.text();
            //conselo.log(response);
            try {
                let respuesta = JSON.parse(response);
                if(respuesta.mensaje == 'success') {
                    Swal.fire({
                        position: 'center',
                        icon: 'success',
                        title: 'Se eliminó el mensaje definitivamente',
                        showConfirmButton: false,
                        timer: 1500
                    }).then(function() {
                        read_mensajes_papelera();
                        $('#modal_ver_mensaje_trash').modal('hide');
                    })
                }
            } catch (error) {
                console.error(error);
                console.log(response);
                if(response == 'error') {
                    toastr.error('No intente vulnerar el sistema', 'Error al eliminar!');
                } else {
                    toastr.error('Hubo error al eliminar', 'Error al eliminar!');
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

    $(document).on('click', '.eliminar_mensaje_definitivamente', (e) => {
        let elemento = $(this)[0].activeElement;
        let id = $(elemento).attr('id');
        eliminar_mensaje_definitivamente(id);
    })

    async function restaurar_mensaje(id) {
        funcion = "restaurar_mensaje";
        let data = await fetch('../../Controllers/DestinoController.php',{
            method: 'POST',
            headers: {'Content-Type':'application/x-www-form-urlencoded'},
            body: 'funcion=' + funcion + '&&id=' + id
        })
        if(data.ok) {
            let response = await data.text();
            //conselo.log(response);
            try {
                let respuesta = JSON.parse(response);
                if(respuesta.mensaje == 'success') {
                    Swal.fire({
                        position: 'center',
                        icon: 'success',
                        title: 'Se restauró el mensaje',
                        showConfirmButton: false,
                        timer: 1500
                    }).then(function() {
                        read_mensajes_papelera();
                        $('#modal_ver_mensaje_trash').modal('hide');
                    })
                }
            } catch (error) {
                console.error(error);
                console.log(response);
                if(response == 'error') {
                    toastr.error('No intente vulnerar el sistema', 'Error al restaurar!');
                } else {
                    toastr.error('Hubo error al restaurar', 'Error al restaurar!');
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

    $(document).on('click', '.restaurar_mensaje', (e) => {
        let elemento = $(this)[0].activeElement;
        let id = $(elemento).attr('id');
        restaurar_mensaje(id);
    })

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