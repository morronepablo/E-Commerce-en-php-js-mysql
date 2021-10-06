<?php
include_once '../Util/Config/config.php';
include_once '../Models/Notificacion.php';
$notificacion = new Notificacion();
session_start();

if($_POST['funcion']=='read_notificaciones'){
    if(!empty($_SESSION['id'])) {
        $id_usuario = $_POST['id_usuario'];
        $notificacion->read($id_usuario);
        //var_dump($notificacion);
        $json = array();
        foreach ($notificacion->objetos as $objeto) {
            $json[] = array(
                'id'             => openssl_encrypt($objeto->id, CODE, KEY),
                'titulo'         => $objeto->titulo,
                'asunto'         => $objeto->asunto,
                'contenido'      => $objeto->contenido,
                'imagen'         => $objeto->imagen,
                'url_1'          => $objeto->url_1,
                'fecha_creacion' =>$objeto->fecha_creacion
            );
        }
        $jsonstring = json_encode($json);
        echo $jsonstring;
    } else {
        echo 'error, el usuario no está en sesión';
    }
}
if($_POST['funcion']=='read_all_notificaciones'){
    if(!empty($_SESSION['id'])) {
        $id_usuario = $_POST['id_usuario'];
        $notificacion->read_all_notificaciones($id_usuario);
        //var_dump($notificacion);
        $json = array();
        foreach ($notificacion->objetos as $objeto) {
            $json[] = array(
                'id'             => openssl_encrypt($objeto->id, CODE, KEY),
                'titulo'         => $objeto->titulo,
                'asunto'         => $objeto->asunto,
                'contenido'      => $objeto->contenido,
                'imagen'         => $objeto->imagen,
                'url_1'          => $objeto->url_1,
                'fecha_creacion' => $objeto->fecha_creacion,
                'estado_abierto' => $objeto->estado_abierto
            );
        }
        $jsonstring = json_encode($json);
        echo $jsonstring;
    } else {
        echo 'error, el usuario no está en sesión';
    }
}
