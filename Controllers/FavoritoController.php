<?php
include_once $_SERVER["DOCUMENT_ROOT"].'/commerce/Models/ProductoTienda.php';
include_once $_SERVER["DOCUMENT_ROOT"].'/commerce/Util/Config/config.php';
include_once $_SERVER["DOCUMENT_ROOT"].'/commerce/Models/Favorito.php';
include_once $_SERVER["DOCUMENT_ROOT"].'/commerce/Models/Historial.php';
$producto_tienda = new ProductoTienda();
$favorito = new Favorito();
$historial = new Historial();
session_start();

if($_POST['funcion']=='cambiar_estado_favorito'){
    $id_favorito_encrypted = $_POST['id_favorito'];
    $formateado            = str_replace(" ","+", $id_favorito_encrypted);
    $id_favorito           = openssl_decrypt($formateado, CODE, KEY);
    $formateado            = str_replace(" ","+",$_SESSION['product-verification']);
    $id_producto_tienda    = openssl_decrypt($formateado, CODE, KEY);
    $estado_favorito       = $_POST['estado_favorito'];
    $id_usuario            = $_SESSION['id'];
    $mensaje               = '';
    if($id_favorito_encrypted != '') {
        if(is_numeric($id_favorito)) {
            if(is_numeric($id_producto_tienda)) {
                $producto_tienda->llenar_productos($id_producto_tienda);
                $titulo = $producto_tienda->objetos[0]->producto;
                $url    = 'Views/descripcion.php?name='.$titulo.'&&id='.$formateado;
                $favorito->read_favorito_usuario_protienda($id_usuario, $id_producto_tienda);
                $estado_favorito = $favorito->objetos[0]->estado;   
                if($estado_favorito == 'A') {
                    // Actualizar el estado de Activo a Inactivo de favorito
                    $favorito->update_remove($id_favorito);
                    $descripcion = 'Se removió de favoritos el producto: '.$titulo;
                    $historial->crear_historial($descripcion, 3, 5, $id_usuario);
                    $mensaje = 'remove';
                } else {
                    // Actualizar el estado de Inactivo a Activo de favorito
                    $favorito->update_add($id_usuario, $id_producto_tienda, $id_favorito, $url);
                    $descripcion = 'Se agregó a favoritos el producto: '.$titulo;
                    $historial->crear_historial($descripcion, 2, 5, $id_usuario);
                    $mensaje = 'add';
                }
            } else {
                // error al eliminar
                $mensaje = 'error al eliminar';
            }
        } else {
            // error al eliminar
            $mensaje = 'error al eliminar';
        }
    } else {
        // Creamos nuevo registro
        // Verificar que el usuario no borre el id_favorito para hacer que se cree un nuevo registro
        // volver a consultar con el id_usuario y el id_producto_tienda para verificar si es que existe un registro
        if(is_numeric($id_producto_tienda)) {
            $favorito->read_favorito_usuario_protienda($id_usuario, $id_producto_tienda);
            $id_favorito = '';
            $estado_favorito = '';
            if(count($favorito->objetos) > 0) {
                $id_favorito = $favorito->objetos[0]->id;
                $estado_favorito = $favorito->objetos[0]->estado;
            }
            $producto_tienda->llenar_productos($id_producto_tienda);
            $titulo = $producto_tienda->objetos[0]->producto;
            $url    = 'Views/descripcion.php?name='.$titulo.'&&id='.$formateado;
            if($estado_favorito == 'A') {
                // Actualizar el estado de Activo a Inactivo de favorito
                $favorito->update_remove($id_favorito);
                $descripcion = 'Se removió de favoritos el producto: '.$titulo;
                $historial->crear_historial($descripcion, 3, 5, $id_usuario);
                $mensaje = 'remove';
            } else {
                // Actualizar el estado de Inactivo a Activo de favorito
                $favorito->update_add($id_usuario, $id_producto_tienda, $id_favorito, $url);
                $descripcion = 'Se agregó a favoritos el producto: '.$titulo;
                $historial->crear_historial($descripcion, 2, 5, $id_usuario);
                $mensaje = 'add';
            }
        } else {
            // error al eliminar
            $mensaje = 'error al eliminar';
        }
    }
    $json = array(
        'mensaje' => $mensaje
    );
    $jsonstring = json_encode($json);
    echo $jsonstring;
}
if($_POST['funcion']=='read_favoritos'){
    if(!empty($_SESSION['id'])) {
        $id_usuario = $_SESSION['id'];
        $favorito->read($id_usuario);
        $json = array();
        foreach ($favorito->objetos as $objeto) {
            $fecha_hora = date_create($objeto->fecha_creacion);
            $hora = $fecha_hora->format('H:i');
            $fecha = date_format($fecha_hora, 'd-m-Y');
            $json[] = array(
                'id'             => openssl_encrypt($objeto->id, CODE, KEY),
                'titulo'         => $objeto->titulo,
                'precio'         => $objeto->precio,
                'imagen'         => $objeto->imagen,
                'url'            => $objeto->url,
                'fecha'          => $fecha,
                'hora'           => $hora,
                'fecha_creacion' => $objeto->fecha_creacion
            );
        }
        $jsonstring = json_encode($json);
        echo $jsonstring;
    } else {
        echo 'error, el usuario no está en sesión';
    }
}
if($_POST['funcion']=='read_all_favoritos'){
    if(!empty($_SESSION['id'])) {
        $id_usuario = $_SESSION['id'];
        $favorito->read_all_favoritos($id_usuario);
        $json = array();
        foreach ($favorito->objetos as $objeto) {
            $fecha_hora = date_create($objeto->fecha_creacion);
            $hora = $fecha_hora->format('H:i');
            $fecha = date_format($fecha_hora, 'd-m-Y');
            $json[] = array(
                'id'             => openssl_encrypt($objeto->id, CODE, KEY),
                'titulo'         => $objeto->titulo,
                'precio'         => $objeto->precio,
                'imagen'         => $objeto->imagen,
                'url'            => $objeto->url,
                'fecha'          => $fecha,
                'hora'           => $hora,
                'fecha_creacion' => $objeto->fecha_creacion
            );
        }
        $jsonstring = json_encode($json);
        echo $jsonstring;
    } else {
        echo 'error, el usuario no está en sesión';
    }
}
if($_POST['funcion']=='eliminar_favorito'){
    if(!empty($_SESSION['id'])) {
        $id_usuario            = $_SESSION['id'];
        $id_favorito_encrypted = $_POST['id_favorito'];
        $formateado            = str_replace(" ","+", $id_favorito_encrypted);
        $id_favorito           = openssl_decrypt($formateado, CODE, KEY);
        $formateado            = str_replace(" ","+",$_SESSION['product-verification']);
        $id_producto_tienda    = openssl_decrypt($formateado, CODE, KEY);
        $mensaje = '';
        if(is_numeric($id_favorito)) {
            $favorito->update_remove($id_favorito);
            $producto_tienda->llenar_productos($id_producto_tienda);
            $titulo = $producto_tienda->objetos[0]->producto;
            $descripcion = 'Se removió de favoritos el producto: '.$titulo;
            $historial->crear_historial($descripcion, 3, 5, $id_usuario);
            $mensaje = 'favorito eliminado';
        } else {
            $mensaje = 'error al eliminar';
        }
        $json = array(
            'mensaje' => $mensaje,
        );
        $jsonstring = json_encode($json);
        echo $jsonstring;
    } else {
        echo 'error, el usuario no está en sesión';
    }
}
if($_POST['funcion']=='mostrar_titulo_favorito'){
    if(!empty($_SESSION['id'])) {
        $id_usuario         = $_SESSION['id'];
        $formateado         = str_replace(" ","+",$_SESSION['product-verification']);
        $id_producto_tienda = openssl_decrypt($formateado, CODE, KEY);
        $producto_tienda->llenar_productos($id_producto_tienda);
        $producto = $producto_tienda->objetos[0]->producto;
        $favorito->read_favorito_usuario_protienda($id_usuario, $id_producto_tienda);
        $id_favorito = '';
        $estado_favorito = '';
        if(count($favorito->objetos) > 0) {
            $id_favorito = openssl_encrypt($favorito->objetos[0]->id, CODE, KEY);
            $estado_favorito = $favorito->objetos[0]->estado;
        }
        $json = array(
            'usuario_sesion'  => $id_usuario,
            'estado_favorito' => $estado_favorito,
            'producto'        => $producto,
            'id_favorito'     => $id_favorito
        );
        $jsonstring = json_encode($json);
        echo $jsonstring;
    } else {
        $id_usuario = '';
        $formateado         = str_replace(" ","+",$_SESSION['product-verification']);
        $id_producto_tienda = openssl_decrypt($formateado, CODE, KEY);
        $producto_tienda->llenar_productos($id_producto_tienda);
        $producto = $producto_tienda->objetos[0]->producto;
        $json = array(
            'usuario_sesion'  => $id_usuario,
            'producto'        => $producto
        );
        $jsonstring = json_encode($json);
        echo $jsonstring;
    }
}