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
                    AND d.estado='A' ORDER BY d.fecha_creacion DESC";
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
    }