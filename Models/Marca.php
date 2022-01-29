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
        function crear($nombre, $nombre_imagen) {
            $sql = "INSERT INTO marca (nombre, imagen)
                    VALUES (:nombre, :imagen)";
            $query = $this->acceso->prepare($sql);
            $variables = array(
                ':nombre' => $nombre,
                ':imagen' => $nombre_imagen
            );
            $query->execute ($variables);
        }
        function obtener_marca($id_marca) {
            $sql = "SELECT *
                    FROM marca
                    WHERE marca.id=:id_marca AND estado='A'";
            $query = $this->acceso->prepare($sql);
            $variables = array(
                ':id_marca' => $id_marca
            );
            $query->execute ($variables);
            $this->objetos = $query->fetchAll();
            return $this->objetos;
        }
        function editar($id_marca, $nombre, $img) {
            if($img != '') {
                $sql = "UPDATE marca SET nombre=:nombre, imagen=:img
                        WHERE id=:id_marca";
                $query = $this->acceso->prepare($sql);
                $variables = array(
                    ':nombre'   => $nombre,
                    ':img'   => $img,
                    ':id_marca' => $id_marca
                );
                $query->execute ($variables);
            } else {
                $sql = "UPDATE marca SET nombre=:nombre
                        WHERE id=:id_marca";
                $query = $this->acceso->prepare($sql);
                $variables = array(
                    ':nombre'   => $nombre,
                    ':id_marca' => $id_marca
                );
                $query->execute ($variables);
            }
        }
    }