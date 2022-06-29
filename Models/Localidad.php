<?php
    include_once $_SERVER["DOCUMENT_ROOT"].'/commerce/Models/Conexion.php';
    class Localidad {
        var $objetos;
        public function __construct() {
            $db = new Conexion();
            $this->acceso = $db->pdo;
        }
        function llenar_localidad($id_provincia) {
            $sql = "SELECT * FROM localidades
                    WHERE id_provincia=:id";
            $query = $this->acceso->prepare($sql);
            $query->execute(array(':id'=>$id_provincia));
            $this->objetos = $query->fetchAll();
            return $this->objetos;
        }
    }

?>