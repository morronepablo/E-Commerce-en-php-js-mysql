<?php
include_once $_SERVER["DOCUMENT_ROOT"].'/commerce/Models/Producto.php';
include_once $_SERVER["DOCUMENT_ROOT"].'/commerce/Models/Historial.php';
include_once $_SERVER["DOCUMENT_ROOT"].'/commerce/Util/Config/config.php';
$producto = new Producto();
$historial = new Historial();
session_start();
if($_POST['funcion']=='read_all_productos') {
    $producto->read_all_productos();
    // var_dump($producto->objetos); //para ver datos
    foreach ($producto->objetos as $objeto) {
        $json[] = array(
            'id'                => openssl_encrypt($objeto->id, CODE, KEY),
            'nombre'            => $objeto->nombre,
            'nombre_corto'      => $objeto->nombre_corto,
            'sku'               => $objeto->sku,
            'detalles'          => $objeto->detalles,
            'imagen_principal'  => $objeto->imagen_principal,
            'fecha_creacion'    => $objeto->fecha_creacion,
            'fecha_edicion'     => $objeto->fecha_edicion,
            'marca'             => $objeto->marca,
            'imagen_marca'      => $objeto->imagen,
            'tipo_usuario'      => $_SESSION['tipo_usuario']
        );
    }
    //se debe codificar a un string el json
    $jsonstring = json_encode($json);//se pone Sjson[0] porque solo traemos 1 registro
    echo $jsonstring;
}
if($_POST['funcion']=='editar_producto') {
    $id_usuario     = $_SESSION['id'];
    $formateado     = str_replace(" ","+",$_POST['id_producto_mod']);
    $id_producto    = openssl_decrypt($formateado, CODE, KEY);
    $nombre         = $_POST['nombre_mod'];
    $nombre_oculto  = $_POST['nombre_mod_oculto'];
    $nombre_corto   = $_POST['nombre_corto_mod'];
    $sku            = $_POST['sku_mod'];
    $detalles       = $_POST['detalles_mod'];
    $img            = $_FILES['imagen_mod']['name'];
    $mensaje        = '';
    $datos_cambiados= 'Ha hecho los siguientes cambios: ';
    $nombre_imagen  = '';
    if(is_numeric($id_producto)) {
        $producto->buscar_menos_id($nombre, $id_producto);
        if(empty($producto->objetos)) {
            $producto->obtener_producto($id_producto);
            if($nombre != $producto->objetos[0]->nombre || $nombre_corto != $producto->objetos[0]->nombre_corto || $img != ''
                || $sku != $producto->objetos[0]->sku || $detalles != $producto->objetos[0]->detalles) {
                if($nombre != $producto->objetos[0]->nombre) {
                    $datos_cambiados.= 'cambió su nombre de '.$producto->objetos[0]->nombre.' a '.$nombre.', ';
                }
                if($nombre_corto != $producto->objetos[0]->nombre_corto) {
                    $datos_cambiados.= 'cambió su nombre corto de '.$producto->objetos[0]->nombre_corto.' a '.$nombre_corto.', ';
                }
                if($sku != $producto->objetos[0]->sku) {
                    $datos_cambiados.= 'cambió su SKU de '.$producto->objetos[0]->sku.' a '.$sku.', ';
                }
                if($detalles != $producto->objetos[0]->detalles) {
                    $datos_cambiados.= 'cambió su detalles de '.$producto->objetos[0]->detalles.' a '.$detalles.', ';
                }
                if($img != '') {
                    $datos_cambiados.='su imagen fue cambiada';
                    $nombre_imagen = uniqid().'-'.$img;
                    $ruta = $_SERVER["DOCUMENT_ROOT"].'/commerce/Util/Img/producto/'.$nombre_imagen;
                    move_uploaded_file($_FILES['imagen_mod']['tmp_name'], $ruta);
                    $avatar_actual = $producto->objetos[0]->imagen_principal;
                    if($avatar_actual != 'producto_default.png') {
                        unlink($_SERVER["DOCUMENT_ROOT"].'/commerce/Util/Img/producto/'.$avatar_actual);
                    }
                }
                $producto->editar($id_producto, $nombre, $nombre_corto, $sku, $detalles, $nombre_imagen);
                $descripcion = 'Ha editado un producto, '.$datos_cambiados;
                $historial->crear_historial($descripcion, 1, 3, $id_usuario);
                $mensaje = 'success';
            } else {
                $mensaje = 'danger';
            }
            $nombre_oculto = $nombre_corto;
        } else {
            $mensaje = 'error_producto';
        }
        $json = array(
            'mensaje'           => $mensaje,
            'nombre_producto'   => $nombre_oculto,
            'img'               => $nombre_imagen
        );
        $jsonstring = json_encode($json);
        echo $jsonstring;
    } else {
        echo 'error';
    }
}

?>