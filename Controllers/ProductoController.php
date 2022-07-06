<?php
include_once $_SERVER["DOCUMENT_ROOT"].'/commerce/Models/Producto.php';
include_once $_SERVER["DOCUMENT_ROOT"].'/commerce/Util/Config/config.php';
$producto = new Producto();
session_start();
if($_POST['funcion']=='read_all_productos'){
    $producto->read_all_productos();
    // var_dump($producto->objetos); //para ver datos
    foreach ($producto->objetos as $objeto) {
        $json[] = array(
            'id'     => openssl_encrypt($objeto->id, CODE, KEY),
            'nombre' => $objeto->nombre,
            'nombre_corto' => $objeto->nombre_corto,
            'sku' => $objeto->sku,
            'detalles' => $objeto->detalles,
            'imagen_principal' => $objeto->imagen_principal,
            'fecha_creacion' => $objeto->fecha_creacion,
            'fecha_edicion' => $objeto->fecha_edicion,
            'marca' => $objeto->marca,
            'imagen_marca' => $objeto->imagen,
            'tipo_usuario' => $_SESSION['tipo_usuario']
        );
    }
    //se debe codificar a un string el json
    $jsonstring = json_encode($json);//se pone Sjson[0] porque solo traemos 1 registro
    echo $jsonstring;
}

?>