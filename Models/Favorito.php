<?php
 
    include_once 'Conexion.php';
    class Favorito {
        var $objetos;
        public function __construct() {
            $db = new Conexion();
            $this->acceso = $db->pdo;
        }
        function read_favorito_usuario_protienda($usuario_sesion, $id_producto_tienda) {
            $sql = "SELECT *
                    FROM favorito
                    WHERE id_usuario=:id_usuario
                    AND id_producto_tienda=:id_producto_tienda";
            $query = $this->acceso->prepare($sql);
            $variables = array(
                ':id_usuario'         => $usuario_sesion,
                ':id_producto_tienda' => $id_producto_tienda
            );
            $query->execute($variables);
            $this->objetos = $query->fetchAll();
            return $this->objetos;
        }
        function update_remove($id_favorito) {
            $sql = "UPDATE favorito
                    SET estado=:estado
                    WHERE id=:id_favorito";
            $query = $this->acceso->prepare($sql);
            $variables = array(
                ':id_favorito' => $id_favorito,
                ':estado'      => 'I'
            );
            $query->execute($variables);
        }
        function update_add($id_usuario, $id_producto_tienda, $id_favorito, $url) {
            if($id_favorito != '') {
                $sql = "UPDATE favorito
                        SET estado=:estado
                        WHERE id=:id_favorito";
                $query = $this->acceso->prepare($sql);
                $variables = array(
                    ':id_favorito' => $id_favorito,
                    ':estado'      => 'A'
                );
                $query->execute($variables);
            } else {
                $sql = "INSERT INTO favorito (url,id_usuario,id_producto_tienda)
                        VALUES(:url,:id_usuario,:id_producto_tienda)";
                $query = $this->acceso->prepare($sql);
                $variables = array(
                    ':url'                => $url,
                    ':id_usuario'         => $id_usuario,
                    ':id_producto_tienda' => $id_producto_tienda
                );
                $query->execute($variables);
            }
            
        }
    }