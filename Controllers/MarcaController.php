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