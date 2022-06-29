<?php
    include_once $_SERVER["DOCUMENT_ROOT"].'/commerce/Models/Conexion.php';
    class Mensaje {
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
        function crear($id_usuario) {
            $sql = "INSERT INTO mensaje (id_usuario)
                    VALUES(:id_usuario)";
            $query = $this->acceso->prepare($sql);
            $variables = array(
                ':id_usuario' => $id_usuario
            );
            $query->execute($variables);
        }
    }