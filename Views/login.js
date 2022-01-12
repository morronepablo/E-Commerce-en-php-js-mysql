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

    async function login(user, pass) {
        funcion = "login";
        let data = await fetch('../Controllers/UsuarioController.php',{
            method: 'POST',
            headers: {'Content-Type':'application/x-www-form-urlencoded'},
            body: 'funcion='+funcion+'&&user='+user+'&&pass='+pass
        })
        if(data.ok) {
            let response = await data.text();
            //conselo.log(response);
            try {
                let respuesta = JSON.parse(response);
                if(respuesta.mensaje == 'logueado') {
                    toastr.success('¡ Logueado !');
                    location.href = '../index.php';
                } else if(respuesta.mensaje == 'error') {
                    toastr.error('¡ Usuario o contraseña incorrectas !');
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

    $('#form-login').submit(e=>{
        let user = $('#user').val();
        let pass = $('#pass').val();
        Loader('Iniciando Sesion...');
        login(user, pass);
        e.preventDefault();
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