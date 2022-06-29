<?php
include_once $_SERVER["DOCUMENT_ROOT"].'/commerce/Models/Provincia.php';
include_once $_SERVER["DOCUMENT_ROOT"].'/commerce/Util/Config/config.php';
$provincia = new Provincia();
session_start();
if($_POST['funcion']=='llenar_provincias'){
    $provincia->llenar_provincias();
    //var_dump($usuario); para ver datos
    foreach ($provincia->objetos as $objeto) {
        $json[] = array(
            'id'     => openssl_encrypt($objeto->id, CODE, KEY),
            'nombre' => $objeto->nombre
        );
    }
    //se debe codificar a un string el json
    $jsonstring = json_encode($json);//se pone Sjson[0] porque solo traemos 1 registro
    echo $jsonstring;
}

?>