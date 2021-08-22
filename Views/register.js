$(document).ready(function() {
    var funcion;
    verificar_sesion();

    function verificar_sesion() {
        funcion = 'verificar_sesion';
        $.post('../Controllers/UsuarioController.php', { funcion }, (response) => {
            if(response != '') {
                location.href = '../index.php';
            }
        })
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
          funcion = "registrar_usuario";
          $.post('../Controllers/UsuarioController.php', { username, pass, nombres, apellidos, dni, email, telefono, funcion }, (response) => {
            response = response.trim();  
            if(response == 'success') {
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
              } else {
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'Hubo un conflicto al registrarse, comuniquese con el area de sistemas',
                })
              }
          })
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
})