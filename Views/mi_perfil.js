$(document).ready(function() {
    moment.locale('es');
    var funcion;
    bsCustomFileInput.init();
    Loader();
    //setTimeout(verificar_sesion, 2000);
    verificar_sesion();
    //llenar_provincias();
    $('#provincia').select2({
        placeholder: 'Seleccione una provincia',
        language: {
            noResults: function() {
                return "No hay resultados";
            },
            searching: function() {
                return "Buscando...";
            }
        }
    });
    
    $('#localidad').select2({
        placeholder: 'Seleccione una localidad',
        language: {
            noResults: function() {
                return "No hay resultados";
            },
            searching: function() {
                return "Buscando...";
            }
        }
    });

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
                text: 'Hubo un conflicto de c??digo: ' + data.status,
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
                text: 'Hubo un conflicto de c??digo: ' + data.status,
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
                <i class="far fa-user"></i> Iniciar sesi??n
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
                    <img src="/commerce//commerce/dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle">
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
                    <img src="/commerce//commerce/dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
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
                    <img src="/commerce//commerce/dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3">
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
                <li><a class="dropdown-item" href="/commerce/Controllers/logout.php"><i class="fas fa-user-times"></i> Cerrar sesi??n</a></li>
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

    async function mostrar_card_usuario() {
        funcion = "obtener_datos";
        let data = await fetch('/commerce/Controllers/UsuarioController.php',{
            method: 'POST',
            headers: {'Content-Type':'application/x-www-form-urlencoded'},
            body: 'funcion='+funcion
        })
        if(data.ok) {
            let response = await data.text();
            //conselo.log(response);
            try {
                let usuario = JSON.parse(response);
                //console.log(usuario);
                let template = `
                <div class="widget-user-header bg-info">
                    <h3 class="widget-user-username">${usuario.username}</h3>
                    <h5 class="widget-user-desc">${usuario.tipo_usuario}</h5>
                </div>
                <div class="widget-user-image">
                    <img class="img-circle elevation-2" src="/commerce/Util/Img/Users/${usuario.avatar}" alt="User Avatar">
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
                `;
                let template_1 = `
                <div class="card-header border-bottom-0">
                    <strong>Mis datos personales</strong>
                    <div class="card-tools">
                        <button type="button" class="editar_datos btn btn-tool" data-bs-toggle="modal" data-bs-target="#modal_datos">
                            <i class="fas fa-pencil-alt"></i>
                        </button>
                    </div>
                </div>
                <div class="card-body pt-0 mt-3">
                    <div class="row">
                        <div class="col-7">
                            <h2 class="lead"><b>${usuario.nombres + ' ' + usuario.apellidos}</b></h2>
                            <ul class="ml-4 mb-0 fa-ul text-muted">
                            <li class="small"><span class="fa-li"><i class="fas fa-address-card"></i></span> DNI: <span>${usuario.dni}</span></li>
                            <li class="small"><span class="fa-li"><i class="fas fa-at"></i></span> Email: <span>${usuario.email}</span></li>
                            <li class="small"><span class="fa-li"><i class="fas fa-lg fa-phone"></i></span> Tel??fono: <span>${usuario.telefono}</span></li>
                            </ul>
                        </div>
                        <div class="col-4 text-center">
                            <img src="/commerce/Util/Img/datos.png" alt="user-avatar" class="img-circle img-fluid">
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <button class="btn btn-primary btn-block" data-bs-toggle="modal" data-bs-target="#modal_contra">Cambiar contrase??a</button>
                </div>
                `;
                $('#loader_3').hide(500);
                $('#loader_4').hide(500);
                $('#card_usuario').html(template);
                $('#card_datos_personales').html(template_1);
            } catch (error) {
                console.error(error);
                console.log(response);
            }
        } else {
            Swal.fire({
                icon: 'error',
                title: data.statusText,
                text: 'Hubo un conflicto de c??digo: ' + data.status,
            })
        }
    }

    async function mostrar_card_direcciones() {
        funcion = "llenar_direcciones";
        let data = await fetch('/commerce/Controllers/UsuarioLocalidadController.php',{
            method: 'POST',
            headers: {'Content-Type':'application/x-www-form-urlencoded'},
            body: 'funcion='+funcion
        })
        if(data.ok) {
            let response = await data.text();
            //conselo.log(response);
            try {
                let direcciones = JSON.parse(response);
                console.log(direcciones);
                let contador = 0;
                let template = `
                <div class="card-header border-bottom-0">
                    <strong>Mis direcciones de env??o</strong>
                    <div class="card-tools">
                        <button type="button" class="btn btn-tool" data-bs-toggle="modal" data-bs-target="#modal_direcciones">
                            <i class="fas fa-plus"></i>
                        </button>
                    </div>
                </div>
                <div class="card-body pt-0 mt-3">`;
                direcciones.forEach(direccion => {
                    contador++;
                    template += `
                    <div class="callout callout-info">
                        <div class="card-header">
                            <strong>direcci??n ${contador}</strong>
                            <div class="card-tools">
                                <button dir_id="${direccion.id}" type="button" class="eliminar_direccion btn btn-tools">
                                    <i class="fas fa-trash-alt"></i>
                                </button>
                            </div>
                        </div>
                        <div class="card-body">
                            <h2 class="lead"><b>${direccion.direccion}</b></h2>
                            <p class="text-muted text-sm"><b>Referencia: </b>${direccion.referencia}</p>
                            <ul class="ml-4 mb-0 fa-ul text-muted">
                                <li class="small"><span class="fa-li"><i class="fas fa-lg fa-building"></i></span>
                                    ${direccion.localidad}, ${direccion.provincia}
                                </li>
                            </ul>
                        </div>
                    </div> 
                    `;
                });  
                template+=`</div>
                `;
                $('#loader_5').hide(500);
                $('#card_direcciones').html(template);
                
            } catch (error) {
                console.error(error);
                console.log(response);
            }
        } else {
            Swal.fire({
                icon: 'error',
                title: data.statusText,
                text: 'Hubo un conflicto de c??digo: ' + data.status,
            })
        }
    }

    async function mostrar_historial() {
        funcion = "llenar_historial";
        let data = await fetch('/commerce/Controllers/HistorialController.php',{
            method: 'POST',
            headers: {'Content-Type':'application/x-www-form-urlencoded'},
            body: 'funcion='+funcion
        })
        if(data.ok) {
            let response = await data.text();
            //conselo.log(response);
            try {
                let historiales = JSON.parse(response);
                //console.log(historiales);
                let template = '';
                historiales.forEach(historial => {
                    let fecha_moment = moment(historial[0].fecha, 'DD/MM/YYYY');
                    template += `
                    <div class="time-label">
                        <span class="bg-danger">
                            ${fecha_moment.format('LL')}
                        </span>
                    </div>
                    `;
                    historial.forEach(cambio => {
                        let fecha_hora_moment = moment(cambio.fecha+' '+cambio.hora, 'DD/MM/YYYY HH:mm');
                        let hora_moment;
                        if(cambio.bandera == '1') {
                            hora_moment = fecha_hora_moment.fromNow();
                        } else {
                            hora_moment = fecha_hora_moment.format('LLLL');
                        }
                        template += `
                            <div>
                                ${cambio.m_icono}
        
                                <div class="timeline-item">
                                    <span class="time"><i class="far fa-clock m-1"></i> ${hora_moment}</span>
        
                                    <h3 class="timeline-header"><strong>${cambio.th_icono} Se realiz?? la acci??n ${cambio.tipo_historial} en ${cambio.modulo}</strong></h3>
        
                                    <div class="timeline-body">
                                        ${cambio.descripcion}
                                    </div>
                                </div>
                            </div>
                        `;
                    });
                });
                template += `
                <div>
                    <i class="far fa-clock bg-gray"></i>
                </div>
                `;
                $('#historiales').html(template);
            } catch (error) {
                console.error(error);
                console.log(response);
            }
        } else {
            Swal.fire({
                icon: 'error',
                title: data.statusText,
                text: 'Hubo un conflicto de c??digo: ' + data.status,
            })
        }
    }

    async function llenar_provincias() {
        funcion = "llenar_provincias";
        let data = await fetch('/commerce/Controllers/ProvinciaController.php',{
            method: 'POST',
            headers: {'Content-Type':'application/x-www-form-urlencoded'},
            body: 'funcion='+funcion
        })
        if(data.ok) {
            let response = await data.text();
            //conselo.log(response);
            try {
                let provincias = JSON.parse(response);
                //console.log(provincias);
                let template = '';
                provincias.forEach(provincia => {
                    template += `
                    <option value="${provincia.id}">${provincia.nombre}</option>
                    `;
                });
                $('#provincia').html(template);
                $('#provincia').val('').trigger('change');
                
            } catch (error) {
                console.error(error);
                console.log(response);
            }
        } else {
            Swal.fire({
                icon: 'error',
                title: data.statusText,
                text: 'Hubo un conflicto de c??digo: ' + data.status,
            })
        }
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
                    $('#avatar_menu').attr('src', '/commerce/Util/Img/Users/' + sesion.avatar);
                    $('#usuario_menu').text(sesion.user);
                    read_notificaciones();
                    read_favoritos();
                    mostrar_card_usuario();
                    mostrar_card_direcciones();
                    mostrar_historial();
                    llenar_provincias();
                    obtener_contadores();
                    CloseLoader();
                } else {
                    //llenar_menu_lateral();
                    //llenar_menu_superior();
                    location.href='/commerce/Views/login.php';
                }
                //setTimeout(llenar_productos(),10000);
            } catch (error) {
                console.error(error);
                console.log(response);
            }
        } else {
            Swal.fire({
                icon: 'error',
                title: data.statusText,
                text: 'Hubo un conflicto de c??digo: ' + data.status,
            })
        }
    }

    $('#provincia').change(async function() {
        let id_provincia = $('#provincia').val();
        if(id_provincia == null) {
            id_provincia = '';
        }
        funcion = "llenar_localidad";
        let data = await fetch('/commerce/Controllers/LocalidadController.php',{
            method: 'POST',
            headers: {'Content-Type':'application/x-www-form-urlencoded'},
            body: 'funcion='+funcion+'&&id_provincia='+id_provincia
        })
        if(data.ok) {
            let response = await data.text();
            //conselo.log(response);
            try {
                if(response != 'error') {
                    let localidades = JSON.parse(response);
                    //console.log(localidades);
                    let template = '';
                    localidades.forEach(localidad => {
                        template += `
                        <option value="${localidad.id}">${localidad.nombre}</option>
                        `;
                    });
                    $('#localidad').html(template);
                    $('#localidad').val('').trigger('change');
                } else {
                    $('#localidad').html('');
                    Swal.fire({
                        icon: 'error',
                        title: 'Cuidado!',
                        text: 'No intentes vulnerar el sistema, presione F5',
                    })
                }
                
            } catch (error) {
                console.error(error);
                console.log(response);
            }
        } else {
            Swal.fire({
                icon: 'error',
                title: data.statusText,
                text: 'Hubo un conflicto de c??digo: ' + data.status,
            })
        }
    });

    async function crear_direccion(id_localidad, direccion, referencia) {
        let data = await fetch('/commerce/Controllers/UsuarioLocalidadController.php',{
            method: 'POST',
            headers: {'Content-Type':'application/x-www-form-urlencoded'},
            body: 'funcion='+funcion+'&&id_localidad='+id_localidad+'&&direccion='+direccion+'&&referencia='+referencia
        })
        if(data.ok) {
            let response = await data.text();
            //conselo.log(response);
            try {
                let respuesta = JSON.parse(response);
                //console.log("respuesta ", respuesta);
                if(respuesta.mensaje == 'success') {
                    Swal.fire({
                        position: 'center',
                        icon: 'success',
                        title: 'Se ha registrado su direcci??n',
                        showConfirmButton: false,
                        timer: 1500
                    }).then(function() {
                        $('#form-direccion').trigger('reset');
                        $('#provincia').val('').trigger('change');
                        mostrar_historial();
                        mostrar_card_direcciones();
                        location.reload();
                    })
                } else if(respuesta.mensaje == 'error') {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'No intente vulnerar el sistema',
                    })
                }
                
                
            } catch (error) {
                console.error(error);
                console.log(response);
            }
        } else {
            Swal.fire({
                icon: 'error',
                title: data.statusText,
                text: 'Hubo un conflicto de c??digo: ' + data.status,
            })
        }
    }

    $('#form-direccion').submit(e => {
        funcion = 'crear_direccion';
        let id_localidad = $('#localidad').val();
        let direccion = $('#direccion').val();
        let referencia = $('#referencia').val();
        crear_direccion(id_localidad, direccion, referencia);
        e.preventDefault();
    })

    async function eliminar_direccion(id) {
        funcion = "eliminar_direccion";
        let respuesta = '';
        let data = await fetch('/commerce/Controllers/UsuarioLocalidadController.php',{
            method: 'POST',
            headers: {'Content-Type':'application/x-www-form-urlencoded'},
            body: 'funcion='+funcion+'&&id='+id
        })
        if(data.ok) {
            let response = await data.text();
            //conselo.log(response);
            try {
                respuesta = JSON.parse(response);
                //console.log("respuesta ", respuesta);
                
            } catch (error) {
                console.error(error);
                console.log(response);
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'Comuniquese con el area de sistema',
                })
            }
        } else {
            Swal.fire({
                icon: 'error',
                title: data.statusText,
                text: 'Hubo un conflicto de c??digo: ' + data.status,
            })
        }
        return respuesta;
    }

    $(document).on('click','.eliminar_direccion', (e) => {
        let elemento = $(this)[0].activeElement;
        let id = $(elemento).attr('dir_id');
        const swalWithBootstrapButtons = Swal.mixin({
            customClass: {
              confirmButton: 'btn btn-success m-3',
              cancelButton: 'btn btn-danger'
            },
            buttonsStyling: false
          })
          
          swalWithBootstrapButtons.fire({
            title: 'Desea borrar esta direcci??n?',
            text: "Esta acci??n puede traer consecuencias!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Si, borra esto!',
            cancelButtonText: 'No, cancelar!',
            reverseButtons: true
          }).then((result) => {
            if (result.isConfirmed) {
                eliminar_direccion(id).then(respuesta => {
                    if(respuesta.mensaje == "success") {
                        swalWithBootstrapButtons.fire(
                            'Borrado!',
                            'La direccion fu?? borrada.',
                            'success'
                        )
                        mostrar_card_direcciones();
                        mostrar_historial();
                    } else if(respuesta.mensaje == "error") {
                        swalWithBootstrapButtons.fire(
                            'No se borro!',
                            'Hubo alteraciones en la integridad de los datos',
                            'error'
                        )
                    }
                });
                
            } else if (result.dismiss === Swal.DismissReason.cancel) {
                swalWithBootstrapButtons.fire(
                    'Cancelado',
                    'La direcci??n no se borro :)',
                    'error'
                )
            }
          })
    })

    $(document).on('click', '.editar_datos', async (e) => {
        funcion = "obtener_datos";
        let data = await fetch('/commerce/Controllers/UsuarioController.php',{
            method: 'POST',
            headers: {'Content-Type':'application/x-www-form-urlencoded'},
            body: 'funcion='+funcion
        })
        if(data.ok) {
            let response = await data.text();
            //conselo.log(response);
            try {
                let usuario = JSON.parse(response);
                //console.log(usuario);
                $('#nombres_mod').val(usuario.nombres);
                $('#apellidos_mod').val(usuario.apellidos);
                $('#dni_mod').val(usuario.dni);
                $('#email_mod').val(usuario.email);
                $('#telefono_mod').val(usuario.telefono);
                
            } catch (error) {
                console.error(error);
                console.log(response);
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'Comuniquese con el area de sistema',
                })
            }
        } else {
            Swal.fire({
                icon: 'error',
                title: data.statusText,
                text: 'Hubo un conflicto de c??digo: ' + data.status,
            })
        }
    })

    async function editar_datos(datos){
        let data = await fetch('/commerce/Controllers/UsuarioController.php',{
            method: 'POST',
            body: datos
        })
        if(data.ok) {
            let response = await data.text();
            //conselo.log(response);
            try {
                let respuesta = JSON.parse(response);
                //console.log("respuesta ", respuesta);
                if(respuesta.mensaje == 'success') {
                    Swal.fire({
                        position: 'center',
                        icon: 'success',
                        title: 'Se ha editado sus datos',
                        showConfirmButton: false,
                        timer: 1500
                    }).then(function() {
                        verificar_sesion();
                        mostrar_card_usuario();
                        mostrar_historial();
                        //location.reload();
                    })
                } else if(respuesta.mensaje == 'danger'){
                    Swal.fire({
                        icon: 'warning',
                        title: 'No alter?? ning??n cambio',
                        text: 'Modifique algun dato para realizar la edici??n !',
                    })
                }
                
            } catch (error) {
                console.error(error);
                console.log(response);
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'Comuniquese con el area de sistema',
                })
            }
        } else {
            Swal.fire({
                icon: 'error',
                title: data.statusText,
                text: 'Hubo un conflicto de c??digo: ' + data.status,
            })
        }
    }

    $.validator.setDefaults({
        submitHandler: function () {
            funcion = "editar_datos";
            let datos = new FormData($('#form-datos')[0]);
            datos.append("funcion", funcion);
            editar_datos(datos);
        }
    });

    jQuery.validator.addMethod("letras", 
        function(value, element) {
            return /^[A-Za-z ]+$/.test(value);
        }
      , "* Este campo solo permite letras");
      $('#form-datos').validate({
        rules: {
          nombres_mod: {
            required: true,
            letras: true
          },
          apellidos_mod: {
            required: true,
            letras: true
          },
          dni_mod: {
            required: true,
            digits: true,
            minlength: 7,
            maxlength: 8
          },
          email_mod: {
            required: true,
            email: true,
          },
          telefono_mod: {
            required: true,
            digits: true,
            minlength: 10,
            maxlength: 10
          }
        },
        messages: {
          nombres_mod: {
            required: "* Este campo es obligatorio"
          },
          apellidos_mod: {
            required: "* Este campo es obligatorio"
          },
          dni_mod: {
            required: "* Este campo es obligatorio",
            minlength: "* El D.N.I. debe ser de m??nimo 7 caracteres",
            maxlength: "* El D.N.I. debe ser de m??ximo 8 caracteres",
            digits: "* El D.N.I. solo esta compuesto por n??meros"
          },
          email_mod: {
            required: "* Este campo es obligatorio",
            email: "* No es formato email"
          },
          telefono_mod: {
            required: "* Este campo es obligatorio",
            minlength: "* El tel??fono debe ser de m??nimo 10 caracteres",
            maxlength: "* El tel??fono debe ser de m??ximo 10 caracteres",
            digits: "* El tel??fono solo esta compuesto por n??meros"
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

    async function cambiar_contra(funcion, pass_old, pass_new){
        let data = await fetch('/commerce/Controllers/UsuarioController.php',{
            method: 'POST',
            headers: {'Content-Type':'application/x-www-form-urlencoded'},
            body: 'funcion='+funcion+'&&pass_old='+pass_old+'&&pass_new='+pass_new
        })
        if(data.ok) {
            let response = await data.text();
            //conselo.log(response);
            try {
                let respuesta = JSON.parse(response);
                //console.log("respuesta ", respuesta);
                if(respuesta.mensaje == 'success') {
                    Swal.fire({
                        position: 'center',
                        icon: 'success',
                        title: 'Se ha cambiado su contrase??a',
                        showConfirmButton: false,
                        timer: 1000
                    }).then(function() {
                        $('#form-contra').trigger('reset');
                        mostrar_historial();
                        //location.reload();
                    })
                } else if(respuesta.mensaje === 'error') {
                    Swal.fire({
                        icon: 'warning',
                        title: 'Contrase??a incorrecta',
                        text: 'Ingrese su contrase??a actual para poder cambiarla',
                    })
                }

            } catch (error) {
                console.error(error);
                console.log(response);
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'Comuniquese con el area de sistema',
                })
            }
        } else {
            Swal.fire({
                icon: 'error',
                title: data.statusText,
                text: 'Hubo un conflicto de c??digo: ' + data.status,
            })
        }
    }

    $.validator.setDefaults({
        submitHandler: function () {
            funcion = "cambiar_contra";
            let pass_old = $('#pass_old').val();
            let pass_new = $('#pass_new').val();
            cambiar_contra(funcion, pass_old, pass_new);
        }
    });
      
    jQuery.validator.addMethod("letras", 
    function(value, element) {
        return /^[A-Za-z ]+$/.test(value);
    }
    , "* Este campo solo permite letras");

    $('#form-contra').validate({
        rules: {
          pass_old: {
            required: true,
            minlength: 5,
            maxlength: 20
          },
          pass_new: {
            required: true,
            minlength: 5,
            maxlength: 20
          },
          pass_repeat: {
            required: true,
            equalTo: "#pass_new"
          }
        },
        messages: {
          pass_old: {
            required: "* Este campo es obligatorio",
            minlength: "* La contrase??a debe ser de m??nimo 5 caracteres",
            maxlength: "* La contrase??a debe ser de m??ximo 20 caracteres"
          },
          pass_new: {
            required: "* Este campo es obligatorio",
            minlength: "* La contrase??a debe ser de m??nimo 5 caracteres",
            maxlength: "* La contrase??a debe ser de m??ximo 20 caracteres"
          },
          pass_repeat: {
            required: "* Este campo es obligatorio",
            equalTo: "* La contrase??a no coincide con la ingresada"
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
                text: 'Hubo un conflicto de c??digo: ' + data.status,
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