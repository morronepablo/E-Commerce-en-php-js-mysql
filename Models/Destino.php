<?php
    include_once 'Conexion.php';
    class Destino {
        var $objetos;
        public function __construct() {
            $db = new Conexion();
            $this->acceso = $db->pdo;
        }
        function read_mensajes_recibidos($id_usuario) {
            $sql = "SELECT 
                    d.id as id,
                    d.asunto as asunto,
                    d.contenido as contenido,
                    d.abierto as abierto,
                    d.favorito as favorito,
                    d.estado as estado,
                    d.fecha_creacion as fecha_creacion,
                    d.fecha_edicion as fecha_edicion,
                    u.nombres as nombres,
                    u.apellidos as apellidos 
                    FROM destino d
                    JOIN mensaje m ON d.id_mensaje=m.id
                    JOIN usuario u ON m.id_usuario=u.id
                    WHERE d.id_usuario = :id_usuario
                    AND d.estado='A' AND d.estado_perm='A' ORDER BY d.fecha_creacion DESC";
            $query = $this->acceso->prepare($sql);
            $variables = array(
                ':id_usuario' => $id_usuario
            );
            $query->execute($variables);
            $this->objetos = $query->fetchAll();
            return $this->objetos;
        }
        function crear($asunto,$contenido,$id_usuario,$id_mensaje) {
            $sql = "INSERT INTO destino (asunto,contenido,id_usuario,id_mensaje)
                    VALUES(:asunto,:contenido,:id_usuario,:id_mensaje)";
            $query = $this->acceso->prepare($sql);
            $variables = array(
                ':asunto' => $asunto,
                ':contenido' => $contenido,
                ':id_usuario' => $id_usuario,
                ':id_mensaje' => $id_mensaje
            );
            $query->execute($variables);
        }
        function eliminar_mensaje($id_mensaje) {
            $sql = "UPDATE destino SET estado=:estado 
                    WHERE id=:id_mensaje";
            $query = $this->acceso->prepare($sql);
            $variables = array(
                ':estado'     => 'I',
                ':id_mensaje' => $id_mensaje
            );
            $query->execute($variables);
        }
        function remover_favorito($id_mensaje) {
            $sql = "UPDATE destino SET favorito=:favorito 
                    WHERE id=:id_mensaje";
            $query = $this->acceso->prepare($sql);
            $variables = array(
                ':favorito'   => 0,
                ':id_mensaje' => $id_mensaje
            );
            $query->execute($variables);
        }
        function agregar_favorito($id_mensaje) {
            $sql = "UPDATE destino SET favorito=:favorito 
                    WHERE id=:id_mensaje";
            $query = $this->acceso->prepare($sql);
            $variables = array(
                ':favorito'   => 1,
                ':id_mensaje' => $id_mensaje
            );
            $query->execute($variables);
        }
        function abrir_mensaje($id_mensaje) {
            $sql = "SELECT 
                    d.id as id,
                    d.asunto as asunto,
                    d.contenido as contenido,
                    d.abierto as abierto,
                    d.favorito as favorito,
                    d.estado as estado,
                    d.fecha_creacion as fecha_creacion,
                    d.fecha_edicion as fecha_edicion,
                    u.nombres as nombres,
                    u.apellidos as apellidos 
                    FROM destino d
                    JOIN mensaje m ON d.id_mensaje=m.id
                    JOIN usuario u ON m.id_usuario=u.id
                    WHERE d.id=:id_mensaje
                    ";
            $query = $this->acceso->prepare($sql);
            $variables = array(
                ':id_mensaje' => $id_mensaje
            );
            $query->execute($variables);
            $this->objetos = $query->fetchAll();
            return $this->objetos;
        }
        function mensaje_leido($id_mensaje) {
            $sql = "UPDATE destino SET abierto=:abierto 
                    WHERE id=:id_mensaje";
            $query = $this->acceso->prepare($sql);
            $variables = array(
                ':abierto'    => 1,
                ':id_mensaje' => $id_mensaje
            );
            $query->execute($variables);
        }
        function verificar_usuario_mensaje($id_usuario, $id_mensaje) {
            $sql = "SELECT * 
                    FROM destino d
                    WHERE d.id=:id_mensaje AND d.id_usuario=:id_usuario";
            $query = $this->acceso->prepare($sql);
            $variables = array(
                ':id_mensaje' => $id_mensaje,
                ':id_usuario' => $id_usuario
            );
            $query->execute($variables);
            $this->objetos = $query->fetchAll();
            return $this->objetos;
        }
        function read_mensajes_favoritos($id_usuario) {
            $sql = "SELECT 
                    d.id as id,
                    d.asunto as asunto,
                    d.contenido as contenido,
                    d.abierto as abierto,
                    d.favorito as favorito,
                    d.estado as estado,
                    d.fecha_creacion as fecha_creacion,
                    d.fecha_edicion as fecha_edicion,
                    u.nombres as nombres,
                    u.apellidos as apellidos 
                    FROM destino d
                    JOIN mensaje m ON d.id_mensaje=m.id
                    JOIN usuario u ON m.id_usuario=u.id
                    WHERE d.id_usuario = :id_usuario
                    AND d.estado='A' AND d.favorito=:favorito ORDER BY d.fecha_creacion DESC";
            $query = $this->acceso->prepare($sql);
            $variables = array(
                ':id_usuario' => $id_usuario,
                ':favorito' => 1
            );
            $query->execute($variables);
            $this->objetos = $query->fetchAll();
            return $this->objetos;
        }
        function read_mensajes_papelera($id_usuario) {
            $sql = "SELECT 
                    d.id as id,
                    d.asunto as asunto,
                    d.contenido as contenido,
                    d.abierto as abierto,
                    d.favorito as favorito,
                    d.estado as estado,
                    d.fecha_creacion as fecha_creacion,
                    d.fecha_edicion as fecha_edicion,
                    u.nombres as nombres,
                    u.apellidos as apellidos 
                    FROM destino d
                    JOIN mensaje m ON d.id_mensaje=m.id
                    JOIN usuario u ON m.id_usuario=u.id
                    WHERE d.id_usuario = :id_usuario
                    AND d.estado='I' ORDER BY d.fecha_creacion DESC";
            $query = $this->acceso->prepare($sql);
            $variables = array(
                ':id_usuario' => $id_usuario
            );
            $query->execute($variables);
            $this->objetos = $query->fetchAll();
            return $this->objetos;
        }
        function eliminar_mensaje_definitivamente($id_mensaje) {
            $sql = "DELETE FROM destino WHERE id=:id_mensaje";
            $query = $this->acceso->prepare($sql);
            $variables = array(
                ':id_mensaje' => $id_mensaje,
            );
            $query->execute($variables);
        }
        function read_mensajes_enviados($id_usuario) {
            $sql = "SELECT 
                    d.id as id,
                    d.asunto as asunto,
                    (SELECT CONCAT(u.nombres,' ',u.apellidos) FROM usuario u WHERE u.id=d.id_usuario) as destino,
                    d.contenido as contenido,
                    d.abierto_emisor as abierto,
                    d.favorito_emisor as favorito,
                    d.estado_emisor as estado,
                    d.fecha_creacion as fecha_creacion,
                    d.fecha_edicion as fecha_edicion,
                    u.nombres as nombres,
                    u.apellidos as apellidos 
                    FROM destino d
                    JOIN mensaje m ON d.id_mensaje=m.id
                    JOIN usuario u ON m.id_usuario=u.id
                    WHERE m.id_usuario=:id_usuario
                    AND d.estado_emisor='A' AND d.estado_emisor_perm='A' ORDER BY d.fecha_creacion DESC";
            $query = $this->acceso->prepare($sql);
            $variables = array(
                ':id_usuario' => $id_usuario
            );
            $query->execute($variables);
            $this->objetos = $query->fetchAll();
            return $this->objetos;
        }
    }