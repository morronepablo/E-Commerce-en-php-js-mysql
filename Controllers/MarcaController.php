<?php
include_once '../Util/Config/config.php';
include_once '../Models/Marca.php';
include_once '../Models/Historial.php';
$marca = new Marca();
$historial = new Historial();
session_start();
date_default_timezone_set('America/Argentina/Buenos_Aires');
$fecha_actual = date('d-m-Y');
if($_POST['funcion']=='read_all_marcas'){
    $marca->read_all_marcas();
    $json=array();
    foreach ($marca->objetos as $objeto) {
        $json[]=array(
            'id'             => openssl_encrypt($objeto->id, CODE, KEY),
            'nombre'         => $objeto->nombre,
            'imagen'         => $objeto->imagen,
            'fecha_creacion' => $objeto->fecha_creacion,
            'estado'         => $objeto->estado,
        );
    }
    $jsonstring = json_encode($json);
    echo $jsonstring;
}
if($_POST['funcion']=='crear_marca'){
    $id_usuario    = $_SESSION['id'];
    $nombre        = $_POST['nombre'];
    $img           = $_FILES['imagen']['name'];
    $nombre_imagen = uniqid().'-'.$img;
    $ruta          = '../Util/Img/marca/'.$nombre_imagen;
    move_uploaded_file($_FILES['imagen']['tmp_name'], $ruta);
    $marca->crear($nombre, $nombre_imagen);
    $descripcion = 'Ha creado la marca, '.$nombre;
    $historial->crear_historial($descripcion, 2, 6, $id_usuario);
    $mensaje = 'success';
    $json = array(
        'mensaje' => $mensaje
    );
    $jsonstring = json_encode($json);
    echo $jsonstring;
}