<?php

include_once '../Models/Localidad.php';
$localidad = new Localidad();
session_start();
if($_POST['funcion']=='llenar_localidad'){
    $id_provincia = $_POST['id_provincia'];
    $localidad->llenar_localidad($id_provincia);
    $json = array();
    //var_dump($usuario); para ver datos
    foreach ($localidad->objetos as $objeto) {
        $json[] = array(
            'id' => $objeto->id,
            'nombre' => $objeto->nombre
        );
    }
    //se debe codificar a un string el json
    $jsonstring = json_encode($json);//se pone Sjson[0] porque solo traemos 1 registro
    echo $jsonstring;
}