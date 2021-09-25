$(document).ready(function() {
    moment.locale('es');
    // Formato numeros a Moneda Local
    function formatNumber(number) {
        return new Intl.NumberFormat( "ES-AR", {
            style: 'currency',
            currency: 'ARS',
        }).format(number)
    }
    verificar_sesion();
    verificar_producto();






    async function read_notificaciones(id_usuario) {
        funcion = "read_notificaciones";
        let data = await fetch('../Controllers/NotificacionController.php',{
            method: 'POST',
            headers: {'Content-Type':'application/x-www-form-urlencoded'},
            body: 'funcion=' + funcion + '&&id_usuario=' + id_usuario
        })
        if(data.ok) {
            let response = await data.text();
            //console.log(response);
            try {
                let notificaciones = JSON.parse(response);
                console.log(notificaciones);
                let template1 = '';
                if(notificaciones.length == 0) {
                    template1 += `
                        <i class="far fa-bell"></i>
                    `;
                } else {
                    template1 += `
                        <i class="far fa-bell"></i>
                        <span class="badge badge-warning navbar-badge">${notificaciones.length}</span>
                    `;
                }
                $('#numero_notificacion').html(template1);
                let template = '';
                template += `
                    <span class="dropdown-item dropdown-header">${notificaciones.length} Notificaciones</span>
                `;
                notificaciones.forEach(notificacion => {
                    template += `
                    <div class="dropdown-divider"></div>
                        <a href="../${notificacion.url_1}" class="dropdown-item">
                            <div class="media">
                                <img src="../Util/Img/producto/${notificacion.imagen}" alt="User Avatar" class="img-size-50 img-circle mr-3">
                                <div class="media-body">
                                    <h3 class="dropdown-item-title">
                                        ${notificacion.titulo}
                                    </h3>
                                    <p class="text-sm">${notificacion.asunto}</p>
                                    <p class="text-sm text-muted">${notificacion.contenido}</p>
                                    <span class="float-right text-muted text-sm">${notificacion.fecha_creacion}</span>
                                </div>
                            </div>
                        </a>
                    <div class="dropdown-divider"></div>
                    `;
                });
                template += `
                    <a href="#" class="dropdown-item dropdown-footer">Ver todas las notificaciones</a>
                `;
                $('#notificaciones').html(template);
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
    function verificar_sesion() {
        funcion = 'verificar_sesion';
        $.post('../Controllers/UsuarioController.php', { funcion }, (response) => {
            if(response != '') {
                let sesion = JSON.parse(response);
                $('#nav_login').hide();
                $('#nav_register').hide();
                $('#usuario_nav').text(sesion.user + ' #' + sesion.id);
                $('#avatar_nav').attr('src', '../Util/Img/Users/' + sesion.avatar);
                $('#avatar_menu').attr('src', '../Util/Img/Users/' + sesion.avatar);
                $('#usuario_menu').text(sesion.user);
                read_notificaciones(sesion.id);
            } else {
                $('#nav_usuario').hide();
            }
        })
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
                $('#imagenes').html(template);
                $('#producto').text(producto.producto);
                $('#marca').text('Marca: ' + producto.marca);
                $('#sku').text('SKU: ' + producto.sku);
                let template1 = '';
                if(producto.calificacion != 0) {
                    //template1 += `</br>`;
                    for (let index = 0; index < producto.calificacion; index++) {
                        template1 += `<i class="fas fa-star text-warning"></i>`;
                    }
                    let estrellas_faltantes = 5 - producto.calificacion;
                    for (let index = 0; index < estrellas_faltantes; index++) {
                        template1 += `<i class="far fa-star text-warning"></i>`;
                    }
                    template1 += `</br>`;
                }
                if(producto.descuento != 0) {
                    template1 += `
                    <span class="text-muted" style="text-decoration: line-through">${formatNumber(producto.precio)}</span>
                    <span class="text-muted">-${producto.descuento}%</span></br>
                    `;
                }
                template1 += `<h4 class="text-danger"><strong>${formatNumber(producto.precio_descuento)}</strong>   </h4>`;
                $('#informacion_precios').html(template1);
                let template2 = '';
                if(producto.envio == 'gratis'){
                    template2 += `  <i class="fas fa-truck-moving text-danger"></i>
                                    <span class="ml-1"> Envio: </span>
                                    <span class="badge bg-success ml-1">Envio gratis</span>`;
                } else {
                    template2 += `  <i class="fas fa-truck-moving text-danger"></i>
                                    <span class="ml-1"> Envio: </span>
                                    <span class="mr-1">$ 150,00</span>`;
                }
                template2 += `  </br>`;
                template2 += `  <i class="fas fa-store text-primary"></i>
                                <span class="ml-1">Retiralo en tienda: ${producto.direccion_tienda}</span>`;
                $('#informacion_envio').html(template2);
                $('#nombre_tienda').text(producto.tienda);
                $('#numero_resenas').text(producto.numero_resenas + ' reseñas');
                $('#promedio_calificacion_tienda').text(producto.promedio_calificacion_tienda);
                $('#product-desc').text(producto.detalles);
                let template3 = '';
                let cont = 0;
                producto.caracteristicas.forEach(caracteristica => {
                    cont++;
                    template3 += `
                        <tr>
                            <td>${cont}</td>
                            <td>${caracteristica.titulo}</td>
                            <td>${caracteristica.descripcion}</td>
                        </tr>
                    `;
                });
                $('#caracteristicas').html(template3);
                let template4 = '';
                producto.resenas.forEach(resena => {
                    template4 += `
                        <div class="card-comment">
                            <img class="img-circle img-sm" src="../Util/Img/Users/${resena.avatar}" alt="User Image">
                            <div class="comment-text">
                                <span class="username">
                                    ${resena.usuario}
                                    `;
                                    for (let index = 0; index < resena.calificacion; index++) {
                                        template4 += `<i class="fas fa-star text-warning"></i>`;
                                    }
                                    let estrellas_faltantes = 5 - resena.calificacion;
                                    for (let index = 0; index < estrellas_faltantes; index++) {
                                        template4 += `<i class="far fa-star text-warning"></i>`;
                                    }
                                    let fecha = moment(resena.fecha+' '+resena.hora, 'DD/MM/YYYY HH/:mm');
                                    let horas = moment(resena.hora, 'HH/:mm');
                                    let fecha_hora;
                                    if(resena.hoy == '1') {
                                        fecha_hora = horas.fromNow();
                                    } else {
                                        fecha_hora = fecha.format('LLL');
                                    }
                        template4+=`<span class="text-muted float-right">${fecha_hora}</span>
                                </span>
                                ${resena.descripcion}
                            </div>
                        </div>
                    `;
                });
                
                $('#resenas').html(template4);
                let template5 = '';
                if(producto.bandera == '2') {
                    template5 += `
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
                template5 += `
                    <div class="direct-chat-messages direct-chat-success preguntas">`;
                    producto.preguntas.forEach(pregunta => {
                        template5 += `
                        <div class="direct-chat-msg">
                            <div class="direct-chat-infos clearfix">
                                <span class="direct-chat-name float-left">${pregunta.username}</span>
                                <span class="direct-chat-timestamp float-right">${pregunta.fecha_creacion}</span>
                            </div>
                            <img class="direct-chat-img" src="../Util/Img/Users/${pregunta.avatar}" alt="Message User Image">
                            <div class="direct-chat-text">
                                ${pregunta.contenido}
                            </div>`;
                            if(pregunta.estado_respuesta == '0') {
                                // No tiene respuesta la pregunta
                                if(producto.bandera == '1') {
                                    // Si el usuario logueado es el dueño puede responder pregunta  
                                    template5 += `
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
                                // La pregunta tiene respuesta
                                template5 += `
                                <div class="direct-chat-msg right">
                                    <div class="direct-chat-infos clearfix">
                                        <span class="direct-chat-name float-right">${producto.username}</span>
                                        <span class="direct-chat-timestamp float-left">${pregunta.respuesta.fecha_creacion}</span>
                                    </div>
                                    <img class="direct-chat-img" src="../Util/Img/Users/${producto.avatar}" alt="Message User Image">
                                    <div class="direct-chat-text">
                                        ${pregunta.respuesta.contenido}
                                    </div>
                                </div>
                                `;
                            }
                        template5 += `
                        </div>
                        `;
                    });
                template5 += `
                    </div>`;
                $('#product-pre').html(template5);
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
                verificar_producto();
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
                verificar_producto();
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
})