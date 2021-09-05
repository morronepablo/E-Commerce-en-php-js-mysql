<?php
 
    include_once 'Conexion.php';
    class Respuesta {
        var $objetos;
        public function __construct() {
            $db = new Conexion();
            $this->acceso = $db->pdo;
        }
        function read($id_pregunta) {
            $sql = "SELECT *
                    FROM respuesta r
                    WHERE r.id_pregunta=:id_pregunta
                    AND r.estado='A'";
            $query = $this->acceso->prepare($sql);
            $query->execute(array(':id_pregunta'=>$id_pregunta));
            $this->objetos = $query->fetchAll();
            return $this->objetos;
            
        }
    }

?>