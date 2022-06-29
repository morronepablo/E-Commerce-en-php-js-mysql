<?php
include_once $_SERVER["DOCUMENT_ROOT"].'/commerce/Models/UsuarioLocalidad.php';
include_once $_SERVER["DOCUMENT_ROOT"].'/commerce/Models/Historial.php';
include_once $_SERVER["DOCUMENT_ROOT"].'/commerce/Util/Config/config.php';
$usuario_localidad = new UsuarioLocalidad();
$historial = new Historial();
session_start();
if($_POST['funcion']=='crear_direccion'){
    $id_usuario = $_SESSION['id'];
    $formateado = str_replace(" ","+",$_POST['id_localidad']);
    $id_localidad = openssl_decrypt($formateado, CODE, KEY);
    $direccion = $_POST['direccion'];
    $referencia = $_POST['referencia'];
    $mensaje = '';
    if(is_numeric($id_localidad)) {
        $usuario_localidad->crear_direccion($id_usuario, $id_localidad, $direccion, $referencia);
        $descripcion = 'Ha creado una nueva dirección: '.$direccion;
        $historial->crear_historial($descripcion, 2, 1, $id_usuario);
        $mensaje = 'success';
    } else {
        $mensaje = 'error';
    }
    $json = array(
        'mensaje' => $mensaje
    );
    $jsonstring = json_encode($json);
    echo $jsonstring;
    
}
if($_POST['funcion']=='llenar_direcciones'){
    $id_usuario = $_SESSION['id'];
    $usuario_localidad->llenar_direcciones( $id_usuario);
    $json = array();
    foreach ($usuario_localidad->objetos as $objeto) {
        $json[] = array(
            'id'         =>openssl_encrypt($objeto->id,CODE,KEY),
            'direccion'  =>$objeto->direccion,
            'referencia' =>$objeto->referencia,
            'provincia'  =>$objeto->provincias,
            'localidad'  =>$objeto->localidades,
        );
    }
    $jsonstring = json_encode($json);
    echo $jsonstring;
}
if($_POST['funcion']=='eliminar_direccion'){
    $formateado = str_replace(" ","+",$_POST['id']);
    $id_direccion = openssl_decrypt($formateado, CODE, KEY);
    $mensaje = '';
    if(is_numeric($id_direccion)) {
        $usuario_localidad->recuperar_direccion($id_direccion);
        $direccion_borrada = $usuario_localidad->objetos[0]->direccion.', Localidad: '.$usuario_localidad->objetos[0]->localidades.', Provincia: '.$usuario_localidad->objetos[0]->provincias;
        $usuario_localidad->eliminar_direccion($id_direccion);
        $descripcion = 'Ha eliminado la direccion: '.$direccion_borrada;
        $historial->crear_historial($descripcion, 3, 1, $_SESSION['id']);
        $mensaje = 'success';
    } else {
        $mensaje = 'error';
    }
    $json = array(
        'mensaje' => $mensaje
    );
    $jsonstring = json_encode($json);
    echo $jsonstring;
}