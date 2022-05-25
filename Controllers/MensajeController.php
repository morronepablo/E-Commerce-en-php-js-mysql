<?php
include_once '../Util/Config/config.php';
include_once '../Models/Destino.php';
include_once '../Models/Mensaje.php';
include_once '../Models/Historial.php';
include_once '../Models/Usuario.php';
$destino   = new Destino();
$mensaje   = new Mensaje();
$historial = new Historial();
$usuario   = new Usuario();
session_start();

if($_POST['funcion']=='crear_mensaje'){
    $id_usuario   = $_SESSION['id'];
    if(!empty($_POST['para'])) {
        $para = $_POST['para'];
    } else {
        $para = $_POST['usuario_destino'];
    }
    $asunto       = $_POST['asunto'];
    $contenido    = $_POST['contenido'];
    $formateado   = str_replace(" ","+",$para);
    $destinatario = openssl_decrypt($formateado, CODE, KEY);
    if(is_numeric($destinatario)) {
        $mensaje->crear($id_usuario);
        $mensaje->ultimo_mensaje();
        $id_mensaje = $mensaje->objetos[0]->ultimo_mensaje;
        $destino->crear($asunto,$contenido,$destinatario,$id_mensaje);
        $usuario->obtener_datos($destinatario);
        $nombre_completo = $usuario->objetos[0]->nombres.' '.$usuario->objetos[0]->apellidos;
        $descripcion = 'Ha enviado un mensaje para: '.$nombre_completo;
        $historial->crear_historial($descripcion, 2, 7, $id_usuario);
        $json = array(
            'mensaje' => 'success'
        );
        $jsonstring = json_encode($json);
        echo $jsonstring;
    } else {
        echo 'error';
    }
}

