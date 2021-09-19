$(document).ready(function() {
    moment.locale('es');
    var funcion;
    bsCustomFileInput.init();
    verificar_sesion();
    obtener_datos();
    llenar_provincias();
    llenar_direcciones();
    llenar_historial();
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
    function llenar_historial() {
        funcion = "llenar_historial";
        $.post('../Controllers/HistorialController.php', { funcion }, (response) => {
            let historiales = JSON.parse(response);
            //console.log(historiales);
            let template = '';
            historiales.forEach(historial => {
                let fecha_moment = moment(historial[0].fecha, 'DD/MM/YY');
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
    
                                <h3 class="timeline-header"><strong>${cambio.th_icono} Se realizó la acción ${cambio.tipo_historial} en ${cambio.modulo}</strong></h3>
    
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
        })
    }
    function llenar_direcciones() {
        funcion = "llenar_direcciones";
        $.post('../Controllers/UsuarioLocalidadController.php', { funcion }, (response) => {
            let direcciones = JSON.parse(response);
            let contador = 0;
            let template = '';
            direcciones.forEach(direccion => {
                contador++;
                template += `
                <div class="callout callout-info">
                    <div class="card-header">
                        <strong>dirección ${contador}</strong>
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
            $('#direcciones').html(template);
        })
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
            title: 'Desea borrar esta dirección?',
            text: "Esta acción puede traer consecuencias!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Si, borra esto!',
            cancelButtonText: 'No, cancelar!',
            reverseButtons: true
          }).then((result) => {
            if (result.isConfirmed) {
                funcion = "eliminar_direccion";
                $.post('../Controllers/UsuarioLocalidadController.php', { funcion, id }, (response) => {
                    //console.log(response);
                    if(response == "success") {
                        swalWithBootstrapButtons.fire(
                            'Borrado!',
                            'La direccion fué borrada.',
                            'success'
                        )
                        llenar_direcciones();
                        llenar_historial();
                    } else if(response == "error") {
                        swalWithBootstrapButtons.fire(
                            'No se borro!',
                            'Hubo alteraciones en la integridad de los datos',
                            'error'
                        )
                    } else {
                        swalWithBootstrapButtons.fire(
                            'No se ha borrado!',
                            'Tenemos problemas en el sistema',
                            'error'
                        )
                    }
                });
            } else if (result.dismiss === Swal.DismissReason.cancel) {
                swalWithBootstrapButtons.fire(
                    'Cancelado',
                    'La dirección no se borro :)',
                    'error'
                )
            }
          })
    })
    function llenar_provincias() {
        funcion = "llenar_provincias";
        $.post('../Controllers/ProvinciaController.php', { funcion }, (response) => {
            let provincias = JSON.parse(response);
            let template = '';
            provincias.forEach(provincia => {
                template += `
                <option value="${provincia.id}">${provincia.nombre}</option>
                `;
            });
            $('#provincia').html(template);
            $('#provincia').val('').trigger('change');
        })
    }
    $('#provincia').change(function() {
        let id_provincia = $('#provincia').val();
        funcion = "llenar_localidad";
        $.post('../Controllers/LocalidadController.php', { funcion, id_provincia }, (response) => {
            let localidades = JSON.parse(response);
            let template = '';
            localidades.forEach(localidad => {
                template += `
                <option value="${localidad.id}">${localidad.nombre}</option>
                `;
            });
            $('#localidad').html(template);
            $('#localidad').val('').trigger('change');
        })
    });
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
            } else {
                $('#nav_usuario').hide();
                location.href = 'login.php';
            }
        })
    }
    function obtener_datos() {
        funcion = 'obtener_datos';
        $.post('../Controllers/UsuarioController.php', { funcion }, (response) => {
            let usuario = JSON.parse(response);
            $('#username').text(usuario.username);
            $('#tipo_usuario').text(usuario.tipo_usuario);
            $('#nombres').text(usuario.nombres + ' ' + usuario.apellidos);
            $('#avatar_perfil').attr('src', '../Util/Img/Users/' + usuario.avatar);
            $('#dni').text(usuario.dni);
            $('#email').text(usuario.email);
            $('#telefono').text(usuario.telefono);
        })
    }
    $('#form-direccion').submit(e=>{
        funcion = 'crear_direccion';
        let id_localidad = $('#localidad').val();
        let direccion = $('#direccion').val();
        let referencia = $('#referencia').val();
        $.post('../Controllers/UsuarioLocalidadController.php', { id_localidad, direccion, referencia, funcion }, (response)=> {
            if(response === 'success') {
                Swal.fire({
                    position: 'center',
                    icon: 'success',
                    title: 'Se ha registrado su dirección',
                    showConfirmButton: false,
                    timer: 1500
                }).then(function() {
                    $('#form-direccion').trigger('reset');
                    $('#provincia').val('').trigger('change');
                    llenar_direcciones();
                    llenar_historial();
                    location.reload();
                })
            } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'Hubo un conflicto al crear su dirección, comuniquese con el area de sistemas',
                })
            }
        });
        e.preventDefault();
    })
    $(document).on('click', '.editar_datos', (e) => {
        funcion = "obtener_datos";
        $.post('../Controllers/UsuarioController.php', { funcion }, (response) => {
            let usuario = JSON.parse(response);
            $('#nombres_mod').val(usuario.nombres);
            $('#apellidos_mod').val(usuario.apellidos);
            $('#dni_mod').val(usuario.dni);
            $('#email_mod').val(usuario.email);
            $('#telefono_mod').val(usuario.telefono);
        })
    })
    $.validator.setDefaults({
        submitHandler: function () {
            funcion = "editar_datos";
            let datos = new FormData($('#form-datos')[0]);
            datos.append("funcion", funcion);
            $.ajax({
                type: "POST",
                url: "../Controllers/UsuarioController.php",
                data: datos,
                cache: false,
                processData: false,
                contentType: false,
                success: function (response) {
                    if(response == "success") {
                        Swal.fire({
                            position: 'center',
                            icon: 'success',
                            title: 'Se ha editado sus datos',
                            showConfirmButton: false,
                            timer: 1500
                        }).then(function() {
                            verificar_sesion();
                            obtener_datos();
                            llenar_historial();
                            location.reload();
                        })
                    } else if(response == 'danger'){
                        Swal.fire({
                            icon: 'warning',
                            title: 'No alteró ningún cambio',
                            text: 'Modifique algun dato para realizar la edición !',
                        })
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Error',
                            text: 'Hubo un conflicto al editar sus datos, comuniquese con el area de sistemas',
                        })
                    }
                }
            });
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
            minlength: "* El D.N.I. debe ser de mínimo 7 caracteres",
            maxlength: "* El D.N.I. debe ser de máximo 8 caracteres",
            digits: "* El D.N.I. solo esta compuesto por números"
          },
          email_mod: {
            required: "* Este campo es obligatorio",
            email: "* No es formato email"
          },
          telefono_mod: {
            required: "* Este campo es obligatorio",
            minlength: "* El teléfono debe ser de mínimo 10 caracteres",
            maxlength: "* El teléfono debe ser de máximo 10 caracteres",
            digits: "* El teléfono solo esta compuesto por números"
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
    $.validator.setDefaults({
        submitHandler: function () {
            funcion = "cambiar_contra";
            let pass_old = $('#pass_old').val();
            let pass_new = $('#pass_new').val();
            $.post('../Controllers/UsuarioController.php', { funcion, pass_old, pass_new }, (response) => {
                if(response == 'success') {
                    Swal.fire({
                        position: 'center',
                        icon: 'success',
                        title: 'Se ha cambiado su contraseña',
                        showConfirmButton: false,
                        timer: 1000
                    }).then(function() {
                        $('#form-contra').trigger('reset');
                        llenar_historial();
                        location.reload();
                    })
                } else if(response === 'error') {
                    Swal.fire({
                        icon: 'warning',
                        title: 'Contraseña incorrecta',
                        text: 'Ingrese su contraseña actual para poder cambiarla',
                    })
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'Hubo un conflicto al cambiar su contraseña, comuniquese con el area de sistemas',
                    })
                }
            })
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
            minlength: "* La contraseña debe ser de mínimo 5 caracteres",
            maxlength: "* La contraseña debe ser de máximo 20 caracteres"
          },
          pass_new: {
            required: "* Este campo es obligatorio",
            minlength: "* La contraseña debe ser de mínimo 5 caracteres",
            maxlength: "* La contraseña debe ser de máximo 20 caracteres"
          },
          pass_repeat: {
            required: "* Este campo es obligatorio",
            equalTo: "* La contraseña no coincide con la ingresada"
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
})