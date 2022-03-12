<?php
include_once '../Util/Config/config.php';
include_once '../Models/Marca.php';
include_once '../Models/Historial.php';
require '../vendor/autoload.php';
$marca = new Marca();
$historial = new Historial();
session_start();
date_default_timezone_set('America/Argentina/Buenos_Aires');
$fecha_actual = date('d-m-Y');
if($_POST['funcion']=='read_all_marcas'){
    $marca->read_all_marcas();
    $json=array();
    foreach ($marca->objetos as $objeto) {
        $fecha_hora = date_create($objeto->fecha_creacion);
        $hora = $fecha_hora->format('H:i');
        $fecha = date_format($fecha_hora, 'd-m-Y');
        if($fecha_actual == $fecha) {
            $bandera = '1';
        } else {
            $bandera = '0';
        }
        $json[]=array(
            'id'             => openssl_encrypt($objeto->id, CODE, KEY),
            'nombre'         => $objeto->nombre,
            'descripcion'    => $objeto->descripcion,
            'imagen'         => $objeto->imagen,
            'fecha_creacion' => $objeto->fecha_creacion,
            'estado'         => $objeto->estado,
            'tipo_usuario'   => $_SESSION['tipo_usuario'],
            'fecha'          => $fecha,
            'hora'           => $hora,
            'hoy'            => $bandera,
        );
    }
    $jsonstring = json_encode($json);
    echo $jsonstring;
}
if($_POST['funcion']=='crear_marca'){
    $id_usuario    = $_SESSION['id'];
    $nombre        = $_POST['nombre'];
    $desc          = $_POST['desc'];
    $img           = $_FILES['imagen']['name'];
    //$ruta          = '../Util/Img/marca/'.$nombre_imagen;
    //move_uploaded_file($_FILES['imagen']['tmp_name'], $ruta);
    $nombre_img = uniqid().'-'.uniqid();
    $archivo = $nombre_img;
    $extension = pathinfo($img, PATHINFO_EXTENSION);
    $nombre_base = basename($archivo, '.'.$extension);
    $handle = new \Verot\Upload\Upload($_FILES['imagen']);
    if ($handle->uploaded) {
        $handle->file_new_name_body   = $nombre_base;
        $handle->image_resize         = true;
        $handle->image_x              = 200;
        $handle->image_y              = 200;
        $handle->process('../Util/Img/marca/');
        if ($handle->processed) {
            $handle->clean();
        } else {
            echo 'error : ' . $handle->error;
        }
    }
    $marca->crear($nombre, $desc, $nombre_img.'.'.$extension);
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
    $desc            = $_POST['desc_mod'];
    $img             = $_FILES['imagen_mod']['name'];
    $formateado      = str_replace(" ","+",$_POST['id_marca_mod']);
    $id_marca        = openssl_decrypt($formateado, CODE, KEY);
    $mensaje         = '';
    $nombre_imagen   = '';
    $datos_cambiados = 'ha echo los siguientes cambios: ';
    if(is_numeric($id_marca)) {
        $marca->obtener_marca($id_marca);
        if($nombre != $marca->objetos[0]->nombre || $desc != $marca->objetos[0]->descripcion || $img != '') {
            if($nombre != $marca->objetos[0]->nombre) {
                $datos_cambiados.= 'cambió su nombre de '.$marca->objetos[0]->nombre.' a '.$nombre.', ';
            }
            if($desc != $marca->objetos[0]->descripcion) {
                $datos_cambiados.= 'cambió su descripción de '.$marca->objetos[0]->descripcion.' a '.$desc.', ';
            }
            if($img != '') {
                $datos_cambiados.= 'Su imagen fué cambiada.';
                //$nombre_imagen = uniqid().'-'.$img;
                //$ruta          = '../Util/Img/marca/'.$nombre_imagen;
                //move_uploaded_file($_FILES['imagen_mod']['tmp_name'], $ruta);
                $nombre_img = uniqid().'-'.uniqid();
                $archivo = $nombre_img;
                $extension = pathinfo($img, PATHINFO_EXTENSION);
                $nombre_base = basename($archivo, '.'.$extension);
                $handle = new \Verot\Upload\Upload($_FILES['imagen_mod']);
                if ($handle->uploaded) {
                    $handle->file_new_name_body   = $nombre_base;
                    $handle->image_resize         = true;
                    $handle->image_x              = 200;
                    $handle->image_y              = 200;
                    $handle->process('../Util/Img/marca/');
                    if ($handle->processed) {
                        $handle->clean();
                    } else {
                        echo 'error : ' . $handle->error;
                    }
                }
                $avatar_actual = $marca->objetos[0]->imagen;
                if($avatar_actual != 'marca_default.png') {
                    unlink('../Util/Img/marca/'.$avatar_actual);
                }
            }
            $marca->editar($id_marca, $nombre, $desc, $nombre_img.'.'.$extension);
            $descripcion = 'Ha editado una marca, '.$datos_cambiados;
            $historial->crear_historial($descripcion, 1, 6, $id_usuario);
            $mensaje = 'success'; // se hicieron modificaciones y todo ok
        } else {
            $mensaje = 'danger'; // no ha modificado ningun dato del formulario
        }
        $json = array(
            'mensaje'      => $mensaje,
            'nombre_marca' => $nombre,
            'desc_marca'   => $desc,
            'img'          => $nombre_img.'.'.$extension
        );
        $jsonstring = json_encode($json);
        echo $jsonstring;
    } else {
        echo 'error'; // vulnero el sistema
    }
    
}
if($_POST['funcion']=='eliminar_marca'){
    $id_usuario = $_SESSION['id'];
    $nombre     = $_POST['nombre'];
    $formateado = str_replace(" ","+",$_POST['id']);
    $id_marca   = openssl_decrypt($formateado, CODE, KEY);
    if(is_numeric($id_marca)) {
        $marca->eliminar_marca($id_marca);
        $descripcion = 'Ha eliminado una marca, '.$nombre;
        $historial->crear_historial($descripcion, 3, 6, $id_usuario);
        $mensaje = 'success'; // se hicieron modificaciones y todo ok
        $json = array(
            'mensaje' => $mensaje
        );
        $jsonstring = json_encode($json);
        echo $jsonstring;
    } else {
        echo 'error';
    }
}