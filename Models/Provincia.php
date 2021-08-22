<?php
 
    include_once 'Conexion.php';
    class Provincia {
        var $objetos;
        public function __construct() {
            $db = new Conexion();
            $this->acceso = $db->pdo;
        }
        function llenar_provincias() {
            $sql = "SELECT * FROM provincias";
            $query = $this->acceso->prepare($sql);
            $query->execute();
            $this->objetos = $query->fetchAll();
            return $this->objetos;
        }
    }

?>