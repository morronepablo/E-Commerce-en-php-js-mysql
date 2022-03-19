<?php
include_once '../Util/Config/config.php';
include_once '../Models/Marca.php';
include_once '../Models/SolicitudMarca.php';
include_once '../Models/Historial.php';
include_once '../Models/Usuario.php';
include_once '../Models/Mensaje.php';
include_once '../Models/Destino.php';
require '../vendor/autoload.php';
$marca = new Marca();
$solicitud_marca = new SolicitudMarca();
$historial = new Historial();
$usuario = new Usuario();
$mensaje = new Mensaje();
$destino = new Destino();
session_start();
date_default_timezone_set('America/Argentina/Buenos_Aires');
$fecha_actual = date('d-m-Y');
if($_POST['funcion']=='crear_solicitud_marca'){
    $id_usuario = $_SESSION['id'];
    $nombre     = $_POST['nombre_sol'];
    $desc       = $_POST['desc_sol'];
    $img        = $_FILES['imagen_sol']['name'];
    $marca->buscar($nombre);
    if(empty($marca->objetos)) {
        $solicitud_marca->buscar($nombre);
        if(empty($solicitud_marca->objetos)) {
            /* Creación de solicitud marca */
            //$nombre_imagen = uniqid().'-'.$img;
            //$ruta          = '../Util/Img/marca/'.$nombre_imagen;
            //move_uploaded_file($_FILES['imagen_sol']['tmp_name'], $ruta);
            $nombre_img = uniqid().'-'.uniqid();
            $archivo = $nombre_img;
            $extension = pathinfo($img, PATHINFO_EXTENSION);
            $nombre_base = basename($archivo, '.'.$extension);
            $handle = new \Verot\Upload\Upload($_FILES['imagen_sol']);
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
            $solicitud_marca->crear($nombre, $desc, $nombre_img.'.'.$extension, $id_usuario);
            $descripcion = 'Ha creado una solicitud marca, '.$nombre;
            $historial->crear_historial($descripcion, 2, 6, $id_usuario);
            $mensaje = 'success';
            $json = array(
                'mensaje' => $mensaje
            );
            $jsonstring = json_encode($json);
            echo $jsonstring;
        } else {
            echo 'error_sol';
        }
    } else {
        echo 'error_marca';
    }
}
if($_POST['funcion']=='read_tus_solicitudes'){
    $id_usuario = $_SESSION['id'];
    $solicitud_marca->read_tus_solicitudes($id_usuario);
    //var_dump($solicitud_marca);
    $json=array();
    foreach ($solicitud_marca->objetos as $objeto) {
        $fecha_hora = date_create($objeto->fecha_creacion);
        $hora = $fecha_hora->format('H:i');
        $fecha = date_format($fecha_hora, 'd-m-Y');
        if($fecha_actual == $fecha) {
            $bandera = '1';
        } else {
            $bandera = '0';
        }
        if(!empty($objeto->aprobado_por)) {
            $usuario->obtener_datos($objeto->aprobado_por);
            $aprobado_por = $usuario->objetos[0]->nombres.' '.$usuario->objetos[0]->apellidos;
        } else {
            $aprobado_por = '';
        }
        $json[]=array(
            'id'              => openssl_encrypt($objeto->id, CODE, KEY),
            'nombre'          => $objeto->nombre,
            'descripcion'     => $objeto->descripcion,
            'imagen'          => $objeto->imagen,
            'fecha_creacion'  => $objeto->fecha_creacion,
            'estado'          => $objeto->estado,
            'estado_envio'    => $objeto->estado_solicitud,
            'estado_aprobado' => $aprobado_por,
            'observacion'     => $objeto->observacion,
            'tipo_usuario'    => $_SESSION['tipo_usuario'],
            'fecha'          => $fecha,
            'hora'           => $hora,
            'hoy'            => $bandera,
        );
    }
    $jsonstring = json_encode($json);
    echo $jsonstring;
}
if($_POST['funcion']=='editar_solicitud'){
    $id_usuario      = $_SESSION['id'];
    $nombre          = $_POST['nombre_mod_sol'];
    $desc            = $_POST['desc_mod_sol'];
    $img             = $_FILES['imagen_mod_sol']['name'];
    $formateado      = str_replace(" ","+",$_POST['id_marca_mod_sol']);
    $id_solicitud    = openssl_decrypt($formateado, CODE, KEY);
    $mensaje         = '';
    $nombre_imagen   = '';
    $datos_cambiados = 'ha echo los siguientes cambios: ';
    if(is_numeric($id_solicitud)) {
        $solicitud_marca->obtener_solicitud($id_solicitud);
        if($nombre != $solicitud_marca->objetos[0]->nombre || $desc != $solicitud_marca->objetos[0]->descripcion || $img != '') {
            if($nombre != $solicitud_marca->objetos[0]->nombre) {
                $datos_cambiados.= 'cambió su nombre de '.$solicitud_marca->objetos[0]->nombre.' a '.$nombre.', ';
            }
            if($desc != $solicitud_marca->objetos[0]->descripcion) {
                $datos_cambiados.= 'cambió su descripción de '.$solicitud_marca->objetos[0]->descripcion.' a '.$desc.', ';
            }
            if($img != '') {
                $datos_cambiados.= 'Su imagen fué cambiada.';
                //$nombre_imagen = uniqid().'-'.$img;
                //$ruta          = '../Util/Img/marca/'.$nombre_imagen;
                //move_uploaded_file($_FILES['imagen_mod_sol']['tmp_name'], $ruta);
                $nombre_img = uniqid().'-'.uniqid();
                $archivo = $nombre_img;
                $extension = pathinfo($img, PATHINFO_EXTENSION);
                $nombre_imagen = $nombre_img.'.'.$extension;
                $nombre_base = basename($archivo, '.'.$extension);
                $handle = new \Verot\Upload\Upload($_FILES['imagen_mod_sol']);
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
                $avatar_actual = $solicitud_marca->objetos[0]->imagen;
                if($avatar_actual != 'marca_default.png') {
                    unlink('../Util/Img/marca/'.$avatar_actual);
                }
            }
            $solicitud_marca->editar($id_solicitud, $nombre, $desc, $nombre_imagen);
            $descripcion = 'Ha editado una solicitud marca, '.$datos_cambiados;
            $historial->crear_historial($descripcion, 1, 6, $id_usuario);
            $mensaje = 'success'; // se hicieron modificaciones y todo ok
        } else {
            $mensaje = 'danger'; // no ha modificado ningun dato del formulario
        }
        $json = array(
            'mensaje'    => $mensaje,
            'nombre_sol' => $nombre,
            'desc_sol'   => $desc,
            'img_sol'    => $nombre_imagen
        );
        $jsonstring = json_encode($json);
        echo $jsonstring;
    } else {
        echo 'error'; // vulnero el sistema
    }
}
if($_POST['funcion']=='eliminar_solicitud'){
    $id_usuario = $_SESSION['id'];
    $nombre     = $_POST['nombre'];
    $formateado = str_replace(" ","+",$_POST['id']);
    $id_solicitud   = openssl_decrypt($formateado, CODE, KEY);
    if(is_numeric($id_solicitud)) {
        $solicitud_marca->eliminar_solicitud($id_solicitud);
        $descripcion = 'Ha eliminado una solicitud marca, '.$nombre;
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
if($_POST['funcion']=='enviar_solicitud'){
    $id_usuario = $_SESSION['id'];
    $nombre     = $_POST['nombre'];
    $formateado = str_replace(" ","+",$_POST['id']);
    $id_solicitud   = openssl_decrypt($formateado, CODE, KEY);
    if(is_numeric($id_solicitud)) {
        $solicitud_marca->enviar_solicitud($id_solicitud);
        /* Envio de mensajes */
        // Buscar los destinatarios
        $usuario->buscar_administradores_root();
        if(!empty($usuario->objetos)) {
            $mensaje->crear($id_usuario);
            $mensaje->ultimo_mensaje();
            $id_mensaje = $mensaje->objetos[0]->ultimo_mensaje;
            foreach ($usuario->objetos as $objeto) {
                if($objeto->id_tipo == '1') {
                    // mensaje root
                    $asunto = "Usuario root tiene usted una solicitud marca para revisar";
                    $contenido = "Hola usuario root ".$objeto->nombres." por favor revise mi solicitud marca si es que todo esta correcto apruebela, si no me indica los errores para corregirla";
                    $destino->crear($asunto,$contenido,$objeto->id,$id_mensaje);
                } elseif($objeto->id_tipo == '2') {
                    // mensajes administradores
                    $asunto = "Usuario administrador tiene usted una solicitud marca para revisar";
                    $contenido = "Hola usuario administrador ".$objeto->nombres." por favor revise mi solicitud marca si es que todo esta correcto apruebela, si no me indica los errores para corregirla";
                    $destino->crear($asunto,$contenido,$objeto->id,$id_mensaje);
                }
            }
        } else {
            echo 'error_usuarios'; // no hay a quien enviarles mensajes
        }
        
        $descripcion = 'Ha enviado una solicitud marca, '.$nombre;
        $historial->crear_historial($descripcion, 1, 6, $id_usuario);
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
if($_POST['funcion']=='read_solicitudes_por_aprobar'){
    $id_usuario = $_SESSION['id'];
    $solicitud_marca->solicitudes_por_aprobar();
    //var_dump($solicitud_marca);
    $json=array();
    foreach ($solicitud_marca->objetos as $objeto) {
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
            'solicitante'    => $objeto->nombres.' '.$objeto->apellidos,
            'tipo_usuario'   => $_SESSION['tipo_usuario'],
            'fecha'          => $fecha,
            'hora'           => $hora,
            'hoy'            => $bandera,
        );
    }
    $jsonstring = json_encode($json);
    echo $jsonstring;
}
if($_POST['funcion']=='aprobar_solicitud'){
    $id_usuario = $_SESSION['id'];
    $nombre     = $_POST['nombre'];
    $formateado = str_replace(" ","+",$_POST['id']);
    $id_solicitud   = openssl_decrypt($formateado, CODE, KEY);
    if(is_numeric($id_solicitud)) {
        $marca->buscar($nombre);
        if(empty($marca->objetos)) {
            // Se aprueba la solicitud
            $solicitud_marca->aprobar_solicitud($id_solicitud, $id_usuario);
            // Se crea la marca
            $solicitud_marca->obtener_solicitud($id_solicitud);
            $desc   = $solicitud_marca->objetos[0]->descripcion;
            $imagen = $solicitud_marca->objetos[0]->imagen;
            $marca->crear($nombre, $desc, $imagen);
            $descripcion = 'Ha aprobado una solicitud marca, '.$nombre;
            $historial->crear_historial($descripcion, 1, 6, $id_usuario);
            $mensaje = 'success'; // se hicieron modificaciones y todo ok
        } else {
            // La marca ya existe y no se puede crear
            // Rechazar la solicitud marca
            $observacion = "No se aproba la solicitud ya que existe una marca con el mismo nombre ".$nombre;
            $solicitud_marca->rechazar_solicitud($id_solicitud, $id_usuario, $observacion);
            $descripcion = 'Ha rechazado una solicitud marca, '.$nombre;
            $historial->crear_historial($descripcion, 1, 6, $id_usuario);
            $mensaje = 'danger';
        }
        
        $json = array(
            'mensaje' => $mensaje
        );
        $jsonstring = json_encode($json);
        echo $jsonstring;
    } else {
        echo 'error';
    }
}
if($_POST['funcion']=='rechazar_solicitud'){
    $id_usuario    = $_SESSION['id'];
    $nombre        = $_POST['nombre_rechazar_sol'];
    $formateado    = str_replace(" ","+",$_POST['id_marca_rechazar_sol']);
    $id_solicitud  = openssl_decrypt($formateado, CODE, KEY);
    $observaciones = $_POST['observaciones'];
    if(is_numeric($id_solicitud)) {
        $solicitud_marca->rechazar_solicitud($id_solicitud, $id_usuario, $observaciones);
        $descripcion = 'Ha rechazado una solicitud marca, '.$nombre;
        $historial->crear_historial($descripcion, 1, 6, $id_usuario);
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