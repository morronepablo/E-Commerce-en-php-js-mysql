<?php
include_once $_SERVER["DOCUMENT_ROOT"].'/commerce/Models/Usuario.php';
include_once $_SERVER["DOCUMENT_ROOT"].'/commerce/Models/Historial.php';
include_once $_SERVER["DOCUMENT_ROOT"].'/commerce/Util/Config/config.php';
require $_SERVER["DOCUMENT_ROOT"].'/commerce/vendor/autoload.php';

$usuario = new Usuario();
$historial = new Historial();
session_start();
if($_POST['funcion'] == 'login') {
    $user = $_POST['user'];
    $pass = $_POST['pass'];
    $usuario->verificar_usuario($user);
    $mensaje = '';
    if($usuario->objetos != null) {
        $pass_bd = openssl_decrypt($usuario->objetos[0]->pass, CODE, KEY);
        if($pass_bd == $pass) {
            $_SESSION['id']           = $usuario->objetos[0]->id;
            $_SESSION['user']         = $usuario->objetos[0]->user;
            $_SESSION['tipo_usuario'] = $usuario->objetos[0]->id_tipo;
            $_SESSION['avatar']       = $usuario->objetos[0]->avatar;
            $_SESSION['nombre']       = $usuario->objetos[0]->nombres.' '.$usuario->objetos[0]->apellidos;
            $mensaje = 'logueado';
        } else {
            $mensaje = 'error';
        }
    } else {
        $mensaje = 'error';
    }
    $json = array(
        'mensaje' => $mensaje
    );
    $jsonstring = json_encode($json);
    echo $jsonstring;
}
if($_POST['funcion'] == 'verificar_sesion') {
    if(!empty($_SESSION['id'])) {
        $json[] = array(
            'id'           => $_SESSION['id'],
            'user'         => $_SESSION['user'],
            'tipo_usuario' => $_SESSION['tipo_usuario'],
            'avatar'       => $_SESSION['avatar']
        );
        $jsonstring = json_encode($json[0]);
        echo $jsonstring;
    } else {
        echo '';
    }
}
if($_POST['funcion'] == 'verificar_usuario') {
    $username = $_POST['value'];
    $usuario->verificar_usuario($username);
    if($usuario->objetos != null) {
        echo 'success';
    }
}
if($_POST['funcion'] == 'registrar_usuario') {
    $username = $_POST['username'];
    $pass = openssl_encrypt($_POST['pass'], CODE, KEY);
    $nombres = $_POST['nombres'];
    $apellidos = $_POST['apellidos'];
    $dni = $_POST['dni'];
    $email = $_POST['email'];
    $telefono = $_POST['telefono'];
    $usuario->registrar_usuario($username, $pass, $nombres, $apellidos, $dni, $email, $telefono);
    $json = array(
        'mensaje' => 'success'
    );
    $jsonstring = json_encode($json);
    echo $jsonstring;
}
if($_POST['funcion'] == 'obtener_datos') {
    $usuario->obtener_datos($_SESSION['id']);
    foreach ($usuario->objetos as $objeto) {
        $json[] = array(
            'username'=>$objeto->user,
            'nombres'=>$objeto->nombres,
            'apellidos'=>$objeto->apellidos,
            'dni'=>$objeto->dni,
            'email'=>$objeto->email,
            'telefono'=>$objeto->telefono,
            'avatar'=>$objeto->avatar,
            'tipo_usuario'=>$objeto->tipo,
        );
    }
    $jsonstring = json_encode($json[0]);
    echo $jsonstring;
}
if($_POST['funcion'] == 'editar_datos') {
    $id_usuario = $_SESSION['id'];
    $nombres = $_POST['nombres_mod'];
    $apellidos = $_POST['apellidos_mod'];
    $dni = $_POST['dni_mod'];
    $email = $_POST['email_mod'];
    $telefono = $_POST['telefono_mod'];
    $avatar = $_FILES['avatar_mod']['name'];
    $usuario->obtener_datos($id_usuario);
    $mensaje = '';
    $datos_cambiados = 'ha echo los siguientes cambios: ';
    if($nombres != $usuario->objetos[0]->nombres || $apellidos != $usuario->objetos[0]->apellidos || $dni != $usuario->objetos[0]->dni || $email != $usuario->objetos[0]->email || $telefono != $usuario->objetos[0]->telefono || $avatar != '') {
        if($nombres != $usuario->objetos[0]->nombres) {
            $datos_cambiados.= 'su nombre cambio de '.$usuario->objetos[0]->nombres.' a '.$nombres.', ';
        }
        if($apellidos != $usuario->objetos[0]->apellidos) {
            $datos_cambiados.= 'su apellido cambio de '.$usuario->objetos[0]->apellidos.' a '.$apellidos.', ';
        }
        if($dni != $usuario->objetos[0]->dni) {
            $datos_cambiados.= 'su D.N.I. cambio de '.$usuario->objetos[0]->dni.' a '.$dni.', ';
        }
        if($email != $usuario->objetos[0]->email) {
            $datos_cambiados.= 'su email cambio de '.$usuario->objetos[0]->email.' a '.$email.', ';
        }
        if($telefono != $usuario->objetos[0]->telefono) {
            $datos_cambiados.= 'su teléfono cambio de '.$usuario->objetos[0]->telefono.' a '.$telefono.', ';
        }
        if($avatar != '') {
            $datos_cambiados.= 'su avatar fué cambiado. ';
            $nombre = uniqid().'-'.uniqid();
            $archivo = $nombre;
            $extension = pathinfo($avatar, PATHINFO_EXTENSION);
            $nombre_base = $archivo.'.'.$extension;
            $handle = new \Verot\Upload\Upload($_FILES['avatar_mod']);
            if ($handle->uploaded) {
                $handle->file_new_name_body   = $archivo;
                $handle->image_resize         = true;
                $handle->image_x              = 200;
                $handle->image_y              = 200;
                $handle->process('../Util/Img/Users/');
                if ($handle->processed) {
                    $handle->clean();
                } else {
                    echo 'error : ' . $handle->error;
                }
            }
            
            $usuario->obtener_datos($id_usuario);
            foreach ($usuario->objetos as $objeto) {
                $avatar_actual = $objeto->avatar;
                if($avatar_actual != 'user_default.png') {
                    unlink('../Util/Img/Users/'.$avatar_actual);
                }
            }
            $nombre = $archivo.'.'.$extension;
            $_SESSION['avatar'] = $nombre;
        } else {
            $nombre = '';
        }
        $usuario->editar_datos($id_usuario, $nombres, $apellidos, $dni, $email, $telefono, $nombre);
        $descripcion = 'Ha editado sus datos personales, '.$datos_cambiados;
        $historial->crear_historial($descripcion, 1, 1, $id_usuario);
        $mensaje = 'success';
    } else {
        $mensaje = 'danger';
    }
    $json = array(
        'mensaje' => $mensaje
    );
    $jsonstring = json_encode($json);
    echo $jsonstring;
}
if($_POST['funcion'] == 'cambiar_contra') {
    $id_usuario = $_SESSION['id'];
    $user       = $_SESSION['user'];
    $pass_old   = $_POST['pass_old'];
    $pass_new   = $_POST['pass_new'];
    $usuario->verificar_usuario($user);
    $mensaje = '';
    if(!empty($usuario->objetos)){
        $pass_bd = openssl_decrypt($usuario->objetos[0]->pass, CODE, KEY);
        if($pass_bd == $pass_old) {
            $pass_new_encriptada = openssl_encrypt($pass_new, CODE, KEY);
            $usuario->cambiar_contra($id_usuario, $pass_new_encriptada);
            $descripcion = 'Ha cambiado su contraseña.';
            $historial->crear_historial($descripcion, 1, 1, $id_usuario);
            $mensaje = 'success';
        } else {
            $mensaje = 'error';
        }
    } else {
        $mensaje = 'error';
    }
    $json = array(
        'mensaje' => $mensaje
    );
    $jsonstring = json_encode($json);
    echo $jsonstring;
}
if($_POST['funcion'] == 'llenar_destinatarios') {
    $id_usuario = $_SESSION['id'];
    $usuario->llenar_destinatarios($id_usuario);
    foreach ($usuario->objetos as $objeto) {
        $json[] = array(
            'id'              => openssl_encrypt($objeto->id,CODE,KEY),
            'username'        => $objeto->user,
            'nombre_completo' => $objeto->nombres.' '.$objeto->apellidos
        );
    }
    
    $jsonstring = json_encode($json);
    echo $jsonstring;
}