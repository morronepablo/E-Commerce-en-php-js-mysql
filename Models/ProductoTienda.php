<?php
 
    include_once 'Conexion.php';
    class ProductoTienda {
        var $objetos;
        public function __construct() {
            $db = new Conexion();
            $this->acceso = $db->pdo;
        }
        function llenar_productos($id=null) {
            if($id) {
                $sql = "SELECT pt.id as id,
                           p.id as id_producto,
                           p.nombre as producto,
                           p.sku as sku,
                           p.imagen_principal as imagen,
                           p.detalles as detalles,
                           m.nombre as marca,
                           pt.estado_envio as envio,
                           pt.precio as precio,
                           pt.descuento as descuento,
                           pt.precio - (pt.precio*(pt.descuento*0.01)) as precio_descuento,
                           t.id as id_tienda,
                           t.nombre as tienda,
                           t.direccion as direccion
                        FROM producto_tienda pt
                        JOIN producto p ON p.id=pt.id_producto
                        JOIN marca m ON m.id=p.id_marca
                        JOIN tienda t ON t.id=pt.id_tienda
                        AND pt.estado='A' AND pt.id=:id";
                $query = $this->acceso->prepare($sql);
                $query->execute(array(':id'=>$id));
                $this->objetos = $query->fetchAll();
                return $this->objetos;
            } else {
                $sql = "SELECT pt.id as id,
                           p.id as id_producto,
                           p.nombre as producto,
                           p.sku as sku,
                           p.imagen_principal as imagen,
                           p.detalles as detalles,
                           m.nombre as marca,
                           pt.estado_envio as envio,
                           pt.precio as precio,
                           pt.descuento as descuento,
                           pt.precio - (pt.precio*(pt.descuento*0.01)) as precio_descuento,
                           t.id as id_tienda,
                           t.nombre as tienda,
                           t.direccion as direccion
                        FROM producto_tienda pt
                        JOIN producto p ON p.id=pt.id_producto
                        JOIN marca m ON m.id=p.id_marca
                        JOIN tienda t ON t.id=pt.id_tienda
                        AND pt.estado='A'";
                $query = $this->acceso->prepare($sql);
                $query->execute();
                $this->objetos = $query->fetchAll();
                return $this->objetos;
            }
            
        }
        function evaluar_calificaciones($id_producto_tienda) {
            $sql = "SELECT AVG(calificacion) as promedio
                    FROM resena r
                    WHERE r.id_producto_tienda = :id_producto_tienda
                    AND r.estado='A'";
            $query = $this->acceso->prepare($sql);
            $query->execute(array(':id_producto_tienda'=>$id_producto_tienda));
            $this->objetos = $query->fetchAll();
            return $this->objetos;
        }
        function capturar_imagenes($id_producto) {
            $sql = "SELECT *
                    FROM imagen
                    WHERE imagen.id_producto=:id_producto
                    AND imagen.estado='A'";
            $query = $this->acceso->prepare($sql);
            $query->execute(array(':id_producto'=>$id_producto));
            $this->objetos = $query->fetchAll();
            return $this->objetos;
        }
        function contar_resenas($id_tienda) {
            $sql = "SELECT COUNT(*) as numero_resenas,
                    AVG(calificacion) as sumatoria
                    FROM tienda t
                    JOIN producto_tienda pt ON t.id=pt.id_tienda
                    JOIN resena r ON pt.id=r.id_producto_tienda
                    AND t.id=:id_tienda";
            $query = $this->acceso->prepare($sql);
            $query->execute(array(':id_tienda'=>$id_tienda));
            $this->objetos = $query->fetchAll();
            return $this->objetos;
        }
        function capturar_caracteristicas($id_producto) {
            $sql = "SELECT *
                    FROM caracteristica c
                    WHERE c.id_producto=:id_producto
                    AND c.estado='A'";
            $query = $this->acceso->prepare($sql);
            $query->execute(array(':id_producto'=>$id_producto));
            $this->objetos = $query->fetchAll();
            return $this->objetos;
        }
        function capturar_resenas($id_producto_tienda) {
            $sql = "SELECT r.id as id,
                           calificacion,
                           descripcion,
                           fecha_creacion,
                           u.user as user,
                           u.avatar as avatar
                    FROM resena r
                    JOIN usuario u ON u.id=r.id_usuario
                    WHERE r.id_producto_tienda=:id_producto_tienda
                    AND r.estado='A' ORDER BY r.fecha_creacion DESC";
            $query = $this->acceso->prepare($sql);
            $query->execute(array(':id_producto_tienda'=>$id_producto_tienda));
            $this->objetos = $query->fetchAll();
            return $this->objetos;
        }
    }

?>