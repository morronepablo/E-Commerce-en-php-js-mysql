<?php
include_once '../Util/Config/config.php';
include_once '../Models/Destino.php';
include_once '../Models/Historial.php';
$destino = new Destino();
$historial = new Historial();
session_start();

if($_POST['funcion']=='read_mensajes_recibidos'){
    $id_usuario = $_SESSION['id'];
    $destino->read_mensajes_recibidos($id_usuario);
    $json = array();
    foreach ($destino->objetos as $objeto) {
        $json[] = array(
            'id'             => openssl_encrypt($objeto->id,CODE,KEY),
            'asunto'         => $objeto->asunto,
            'contenido'      => $objeto->contenido,
            'abierto'       => $objeto->abierto,
            'favorito'       => $objeto->favorito,
            'estado'         => $objeto->estado,
            'fecha_creacion' => $objeto->fecha_creacion,
            'fecha_edicion'  => $objeto->fecha_edicion,
            'emisor'         => $objeto->nombres.' '.$objeto->apellidos
        );
    }
    $jsonstring = json_encode($json);
    echo $jsonstring;
}
if($_POST['funcion']=='eliminar_mensajes'){
    $id_usuario = $_SESSION['id'];
    $eliminados = json_decode($_POST['eliminados']);
    $bandera = '1';
    foreach ($eliminados as $objeto) {
        $formateado = str_replace(" ","+",$objeto);
        $id_mensaje = openssl_decrypt($formateado, CODE, KEY);
        if(is_numeric($id_mensaje)) {
            $destino->eliminar_mensaje($id_mensaje);
            $descripcion = 'Ha eliminado un mensaje';
            $historial->crear_historial($descripcion, 3, 7, $id_usuario);
        } else {
            $bandera = '0';
        }
    }
    if($bandera == '1') {
        // Correcto
        $json = array(
            'mensaje' => 'success'
        );
        $jsonstring = json_encode($json);
        echo $jsonstring;
    } else {
        // Vulnero el sistema
        echo 'error';
    }
}
if($_POST['funcion']=='remover_favorito'){
    $id_usuario = $_SESSION['id'];
    $formateado = str_replace(" ","+",$_POST['id']);
    $id_mensaje = openssl_decrypt($formateado, CODE, KEY);
    if(is_numeric($id_mensaje)) {
        $destino->remover_favorito($id_mensaje);
        $json = array(
            'mensaje' => 'success'
        );
        $jsonstring = json_encode($json);
        echo $jsonstring;
    } else {
        echo 'error';
    }
}
if($_POST['funcion']=='agregar_favorito'){
    $id_usuario = $_SESSION['id'];
    $formateado = str_replace(" ","+",$_POST['id']);
    $id_mensaje = openssl_decrypt($formateado, CODE, KEY);
    if(is_numeric($id_mensaje)) {
        $destino->agregar_favorito($id_mensaje);
        $json = array(
            'mensaje' => 'success'
        );
        $jsonstring = json_encode($json);
        echo $jsonstring;
    } else {
        echo 'error';
    }
}
