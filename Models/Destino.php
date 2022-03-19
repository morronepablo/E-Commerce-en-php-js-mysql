<?php
    include_once 'Conexion.php';
    class Destino {
        var $objetos;
        public function __construct() {
            $db = new Conexion();
            $this->acceso = $db->pdo;
        }
        function ultimo_mensaje() {
            $sql = "SELECT MAX(id) as ultimo_mensaje
                    FROM mensaje";
            $query = $this->acceso->prepare($sql);
            $query->execute();
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
    }