<?php
include_once $_SERVER["DOCUMENT_ROOT"].'/commerce/Models/ProductoTienda.php';
include_once $_SERVER["DOCUMENT_ROOT"].'/commerce/Util/Config/config.php';
include_once $_SERVER["DOCUMENT_ROOT"].'/commerce/Models/Pregunta.php';
include_once $_SERVER["DOCUMENT_ROOT"].'/commerce/Models/Notificacion.php';
include_once $_SERVER["DOCUMENT_ROOT"].'/commerce/Models/Historial.php';
include_once $_SERVER["DOCUMENT_ROOT"].'/commerce/Models/Respuesta.php';
$producto_tienda = new ProductoTienda();
$pregunta        = new Pregunta();
$notificacion    = new Notificacion();
$historial       = new Historial();
$respuesta       = new Respuesta();
session_start();
date_default_timezone_set('America/Argentina/Buenos_Aires');
$fecha_actual = date('d-m-Y');
if($_POST['funcion']=='realizar_pregunta'){
    if(!empty($_SESSION['id'])) {
        $pgt = $_POST['pregunta'];
        $id_usuario = $_SESSION['id'];
        $formateado = str_replace(" ","+",$_SESSION['product-verification']);
        $id_producto_tienda = openssl_decrypt($formateado, CODE, KEY);
        $pregunta->create($pgt, $id_producto_tienda, $id_usuario);
        /////////////////////////////////////////////////////////////////////
        $producto_tienda->llenar_productos($id_producto_tienda);
        $id_propietario_tienda = $producto_tienda->objetos[0]->id_usuario;
        $titulo                = $producto_tienda->objetos[0]->producto;
        $imagen                = $producto_tienda->objetos[0]->imagen;
        $asunto                = 'Alguien realizó una pregunta en tu producto';
        $url                   = 'Views/descripcion.php?name='.$titulo.'&&id='.$formateado;
        $notificacion->create($titulo, $asunto, $pgt, $imagen, $url, $id_propietario_tienda);
        $descripcion = 'Ha realizado una pregunta: '.$pgt.'. | en el producto: '.$titulo;
        $historial->crear_historial($descripcion, 2, 3, $id_usuario);
        $json = array(
            'mensaje1'=> 'pregunta creada',
            'mensaje2'=> 'notificacion creada',
            'mensaje3'=> 'historial creado'
        );
        $jsonstring = json_encode($json);
        echo $jsonstring;
    } else {
        echo 'error, el usuario no está en sesión';
    }
}
if($_POST['funcion']=='mostrar_comentarios'){
    $formateado = str_replace(" ","+",$_SESSION['product-verification']);
    $id_producto_tienda = openssl_decrypt($formateado, CODE, KEY);
    $producto_tienda->llenar_productos($id_producto_tienda);
    $id_usuario = $producto_tienda->objetos[0]->id_usuario;
    $username   = $producto_tienda->objetos[0]->username;
    $avatar     = $producto_tienda->objetos[0]->avatar;
    $id_usuario_sesion = 0;
    $usuario_sesion = '';
    $avatar_sesion = '';
    $bandera = '0';
    if(!empty($_SESSION['id'])){
        $id_usuario_sesion = 1;
        $usuario_sesion = $_SESSION['id'];
        $avatar_sesion = $_SESSION['avatar'];
    }
    if($id_usuario_sesion == 1) {
        if($id_usuario == $_SESSION['id']) {
            // El usuario en sesion es el dueño de la tienda o producto.
            // Puedo responder preguntas
            // No puedo hacer preguntas
            $bandera = '1';
        } else {
            // El usuario en sesion es cualquiera menos el dueño
            // No puedo responder preguntas
            // Puedo hacer preguntas
            $bandera = '2';
        }
    } else {
        // El usuario no tiene sesion
        // No puedo responder ni hacer preguntas
        $bandera = '0';
    }
    $pregunta->read($id_producto_tienda);
    $preguntas = array();
    $bandera1 = '';
    $bandera2 = '';
    foreach ($pregunta->objetos as $objeto) {
        $respuesta->read($objeto->id);
        $rpst = array();
        // Esto es por si no hay una respuesta a la pregunta
        if(!empty($respuesta)) {
            foreach ($respuesta->objetos as $objeto1) {
                $fecha_hora = date_create($objeto1->fecha_creacion);
                $hora = $fecha_hora->format('H:i');
                $fecha = date_format($fecha_hora, 'd-m-Y');
                if($fecha_actual == $fecha) {
                    $bandera2 = '1';
                } else {
                    $bandera2 = '0';
                }
                $rpst = array(
                    'id' => $objeto1->id,
                    'contenido' => $objeto1->contenido,
                    'fecha_creacion' => $objeto1->fecha_creacion,
                    'fecha' => $fecha,
                    'hora' => $hora,
                    'hoy' => $bandera2,
                );
            }
        }
        $fecha_hora = date_create($objeto->fecha_creacion);
        $hora = $fecha_hora->format('H:i');
        $fecha = date_format($fecha_hora, 'd-m-Y');
        if($fecha_actual == $fecha) {
            $bandera1 = '1';
        } else {
            $bandera1 = '0';
        }
        $preguntas[] = array(
            'id'               => $objeto->id,
            'contenido'        => $objeto->contenido,
            'fecha_creacion'   => $objeto->fecha_creacion,
            'estado_respuesta' => $objeto->estado_respuesta,
            'fecha'            => $fecha,
            'hora'             => $hora,
            'hoy'              => $bandera1,
            'username'         => $objeto->username,
            'avatar'           => $objeto->avatar,
            'respuesta'        => $rpst
        );
    }
    $data = array(
        'bandera'       => $bandera,
        'avatar_sesion' => $avatar_sesion,
        'username'      => $username,
        'avatar'        => $avatar,
        'preguntas'     => $preguntas,
    );
    $jsonstring = json_encode($data);
    echo $jsonstring;
}
