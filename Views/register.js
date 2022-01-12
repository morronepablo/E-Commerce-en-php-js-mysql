$(document).ready(function() {
    var funcion;
    Loader();
    //setTimeout(verificar_sesion, 2000);
    verificar_sesion();

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
                    location.href = '../index.php';
                }
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

    async function registrarse(username, pass, nombres, apellidos, dni, email, telefono) {
        funcion = "registrar_usuario";
        let data = await fetch('../Controllers/UsuarioController.php',{
            method: 'POST',
            headers: {'Content-Type':'application/x-www-form-urlencoded'},
            body: 'funcion='+funcion+'&&username='+username+'&&pass='+pass+'&&nombres='+nombres+'&&apellidos='+apellidos+'&&dni='+dni+'&&email='+email+'&&telefono='+telefono
        })
        if(data.ok) {
            let response = await data.text();
            //conselo.log(response);
            try {
              let respuesta = JSON.parse(response);
              console.log(respuesta);
              if(respuesta.mensaje == 'success') {
                Swal.fire({
                    position: 'center',
                    icon: 'success',
                    title: 'Se ha registrado correctamente',
                    showConfirmButton: false,
                    timer: 2500
                }).then(function() {
                    $('#form-register').trigger('reset');
                    location.href = '../Views/login.php';
                })
              } 
              CloseLoader();

            } catch (error) {
                console.error(error);
                console.log(response);
                Swal.fire({
                  icon: 'error',
                  title: 'Error',
                  text: 'Hubo un conflicto al registrarse, comuniquese con el area de sistemas',
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
          let username  = $('#username').val();
          let pass      = $('#pass').val();
          let nombres   = $('#nombres').val();
          let apellidos = $('#apellidos').val();
          let dni       = $('#dni').val();
          let email     = $('#email').val();
          let telefono  = $('#telefono').val();
          Loader('Registrando usuario...');
          registrarse(username, pass, nombres, apellidos, dni, email, telefono);
        }
      });
      jQuery.validator.addMethod("usuario_existente", 
        function(value, element) {
            let funcion = "verificar_usuario";
            let bandera;
            $.ajax({
                type: "POST",
                url: "../Controllers/UsuarioController.php",
                data: 'funcion=' + funcion + '&&value=' + value,
                async: false,
                success: function(response) {
                    if(response == 'success') {
                        bandera = false;
                    } else {
                        bandera = true;
                    }
                }
            })
            return bandera;
        }
      , "* El usuario ya existe, por favor ingrese uno diferente");
      jQuery.validator.addMethod("letras", 
        function(value, element) {
            return /^[A-Za-z ]+$/.test(value);
        }
      , "* Este campo solo permite letras");
      $('#form-register').validate({
        rules: {
          nombres: {
            required: true,
            letras: true
          },
          apellidos: {
            required: true,
            letras: true
          },
          username: {
            required: true,
            minlength: 5,
            maxlength: 20,
            usuario_existente: true
          },
          pass: {
            required: true,
            minlength: 5,
            maxlength: 20
          },
          pass_repeat: {
            required: true,
            equalTo: "#pass"
          },
          dni: {
            required: true,
            digits: true,
            minlength: 7,
            maxlength: 8
          },
          email: {
            required: true,
            email: true,
          },
          telefono: {
            required: true,
            digits: true,
            minlength: 10,
            maxlength: 10
          },
          terms: {
            required: true
          },
        },
        messages: {
          username: {
            required: "* Este campo es obligatorio",
            minlength: "* El usuario debe ser de mínimo 5 caracteres",
            maxlength: "* El usuario debe ser de máximo 20 caracteres"
          },
          pass: {
            required: "* Este campo es obligatorio",
            minlength: "* La contraseña debe ser de mínimo 5 caracteres",
            maxlength: "* La contraseña debe ser de máximo 20 caracteres"
          },
          pass_repeat: {
            required: "* Este campo es obligatorio",
            equalTo: "* La contraseña no coincide con la ingresada"
          },
          nombres: {
            required: "* Este campo es obligatorio"
          },
          apellidos: {
            required: "* Este campo es obligatorio"
          },
          dni: {
            required: "* Este campo es obligatorio",
            minlength: "* El D.N.I. debe ser de mínimo 7 caracteres",
            maxlength: "* El D.N.I. debe ser de máximo 8 caracteres",
            digits: "* El D.N.I. solo esta compuesto por números"
          },
          email: {
            required: "* Este campo es obligatorio",
            email: "* No es formato email"
          },
          telefono: {
            required: "* Este campo es obligatorio",
            minlength: "* El teléfono debe ser de mínimo 10 caracteres",
            maxlength: "* El teléfono debe ser de máximo 10 caracteres",
            digits: "* El teléfono solo esta compuesto por números"
          },
          terms: "Por favor acepte los términos y condiciones"
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