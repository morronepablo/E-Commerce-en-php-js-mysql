<?php
include_once '../Models/ProductoTienda.php';
include_once '../Util/Config/config.php';
include_once '../Models/Pregunta.php';
include_once '../Models/Notificacion.php';
include_once '../Models/Historial.php';
$producto_tienda = new ProductoTienda();
$pregunta        = new Pregunta();
$notificacion    = new Notificacion();
$historial       = new Historial();
session_start();

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
