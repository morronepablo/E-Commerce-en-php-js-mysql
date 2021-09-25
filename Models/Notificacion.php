<?php
 
    include_once 'Conexion.php';
    class Notificacion {
        var $objetos;
        public function __construct() {
            $db = new Conexion();
            $this->acceso = $db->pdo;
        }
        function create($titulo, $asunto, $pgt, $imagen, $url, $id_propietario_tienda) {
            $sql = "INSERT INTO notificacion(titulo, asunto, contenido, imagen, url_1, id_usuario)
                    VALUES(:titulo, :asunto, :contenido, :imagen, :url_1, :id_usuario)";
            $query = $this->acceso->prepare($sql);
            $variables = array(
                ':titulo'     => $titulo,
                ':asunto'     => $asunto,
                ':contenido'  => $pgt,
                ':imagen'     => $imagen,
                ':url_1'      => $url,
                ':id_usuario' => $id_propietario_tienda,
            );
            $query->execute($variables);
        }
        function read($id_usuario) {
            $sql = "SELECT *
                    FROM notificacion n
                    WHERE n.id_usuario=:id_usuario
                    AND n.estado='A'
                    AND n.estado_abierto=0 ORDER BY n.fecha_creacion DESC";
            $query = $this->acceso->prepare($sql);
            $query->execute(array(':id_usuario'=>$id_usuario));
            $this->objetos = $query->fetchAll();
            return $this->objetos;
            
        }
    }

