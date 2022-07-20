<?php
    include_once $_SERVER["DOCUMENT_ROOT"].'/commerce/Models/Conexion.php';
    class Producto {
        var $objetos;
        public function __construct() {
            $db = new Conexion();
            $this->acceso = $db->pdo;
        }
        function read_all_productos() {
            $sql = "SELECT 
                    p.id,
                    p.nombre,
                    p.nombre_corto,
                    p.sku,
                    p.detalles,
                    p.imagen_principal,
                    p.fecha_creacion,
                    p.fecha_edicion,
                    m.id as id_marca,
                    m.nombre as marca,
                    m.imagen
                    FROM producto p
                    JOIN marca m ON p.id_marca=m.id
                    WHERE p.estado='A' ORDER BY p.fecha_creacion DESC";
            $query = $this->acceso->prepare($sql);
            $query->execute ();
            $this->objetos = $query->fetchAll();
            return $this->objetos;
        }
        function buscar_menos_id($nombre, $id_producto) {
            $sql = "SELECT *
                    FROM producto p
                    WHERE p.nombre=:nombre AND p.id!=:id_producto
                    AND p.estado='A'";
            $query = $this->acceso->prepare($sql);
            $variables = array(
                ':nombre'       => $nombre,
                ':id_producto'  => $id_producto
            );
            $query->execute ($variables);
            $this->objetos = $query->fetchAll();
            return $this->objetos;
        }
        function obtener_producto($id_producto) {
            $sql = "SELECT *
                    FROM producto p
                    WHERE p.id=:id_producto AND p.estado='A'";
            $query = $this->acceso->prepare($sql);
            $variables = array(
                ':id_producto' => $id_producto
            );
            $query->execute ($variables);
            $this->objetos = $query->fetchAll();
            return $this->objetos;
        }
        function editar($id_producto, $nombre, $nombre_corto, $sku, $detalles, $img) {
            if($img != '') {
                $sql = "UPDATE producto SET 
                        nombre=:nombre, 
                        nombre_corto=:nombre_corto, 
                        sku=:sku,
                        detalles=:detalles,
                        imagen_principal=:imagen_principal
                        WHERE id=:id_producto";
                $query = $this->acceso->prepare($sql);
                $variables = array(
                    ':nombre'           => $nombre,
                    ':nombre_corto'     => $nombre_corto,
                    ':sku'              => $sku,
                    ':detalles'         => $detalles,
                    ':imagen_principal' => $img,
                    ':id_producto'      => $id_producto
                );
                $query->execute ($variables);
            } else {
                $sql = "UPDATE producto SET 
                        nombre=:nombre, 
                        nombre_corto=:nombre_corto, 
                        sku=:sku,
                        detalles=:detalles
                        WHERE id=:id_producto";
                $query = $this->acceso->prepare($sql);
                $variables = array(
                    ':nombre'           => $nombre,
                    ':nombre_corto'     => $nombre_corto,
                    ':sku'              => $sku,
                    ':detalles'         => $detalles,
                    ':id_producto'      => $id_producto
                );
                $query->execute ($variables);
            }
        }
        /*********************************************************** */
        function crear($nombre, $desc, $nombre_imagen) {
            $sql = "INSERT INTO marca (nombre, descripcion, imagen)
                    VALUES (:nombre, :descripcion, :imagen)";
            $query = $this->acceso->prepare($sql);
            $variables = array(
                ':nombre'      => $nombre,
                ':descripcion' => $desc,
                ':imagen'      => $nombre_imagen
            );
            $query->execute ($variables);
        }
        
        
        function eliminar_marca($id_marca) {
            $sql = "UPDATE marca SET estado=:estado
                    WHERE id=:id_marca";
            $query = $this->acceso->prepare($sql);
            $variables = array(
                ':id_marca' => $id_marca,
                ':estado' => 'I'
            );
            $query->execute ($variables);
        }
        function buscar($nombre) {
            $sql = "SELECT *
                    FROM marca
                    WHERE marca.nombre=:nombre AND estado='A'";
            $query = $this->acceso->prepare($sql);
            $variables = array(
                ':nombre' => $nombre
            );
            $query->execute ($variables);
            $this->objetos = $query->fetchAll();
            return $this->objetos;
        }
    }