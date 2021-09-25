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
                'id'             => $objeto->id,
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
