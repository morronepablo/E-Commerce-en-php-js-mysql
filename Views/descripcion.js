$(document).ready(function() {
    moment.locale('es');
    // Formato numeros a Moneda Local
    function formatNumber(number) {
        return new Intl.NumberFormat( "ES-AR", {
            style: 'currency',
            currency: 'ARS',
        }).format(number)
    }
    Loader();
    //setTimeout(verificar_sesion, 2000);
    verificar_sesion();
    toastr.options = {
        'debug': false,
        'positionClass': 'toast-bottom-full-width',
        'onclick': null,
        'fadeIn': 300,
        'fadeOut': 1000,
        'timeOut': 2000,
        'extendedTimeOut': 1000
    }
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
                console.log(notificaciones);
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
                console.log(favoritos);
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
            </li>
            <li id="nav_mensajes" class="nav-item">
                <a id="active_nav_mensajes" href="../Views/mensajes" class="nav-link">
                <i class="nav-icon far fa-envelope"></i>
                <p id="nav_cont_mens">
                    Mensajes
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
                    llenar_menu_superior(sesion);
                    llenar_menu_lateral(sesion);
                    $('#avatar_menu').attr('src', '../Util/Img/Users/' + sesion.avatar);
                    $('#usuario_menu').text(sesion.user);
                    read_notificaciones();
                    read_favoritos();
                } else {
                    llenar_menu_lateral();
                    llenar_menu_superior();
                }
                //setTimeout(llenar_productos(),10000);
                verificar_producto();
                CloseLoader();

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

    function mostrar_pasarela(producto) {
        let template = '';
        if(producto.imagenes.length > 0) {
            template += `
                <div class="col-12">
                    <img id="imagen_principal" src="../Util/img/producto/${producto.imagenes[0].nombre}" class="img-fluid">
                </div>
                <div class="col-12 product-image-thumbs">
            `;
                producto.imagenes.forEach(imagen => {
                    template += `
                        <button prod_img="${imagen.nombre}" class="imagen_pasarelas product-image-thumb">
                            <img src="../Util/Img/producto/${imagen.nombre}">
                        </button>
                    `;
                });
            template += `
                </div>
            `;
        }else {
            template += `
                <div class="col-12">
                    <img id="imagen_principal" src="../Util/img/producto/${producto.imagen}" class="product-image img-fluid">
                </div>
            `;
        }
        $('#loader_3').hide(500);
        $('#imagenes').html(template);
    }

    async function mostrar_titulo_favorito() {
        funcion = "mostrar_titulo_favorito";
        let data = await fetch('../Controllers/FavoritoController.php',{
            method: 'POST',
            headers: {'Content-Type':'application/x-www-form-urlencoded'},
            body: 'funcion='+funcion
        })
        if(data.ok) {
            let response = await data.text();
            //conselo.log(response);
            try {
                let producto = JSON.parse(response);
                console.log(producto);
                let template = '';
                if(producto.usuario_sesion != '') {
                    if(producto.estado_favorito == '') {
                        //Esto es cuando no existe como favorito a este usuario el producto
                        template += `${producto.producto}<button type="button" id_favorito="${producto.id_favorito}" estado_fav="${producto.estado_favorito}" class="btn bandera_favorito"><i class="far fa-heart fa-lg text-danger"></i></button>`;
                    } else {
                        if(producto.estado_favorito == 'I') {
                            //Esto es cuando fue favorito este producto alguna vez a este usuario pero esta inactivo
                            template += `${producto.producto}<button type="button" id_favorito="${producto.id_favorito}" estado_fav="${producto.estado_favorito}" class="btn bandera_favorito"><i class="far fa-heart fa-lg text-danger"></i></button>`;
                        } else {
                            //Esto es cuando es favorito y lo pasamos a inactivo
                            template += `${producto.producto}<button type="button" id_favorito="${producto.id_favorito}" estado_fav="${producto.estado_favorito}" class="btn bandera_favorito"><i class="fas fa-heart fa-lg text-danger"></i></button>`;
                        }
                    }
                } else {
                    template += `${producto.producto}`;
                }
                $('#producto').html(template);
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

    function mostrar_informacion_precio(producto) {
        let template = '';
        if(producto.calificacion != 0) {
            //template1 += `</br>`;
            for (let index = 0; index < producto.calificacion; index++) {
                template += `<i class="fas fa-star text-warning"></i>`;
            }
            let estrellas_faltantes = 5 - producto.calificacion;
            for (let index = 0; index < estrellas_faltantes; index++) {
                template += `<i class="far fa-star text-warning"></i>`;
            }
            template += `</br>`;
        }
        if(producto.descuento != 0) {
            template += `
            <span class="text-muted" style="text-decoration: line-through">${formatNumber(producto.precio)}</span>
            <span class="text-muted">-${producto.descuento}%</span></br>
            `;
        }
        template += `<h4 class="text-danger"><strong>${formatNumber(producto.precio_descuento)}</strong>   </h4>`;
        $('#informacion_precios').html(template);
    }

    function mostrar_informacion_envio(producto) {
        let template = '';
        if(producto.envio == 'gratis'){
            template += `  <i class="fas fa-truck-moving text-danger"></i>
                            <span class="ml-1"> Envio: </span>
                            <span class="badge bg-success ml-1">Envio gratis</span>`;
        } else {
            template += `  <i class="fas fa-truck-moving text-danger"></i>
                            <span class="ml-1"> Envio: </span>
                            <span class="mr-1">$ 150,00</span>`;
        }
        template += `  </br>`;
        template += `  <i class="fas fa-store text-primary"></i>
                        <span class="ml-1">Retiralo en tienda: ${producto.direccion_tienda}</span>`;
        $('#informacion_envio').html(template);
    }

    function mostrar_tienda(producto) {
        let template = `
        <h2 class="mb-0">
            <button class="btn btn-primary">
                <i class="fas fa-star text-warning mr-1"></i><span>${producto.promedio_calificacion_tienda}</span>
            </button>
            <span class="text-muted ml-1">${producto.tienda}</span>
        </h2>
        <h4 class="mt-0">
            <small>${producto.numero_resenas} reseñas</small>
        </h4>
        <div class="mt-2 product-share">
            <a href="#" class="text-gray">
                <i class="fab fa-facebook-square fa-2x"></i>
            </a>
            <a href="#" class="text-gray">
                <i class="fab fa-twitter-square fa-2x"></i>
            </a>
            <a href="#" class="text-gray">
                <i class="fas fa-envelope-square fa-2x"></i>
            </a>
            <a href="#" class="text-gray">
                <i class="fas fa-rss-square fa-2x"></i>
            </a>
        </div>
        `;
        $('#tienda').html(template);
    }

    function mostrar_agregar_carrito() {
        let template = `
        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <select id="cantidad_producto" class="form-control">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                </select>
            </div>
            <div class="btn btn-success btn-flat ml-2 rounded-pill">
                <i class="fas fa-cart-plus fa-lg mr-2"></i>
                Agregar al carrito
            </div>
        </div>
        `;
        $('#agregar_carrito').html(template);
    }

    function mostrar_caracteristicas(caracteristicas) {
        let template = `
        <table class="table table-hover table-responsive">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Característica</th>
                    <th scope="col">Descripción</th>
                </tr>
            </thead>
            <tbody>`;
            let cont = 0;
            caracteristicas.forEach(caracteristica => {
                cont++;
                template += `
                    <tr>
                        <td>${cont}</td>
                        <td>${caracteristica.titulo}</td>
                        <td>${caracteristica.descripcion}</td>
                    </tr>
                `;
            });
        template+=`
            </tbody>
        </table>
        `;
        $('#product-caract').html(template);
    }

    function mostrar_resenas(resenas) {
        let template = '';
        resenas.forEach(resena => {
            template += `
                <div class="card-comment">
                    <img class="img-circle img-sm" src="../Util/Img/Users/${resena.avatar}" alt="User Image">
                    <div class="comment-text">
                        <span class="username">
                            ${resena.usuario}
                            `;
                            for (let index = 0; index < resena.calificacion; index++) {
                                template += `<i class="fas fa-star text-warning"></i>`;
                            }
                            let estrellas_faltantes = 5 - resena.calificacion;
                            for (let index = 0; index < estrellas_faltantes; index++) {
                                template += `<i class="far fa-star text-warning"></i>`;
                            }
                            let fecha = moment(resena.fecha+' '+resena.hora, 'DD/MM/YYYY HH/:mm');
                            let horas = moment(resena.hora, 'HH/:mm');
                            let fecha_hora;
                            if(resena.hoy == '1') {
                                fecha_hora = horas.fromNow();
                            } else {
                                fecha_hora = fecha.format('LLL');
                            }
                template+=`<span class="text-muted float-right">${fecha_hora}</span>
                        </span>
                        ${resena.descripcion}
                    </div>
                </div>
            `;
        });
        $('#resenas').html(template);
    }

    async function mostrar_comentarios() {
        funcion = "mostrar_comentarios";
        let data = await fetch('../Controllers/PreguntaController.php',{
            method: 'POST',
            headers: {'Content-Type':'application/x-www-form-urlencoded'},
            body: 'funcion='+funcion
        })
        if(data.ok) {
            let response = await data.text();
            //conselo.log(response);
            try {
                let producto = JSON.parse(response);
                //console.log(producto);
                let template = '';
                if(producto.bandera == '2') {
                    template += `
                    <div class="card-footer">
                        <form id="form_pregunta">
                            <div class="input-group">
                                <img class="direct-chat-img mr-2" src="../Util/Img/Users/${producto.avatar_sesion}" alt="Message User Image">
                                <input type="text" id="pregunta" placeholder="Escribir pregunta..." class="form-control" required>
                                <span class="input-group-append">
                                    <button type="submit" class="btn btn-primary">Enviar</button>
                                </span>
                            </div>
                        </form>
                    </div>
                    `;
                }
                template += `
                    <div class="direct-chat-messages direct-chat-success preguntas">`;
                    producto.preguntas.forEach(pregunta => {
                        let fecha1 = moment(pregunta.fecha+' '+pregunta.hora, 'DD/MM/YYYY HH/:mm');
                        let horas1 = moment(pregunta.hora, 'HH/:mm');
                        let fecha_hora1;
                        if(pregunta.hoy == '1') {
                            fecha_hora1 = horas1.fromNow();
                        } else {
                            fecha_hora1 = fecha1.format('LLL');
                        }
                        template += `
                        <div class="direct-chat-msg">
                            <div class="direct-chat-infos clearfix">
                                <span class="direct-chat-name float-left">${pregunta.username}</span>
                                <span class="direct-chat-timestamp float-right">${fecha_hora1}</span>
                            </div>
                            <img class="direct-chat-img" src="../Util/Img/Users/${pregunta.avatar}" alt="Message User Image">
                            <div class="direct-chat-text">
                                ${pregunta.contenido}
                            </div>`;
                            if(pregunta.estado_respuesta == '0') {
                                // No tiene respuesta la pregunta
                                if(producto.bandera == '1') {
                                    // Si el usuario logueado es el dueño puede responder pregunta  
                                    template += `
                                    <div class="card-footer">
                                        <form>
                                            <div class="input-group">
                                                <img class="direct-chat-img mr-2" src="../Util/Img/Users/${producto.avatar}" alt="Message User Image">
                                                <input type="text" placeholder="Responder pregunta..." class="form-control respuesta" required>
                                                <input type="hidden" value="${pregunta.id}" class="id_pregunta" >
                                                <span class="input-group-append">
                                                <button class="btn btn-success enviar_respuesta">Enviar</button>
                                                </span>
                                            </div>
                                        </form>
                                    </div> 
                                    `;
                                }
                            } else {
                                let fecha2 = moment(pregunta.respuesta.fecha+' '+pregunta.respuesta.hora, 'DD/MM/YYYY HH/:mm');
                                let horas2 = moment(pregunta.respuesta.hora, 'HH/:mm');
                                let fecha_hora2;
                                if(pregunta.respuesta.hoy == '1') {
                                    fecha_hora2 = horas2.fromNow();
                                } else {
                                    fecha_hora2 = fecha2.format('LLL');
                                }
                                // La pregunta tiene respuesta
                                template += `
                                <div class="direct-chat-msg right">
                                    <div class="direct-chat-infos clearfix">
                                        <span class="direct-chat-name float-right">${producto.username}</span>
                                        <span class="direct-chat-timestamp float-left">${fecha_hora2}</span>
                                    </div>
                                    <img class="direct-chat-img" src="../Util/Img/Users/${producto.avatar}" alt="Message User Image">
                                    <div class="direct-chat-text">
                                        ${pregunta.respuesta.contenido}
                                    </div>
                                </div>
                                `;
                            }
                        template += `
                        </div>
                        `;
                    });
                template += `
                    </div>`;
                $('#product-pre').html(template);
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

    async function verificar_producto() {
        funcion = "verificar_producto";
        let data = await fetch('../Controllers/ProductoTiendaController.php',{
            method: 'POST',
            headers: {'Content-Type':'application/x-www-form-urlencoded'},
            body: 'funcion='+funcion
        })
        if(data.ok) {
            let response = await data.text();
            //console.log(response);
            try {
                let producto = JSON.parse(response);
                console.log(producto);
                if(producto.usuario_sesion != '') {
                    read_notificaciones();
                }
                mostrar_pasarela(producto);
                mostrar_titulo_favorito();
                $('#marca').text('Marca: ' + producto.marca);
                $('#sku').text('SKU: ' + producto.sku);
                mostrar_informacion_precio(producto);
                mostrar_informacion_envio(producto);
                mostrar_tienda(producto);
                mostrar_agregar_carrito();
                $('#product-desc').text(producto.detalles);
                mostrar_caracteristicas(producto.caracteristicas);
                mostrar_resenas(producto.resenas);
                mostrar_comentarios();
            } catch (error) {
                console.error(error);
                console.log(response);
                if(response == 'error') {
                    location.href = '../index.php';
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
    $(document).on('click', '.imagen_pasarelas', (e) => {
        let elemento = $(this)[0].activeElement;
        let img = $(elemento).attr('prod_img');
        $('#imagen_principal').attr('src', '../Util/Img/producto/' + img);
    })
    async function realizar_pregunta(pregunta) {
        funcion = "realizar_pregunta";
        let data = await fetch('../Controllers/PreguntaController.php',{
            method: 'POST',
            headers: {'Content-Type':'application/x-www-form-urlencoded'},
            body: 'funcion=' + funcion + '&&pregunta=' + pregunta
        })
        if(data.ok) {
            let response = await data.text();
            //console.log(response);
            try {
                let respuesta = JSON.parse(response);
                console.log(respuesta);
                mostrar_comentarios();
                $('#form_pregunta').trigger('reset');
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
    $(document).on('submit', '#form_pregunta', (e) => {
        let pregunta = $('#pregunta').val();
        realizar_pregunta(pregunta);
        e.preventDefault();
    })
    async function realizar_respuesta(respuesta, id_pregunta) {
        funcion = "realizar_respuesta";
        let data = await fetch('../Controllers/RespuestaController.php',{
            method: 'POST',
            headers: {'Content-Type':'application/x-www-form-urlencoded'},
            body: 'funcion=' + funcion + '&&respuesta=' + respuesta + '&&id_pregunta=' + id_pregunta
        })
        if(data.ok) {
            let response = await data.text();
            //console.log(response);
            try {
                let respuesta = JSON.parse(response);
                console.log(respuesta);
                mostrar_comentarios();
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
    $(document).on('click', '.enviar_respuesta', (e) => {
        let elemento = $(this)[0].activeElement.parentElement.parentElement;
        let respuesta = $(elemento).children('input.respuesta').val();
        let id_pregunta = $(elemento).children('input.id_pregunta').val();
        if(respuesta != '') {
            realizar_respuesta(respuesta, id_pregunta);
        } else {
            toastr.error('¡* la respuesta está vacía *!');
        }
        e.preventDefault();
    })
    async function cambiar_estado_favorito(id_favorito, estado_favorito) {
        funcion = "cambiar_estado_favorito";
        let data = await fetch('../Controllers/FavoritoController.php',{
            method: 'POST',
            headers: {'Content-Type':'application/x-www-form-urlencoded'},
            body: 'funcion=' + funcion + '&&id_favorito=' + id_favorito + '&&estado_favorito=' + estado_favorito
        })
        if(data.ok) {
            let response = await data.text();
            //console.log(response);
            try {
                let respuesta = JSON.parse(response);
                console.log(respuesta);
                if(respuesta.mensaje == "add") {
                    toastr.success('¡* Se agregó a favoritos *!');
                } else if(respuesta.mensaje == "remove") {
                    toastr.warning('¡* Se removió de favoritos *!');
                } else if(respuesta.mensaje == "error al eliminar") {
                    toastr.error('¡* No intente vulnerar el sistema *!');
                }
                mostrar_titulo_favorito();
                read_favoritos();
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
    $(document).on('click', '.bandera_favorito', (e) => {
        let elemento = $(this)[0].activeElement;
        let id_favorito = $(elemento).attr('id_favorito');
        let estado_favorito = $(elemento).attr('estado_fav');
        cambiar_estado_favorito(id_favorito, estado_favorito)
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