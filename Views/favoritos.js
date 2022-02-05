$(document).ready(function() {
    moment.locale('es');
    Loader();
    //setTimeout(verificar_sesion, 2000);
    verificar_sesion();
    toastr.options = {
        'debug': false,
        'positionClass': 'toast-bottom-full-width',
        'onclick': null,
        'fadeIn': 300,
        'fadeOut': 1000,
        'timeOut': 5000,
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
                    llenar_menu_superior(sesion);
                    llenar_menu_lateral(sesion);
                    $('#active_nav_favoritos').addClass('active');
                    $('#avatar_menu').attr('src', '../Util/Img/Users/' + sesion.avatar);
                    $('#usuario_menu').text(sesion.user);
                    read_notificaciones();
                    read_favoritos();
                    read_all_favoritos();
                    CloseLoader();
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

    async function read_all_favoritos() {
        funcion = "read_all_favoritos";
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
                let template = '';
                let favorites = [];
                favoritos.forEach(favorito => {
                    let fecha = moment(favorito.fecha+' '+favorito.hora, 'DD/MM/YYYY HH/:mm');
                    let horas = moment(favorito.hora, 'HH/:mm');
                    let fecha_hora;
                    if(notificacion.hoy == '1') {
                        fecha_hora = horas.fromNow();
                    } else {
                        fecha_hora = fecha.format('LLL');
                    }
                    template = '';
                    template += `
                        <div class="row">
                            <div class="col-sm-1 text-center">
                                <button type="button" class="btn eliminar_fav" attrid="${favorito.id}">
                                    <i class="far fa-trash-alt text-danger"></i>
                                </button>
                            </div>
                            <div class="col-sm-11">
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
                            </div>
                        </div>
                    `;
                    favorites.push({ celda: template });
                });
                $('#fav').DataTable( {
                    data: favorites,
                    "aaSorting": [],
                    "searching": true,
                    "scrollX": true,
                    "autoWidth": false,
                    columns: [
                        { data: "celda" }
                    ],
                    "destroy": true,
                    "language": espanol
                } );
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

    async function eliminar_favorito(id_favorito) {
        funcion = "eliminar_favorito";
        let data = await fetch('../Controllers/FavoritoController.php',{
            method: 'POST',
            headers: {'Content-Type':'application/x-www-form-urlencoded'},
            body: 'funcion=' + funcion + '&&id_favorito=' + id_favorito
        })
        if(data.ok) {
            let response = await data.text();
            //console.log(response);
            try {
                let respuesta = JSON.parse(response);
                //console.log(respuesta.mensaje);
                if(respuesta.mensaje == "favorito eliminado") {
                    toastr.success('¡* El item se eliminó de tus favoritos *!');
                } else if(respuesta.mensaje == "error al eliminar") {
                    toastr.error('¡* No intente vulnerar el sistema *!');
                }
                read_all_favoritos();
                read_favoritos();  
            } catch (error) {
                console.error(error);
                console.log(response);
                toastr.error('¡* Por favor comuníquese con el area de sistemas *!');
            }

        } else {
            Swal.fire({
                icon: 'error',
                title: data.statusText,
                text: 'Hubo un conflicto de código: ' + data.status,
            })

        }
    }

    $(document).on('click', '.eliminar_fav', (e) => {
        let elemento = $(this)[0].activeElement;
        let id = $(elemento).attr('attrid');
        eliminar_favorito(id);
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