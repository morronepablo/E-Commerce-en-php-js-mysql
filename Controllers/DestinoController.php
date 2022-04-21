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
if($_POST['funcion']=='abrir_mensaje'){
    $id_usuario = $_SESSION['id'];
    $formateado = str_replace(" ","+",$_SESSION['message-verification']);
    $id_mensaje = openssl_decrypt($formateado, CODE, KEY);
    $option = $_SESSION['message-option'];
    if(is_numeric($id_mensaje)) {
        if($option == 'r' || $option == 'e' || $option == 'f' || $option == 'p') {
            $destino->verificar_usuario_mensaje($id_usuario, $id_mensaje);
            if(!empty($destino->objetos)) {
                $destino->abrir_mensaje($id_mensaje);
                $json = array(
                    'id'             => openssl_encrypt($destino->objetos[0]->id,CODE,KEY),
                    'asunto'         => $destino->objetos[0]->asunto,
                    'contenido'      => $destino->objetos[0]->contenido,
                    'abierto'        => $destino->objetos[0]->abierto,
                    'favorito'       => $destino->objetos[0]->favorito,
                    'estado'         => $destino->objetos[0]->estado,
                    'fecha_creacion' => $destino->objetos[0]->fecha_creacion,
                    'fecha_edicion'  => $destino->objetos[0]->fecha_edicion,
                    'emisor'         => $destino->objetos[0]->nombres.' '.$destino->objetos[0]->apellidos,
                    'option'         => $option
                );
                $destino->mensaje_leido($id_mensaje);
                $jsonstring = json_encode($json);
                echo $jsonstring;
            } else {
                echo 'danger';
            }
        } else {
            echo 'danger';
        }
    } else {
        echo 'error';
    }
}
if($_POST['funcion']=='eliminar_mensaje'){
    $id_usuario = $_SESSION['id'];
    $formateado = str_replace(" ","+",$_POST['id']);
    $id_mensaje = openssl_decrypt($formateado, CODE, KEY);
    $option = $_SESSION['message-option'];
    if(is_numeric($id_mensaje)) {
        $destino->eliminar_mensaje($id_mensaje);
        $descripcion = 'Ha eliminado un mensaje';
        $historial->crear_historial($descripcion, 3, 7, $id_usuario);
        $json = array(
            'mensaje' => 'success',
            'option'  => $option
        );
        $jsonstring = json_encode($json);
        echo $jsonstring;
    } else {
        echo 'error';
    }
}
if($_POST['funcion']=='read_mensajes_favoritos'){
    $id_usuario = $_SESSION['id'];
    $destino->read_mensajes_favoritos($id_usuario);
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
if($_POST['funcion']=='read_mensajes_papelera'){
    $id_usuario = $_SESSION['id'];
    $destino->read_mensajes_papelera($id_usuario);
    $json = array();
    foreach ($destino->objetos as $objeto) {
        $json[] = array(
            'id'             => openssl_encrypt($objeto->id,CODE,KEY),
            'asunto'         => $objeto->asunto,
            'contenido'      => $objeto->contenido,
            'abierto'        => $objeto->abierto,
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
if($_POST['funcion']=='eliminar_mensajes_definitivamente'){
    $id_usuario = $_SESSION['id'];
    $eliminados = json_decode($_POST['eliminados']);
    $bandera = '1';
    foreach ($eliminados as $objeto) {
        $formateado = str_replace(" ","+",$objeto);
        $id_mensaje = openssl_decrypt($formateado, CODE, KEY);
        if(is_numeric($id_mensaje)) {
            $destino->eliminar_mensaje_definitivamente($id_mensaje);
            $descripcion = 'Ha eliminado un mensaje definitivamente';
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
if($_POST['funcion']=='eliminar_mensaje_definitivamente'){
    $id_usuario = $_SESSION['id'];
    $formateado = str_replace(" ","+",$_POST['id']);
    $id_mensaje = openssl_decrypt($formateado, CODE, KEY);
    if(is_numeric($id_mensaje)) {
        $destino->eliminar_mensaje_definitivamente($id_mensaje);
        $descripcion = 'Ha eliminado un mensaje definitivamente';
        $historial->crear_historial($descripcion, 3, 7, $id_usuario);
        $json = array(
            'mensaje' => 'success'
        );
        $jsonstring = json_encode($json);
        echo $jsonstring;
    } else {
        echo 'error';
    }
}
