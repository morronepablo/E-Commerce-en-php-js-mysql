<?php
    include_once 'Conexion.php';
    class Marca {
        var $objetos;
        public function __construct() {
            $db = new Conexion();
            $this->acceso = $db->pdo;
        }
        function read_all_marcas() {
            $sql = "SELECT *
                    FROM marca
                    WHERE estado='A' ORDER BY fecha_creacion DESC";
            $query = $this->acceso->prepare($sql);
            $query->execute ();
            $this->objetos = $query->fetchAll();
            return $this->objetos;
        }
    }