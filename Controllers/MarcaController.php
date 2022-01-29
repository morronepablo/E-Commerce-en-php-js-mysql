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
if($_POST['funcion']=='editar_marca'){
    $id_usuario      = $_SESSION['id'];
    $nombre          = $_POST['nombre_mod'];
    $img             = $_FILES['imagen_mod']['name'];
    $formateado      = str_replace(" ","+",$_POST['id_marca_mod']);
    $id_marca        = openssl_decrypt($formateado, CODE, KEY);
    $mensaje         = '';
    $nombre_imagen   = '';
    $datos_cambiados = 'ha echo los siguientes cambios: ';
    if(is_numeric($id_marca)) {
        $marca->obtener_marca($id_marca);
        if($nombre != $marca->objetos[0]->nombre || $img != '') {
            if($nombre != $marca->objetos[0]->nombre) {
                $datos_cambiados.= 'Una marca cambió su nombre de '.$marca->objetos[0]->nombre.' a '.$nombre.', ';
            }
            if($img != '') {
                $datos_cambiados.= 'Su imagen fué cambiada.';
                $nombre_imagen = uniqid().'-'.$img;
                $ruta          = '../Util/Img/marca/'.$nombre_imagen;
                move_uploaded_file($_FILES['imagen_mod']['tmp_name'], $ruta);
                $avatar_actual = $marca->objetos[0]->imagen;
                if($avatar_actual != 'marca_default.png') {
                    unlink('../Util/Img/marca/'.$avatar_actual);
                }
            }
            $marca->editar($id_marca, $nombre, $nombre_imagen);
            $descripcion = 'Ha editado una marca, '.$datos_cambiados;
            $historial->crear_historial($descripcion, 1, 6, $id_usuario);
            $mensaje = 'success'; // se hicieron modificaciones y todo ok
        } else {
            $mensaje = 'danger'; // no ha modificado ningun dato del formulario
        }
        $json = array(
            'mensaje' => $mensaje,
            'nombre_marca' => $nombre,
            'img' => $nombre_imagen
        );
        $jsonstring = json_encode($json);
        echo $jsonstring;
    } else {
        echo 'error'; // vulnero el sistema
    }
    
}