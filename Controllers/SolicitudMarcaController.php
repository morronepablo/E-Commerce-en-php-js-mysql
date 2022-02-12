<?php
include_once '../Util/Config/config.php';
include_once '../Models/Marca.php';
include_once '../Models/SolicitudMarca.php';
include_once '../Models/Historial.php';
$marca = new Marca();
$solicitud_marca = new SolicitudMarca();
$historial = new Historial();
session_start();
date_default_timezone_set('America/Argentina/Buenos_Aires');
$fecha_actual = date('d-m-Y');
if($_POST['funcion']=='crear_solicitud_marca'){
    $id_usuario = $_SESSION['id'];
    $nombre     = $_POST['nombre_sol'];
    $desc       = $_POST['desc_sol'];
    $img        = $_FILES['imagen_sol']['name'];
    $marca->buscar($nombre);
    if(empty($marca->objetos)) {
        $solicitud_marca->buscar($nombre);
        if(empty($solicitud_marca->objetos)) {
            /* Creación de solicitud marca */
            $nombre_imagen = uniqid().'-'.$img;
            $ruta          = '../Util/Img/marca/'.$nombre_imagen;
            move_uploaded_file($_FILES['imagen_sol']['tmp_name'], $ruta);
            $solicitud_marca->crear($nombre, $desc, $nombre_imagen, $id_usuario);
            $descripcion = 'Ha creado una solicitud marca, '.$nombre;
            $historial->crear_historial($descripcion, 2, 6, $id_usuario);
            $mensaje = 'success';
            $json = array(
                'mensaje' => $mensaje
            );
            $jsonstring = json_encode($json);
            echo $jsonstring;
        } else {
            echo 'error_marca';
        }
    } else {
        echo 'error_marca';
    }
}
if($_POST['funcion']=='read_tus_solicitudes'){
    $id_usuario = $_SESSION['id'];
    $solicitud_marca->read_tus_solicitudes($id_usuario);
    var_dump($solicitud_marca);
    /* $json=array();
    foreach ($marca->objetos as $objeto) {
        $json[]=array(
            'id'             => openssl_encrypt($objeto->id, CODE, KEY),
            'nombre'         => $objeto->nombre,
            'descripcion'    => $objeto->descripcion,
            'imagen'         => $objeto->imagen,
            'fecha_creacion' => $objeto->fecha_creacion,
            'estado'         => $objeto->estado,
            'tipo_usuario'   => $_SESSION['tipo_usuario']
        );
    }
    $jsonstring = json_encode($json);
    echo $jsonstring; */
}
