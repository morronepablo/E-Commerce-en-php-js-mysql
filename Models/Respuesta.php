<?php
 
    include_once 'Conexion.php';
    class Respuesta {
        var $objetos;
        public function __construct() {
            $db = new Conexion();
            $this->acceso = $db->pdo;
        }
        function read($id_producto_tienda) {
            $sql = "SELECT p.id as id,
                           contenido,
                           p.fecha_creacion as fecha_creacion,
                           p.respuesta as estado_respuesta,
                           u.id as id_usuario,
                           u.user as username,
                           u.avatar as avatar 
                    FROM pregunta p
                    JOIN producto_tienda pt ON p.id_producto_tienda=pt.id
                    JOIN usuario u ON p.id_usuario=u.id
                    WHERE pt.id=:id_producto_tienda
                    AND p.estado='A' ORDER BY p.fecha_creacion DESC";
            $query = $this->acceso->prepare($sql);
            $query->execute(array(':id_producto_tienda'=>$id_producto_tienda));
            $this->objetos = $query->fetchAll();
            return $this->objetos;
            
        }
    }

?>