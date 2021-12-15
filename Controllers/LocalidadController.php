<?php
include_once '../Models/Localidad.php';
include_once '../Util/Config/config.php';
$localidad = new Localidad();
session_start();
if($_POST['funcion']=='llenar_localidad'){
    $formateado = str_replace(" ","+",$_POST['id_provincia']);
    $id_provincia = openssl_decrypt($formateado, CODE, KEY);
    $localidad->llenar_localidad($id_provincia);
    $json = array();
    //var_dump($usuario); para ver datos
    foreach ($localidad->objetos as $objeto) {
        $json[] = array(
            'id'     => openssl_encrypt($objeto->id, CODE, KEY),
            'nombre' => $objeto->nombre
        );
    }
    //se debe codificar a un string el json
    $jsonstring = json_encode($json);//se pone Sjson[0] porque solo traemos 1 registro
    echo $jsonstring;
}