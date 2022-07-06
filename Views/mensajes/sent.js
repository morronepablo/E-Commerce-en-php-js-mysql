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
        let data = await fetch('/commerce/Controllers/UsuarioController.php',{
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
        let data = await fetch('/commerce/Controllers/NotificacionController.php',{
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
                        <a href="/commerce/${notificacion.url_1}&&noti=${notificacion.id}" class="dropdown-item">
                            <div class="media">
                                <img src="/commerce/Util/Img/producto/${notificacion.imagen}" alt="User Avatar" class="img-size-50 img-circle mr-3">
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
                <a href="/commerce/Views/notificaciones.php" class="dropdown-item dropdown-footer">Ver todas las notificaciones</a>
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
        let data = await fetch('/commerce/Controllers/FavoritoController.php',{
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
                        <a href="/commerce/${favorito.url}" class="dropdown-item">
                            <div class="media">
                                <img src="/commerce/Util/Img/producto/${favorito.imagen}" alt="User Avatar" class="img-size-50 img-circle mr-3">
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
                    <a href="/commerce/Views/favoritos.php" class="dropdown-item dropdown-footer">Ver todos tus favoritos</a>
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
              <a class="nav-link" href="/commerce/Views/register.php" role="button">
                <i class="fas fa-user-plus"></i> Registrarse
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/commerce/Views/login.php" role="button">
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
                    <img src="/commerce/../dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
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
                    <img src="/commerce/../dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
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
                    <img src="/commerce/../dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
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
                <img  src="/commerce/Util/Img/Users/${usuario.avatar}" width="30" height="30" class="img-fluid img-circle" alt="">
                <span>${usuario.user}</span>
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                <li><a class="dropdown-item" href="/commerce/Views/mi_perfil.php"><i class="fas fa-user-cog"></i> Mi perfil</a></li>
                <li><a class="dropdown-item" href="#"><i class="fas fa-shopping-basket"></i> Mi pedidos</a></li>
                <li><a class="dropdown-item" href="/commerce/Controllers/logout.php"><i class="fas fa-user-times"></i> Cerrar sesión</a></li>
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
                <a id="active_nav_notificaciones" href="/commerce/Views/notificaciones.php" class="nav-link">
                <i class="nav-icon far fa-bell"></i>
                <p id="nav_cont_noti">
                    Notificaciones
                </p>
                </a>
            </li>
            <li id="nav_favoritos" class="nav-item">
                <a id="active_nav_favoritos" href="/commerce/Views/favoritos.php" class="nav-link">
                <i class="nav-icon far fa-heart"></i>
                <p id="nav_cont_fav">
                    Favoritos
                </p>
                </a>
            </li>
            <li id="nav_mensajes" class="nav-item">
                <a id="active_nav_mensajes" href="/commerce/Views/mensajes" class="nav-link">
                <i class="nav-icon far fa-envelope"></i>
                <p id="nav_cont_mens">
                    Mensajes
                </p>
                </a>
            </li>`;
            if(usuario.tipo_usuario == 1) {
                template+=`<li class="nav-header">PRODUCTO</li>
                <li id="nav_marcas" class="nav-item">
                    <a id="active_nav_marcas" href="/commerce/Views/marcas.php" class="nav-link">
                    <i class="nav-icon fas fa-apple-alt"></i>
                    <p id="nav_cont_marc">
                        Marcas
                    </p>
                    </a>
                </li>
                <li id="nav_productos" class="nav-item">
                    <a id="active_nav_productos" href="/commerce/Views/productos" class="nav-link">
                    <i class="nav-icon fas fa-box"></i>
                    <p id="">
                        Productos
                    </p>
                    </a>
                </li>
                `;
            }
            if(usuario.tipo_usuario == 2) {
                template+=`<li class="nav-header">PRODUCTO</li>
                <li id="nav_marcas" class="nav-item">
                    <a id="active_nav_marcas" href="/commerce/Views/marcas.php" class="nav-link">
                    <i class="nav-icon fas fa-apple-alt"></i>
                    <p id="nav_cont_marc">
                        Marcas
                    </p>
                    </a>
                </li>
                <li id="nav_productos" class="nav-item">
                    <a id="active_nav_productos" href="/commerce/Views/productos" class="nav-link">
                    <i class="nav-icon fas fa-box"></i>
                    <p id="">
                        Productos
                    </p>
                    </a>
                </li>
                `;
            }
            if(usuario.tipo_usuario == 3) {
                template+=`<li class="nav-header">PRODUCTO</li>
                <li id="nav_marcas" class="nav-item">
                    <a id="active_nav_marcas" href="/commerce/Views/marcas.php" class="nav-link">
                    <i class="nav-icon fas fa-apple-alt"></i>
                    <p id="nav_cont_marc">
                        Marcas
                    </p>
                    </a>
                </li>
                <li id="nav_productos" class="nav-item">
                    <a id="active_nav_productos" href="/commerce/Views/productos" class="nav-link">
                    <i class="nav-icon fas fa-box"></i>
                    <p id="">
                        Productos
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
        let data = await fetch('/commerce/Controllers/UsuarioController.php',{
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
                    $('#avatar_menu').attr('src', '/commerce/Util/Img/Users/' + sesion.avatar);
                    $('#usuario_menu').text(sesion.user);
                    read_notificaciones();
                    read_favoritos();
                    llenar_destinatarios();
                    read_mensajes_enviados();
                    obtener_contadores();
                    CloseLoader();
                } else {
                    location.href='/commerce/Views/login.php';
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

    async function read_mensajes_enviados() {
        funcion = "read_mensajes_enviados";
        let data = await fetch('/commerce/Controllers/DestinoController.php',{
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
                $('#mensajes_enviados').DataTable( {
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
                                    return `<i data-id="${datos.id}" style="cursor: pointer;" class="fav fas fa-star text-warning"></i>`;
                                } else {
                                    return `<i data-id="${datos.id}" style="cursor: pointer;" class="nofav far fa-star"></i>`;
                                }
                            }
                        },
                        {
                            "render": function(data, type, datos, meta) {
                                let variable;
                                if(datos.abierto == '0') {
                                    variable = `<a style="color: #000" href="/commerce/Views/mensajes/read.php?option=${datos.e}&&id=${datos.id}"><strong>${datos.destino}</strong></a>`;
                                } else {
                                    variable = `<a style="color: #000" href="/commerce/Views/mensajes/read.php?option=${datos.e}&&id=${datos.id}">${datos.destino}</a>`;
                                }
                                return variable;
                            }
                        },
                        { 
                            "render":function(data, type, datos, meta) {
                                let variable;
                                if(datos.abierto == '0') {
                                    variable = `<a style="color: #000" href="/commerce/Views/mensajes/read.php?option=${datos.e}&&id=${datos.id}"><strong>${datos.asunto}</strong></a>`;
                                } else {
                                    variable = `<a style="color: #000" href="/commerce/Views/mensajes/read.php?option=${datos.e}&&id=${datos.id}">${datos.asunto}</a>`;
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

    $('#mensajes_enviados').on('draw.dt', function() {
        $('.checkbox-toggle').removeClass('activo').addClass('inactivo');
        $('.mailbox-messages input[type=\'checkbox\']').prop('checked', false)
        $('.checkbox-toggle .far.fa-check-square').removeClass('fa-check-square').addClass('fa-square')
    })

    async function eliminar_mensajes(eliminados) {
        funcion = "eliminar_mensajes";
        let data = await fetch('/commerce/Controllers/DestinoController.php',{
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
                    read_mensajes_enviados();
                }
            } catch (error) {
                console.error(error);
                console.log(response);
                if(response == 'error') {
                    toastr.error('Algunos mensajes no se borraron ya que algunos de ellos fueron vulnerados', 'Error al eliminar!');
                    read_mensajes_enviados();
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
            eliminar_mensajes(eliminados);
        } else {
            toastr.warning('Seleccione los mensajes que desea eliminar', 'No se eliminó');
        }
    })

    async function remover_favorito(id) {
        funcion = "remover_favorito";
        let data = await fetch('/commerce/Controllers/DestinoController.php',{
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
                    toastr.success('El mensaje se removió de favoritos', 'Removido!');
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

    $(document).on('click', '.fav', function() {
        $this = $(this);
        let id = $this.data('id');
        $this.removeClass('fav fas fa-star text-warning').addClass('nofav far fa-star');
        remover_favorito(id);
    })

    async function agregar_favorito(id) {
        funcion = "agregar_favorito";
        let data = await fetch('/commerce/Controllers/DestinoController.php',{
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
                    toastr.success('El mensaje se agregó a favoritos', 'Agregado!');
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

    $(document).on('click', '.nofav', function() {
        $this = $(this);
        let id = $this.data('id');
        $this.removeClass('nofav far fa-star').addClass('fav fas fa-star text-warning');
        agregar_favorito(id);
    })

    $('.actualizar_mensajes').click(function () {
        toastr.info('Mensajes actualizados', 'Actualizado!');
        read_mensajes_enviados();
        obtener_contadores();
    })

    async function crear_mensaje(datos) {
        let data = await fetch('/commerce/Controllers/MensajeController.php',{
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

    async function obtener_contadores() {
        let funcion = "obtener_contadores";
        let data = await fetch('/commerce/Controllers/DestinoController.php',{
            method: 'POST',
            headers: {'Content-Type':'application/x-www-form-urlencoded'},
            body: 'funcion='+funcion
        })
        if(data.ok) {
            let response = await data.text();
            //conselo.log(response);
            try {
                let contadores = JSON.parse(response);
                //console.log(contadores.contador_mensaje);
                let template = ``;
                let template_1 = ``;
                if(contadores.contador_mensaje > 0) {
                    template += `
                    <i class="fas fa-inbox"></i> Recibidos
                    <span class="badge bg-warning float-right">${contadores.contador_mensaje}</span>
                    `;
                    template_1 += `
                    Mensajes <span class="badge badge-warning right">${contadores.contador_mensaje}</span>
                    `;
                } else {
                    template += `
                    <i class="fas fa-inbox"></i> Recibidos
                    `;
                    template_1 += `
                    Mensajes
                    `;
                }
                $('#recibidos').html(template);
                $('#nav_cont_mens').html(template_1);
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