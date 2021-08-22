<?php
 
    include_once 'Conexion.php';
    class UsuarioLocalidad {
        var $objetos;
        public function __construct() {
            $db = new Conexion();
            $this->acceso = $db->pdo;
        }
        function crear_direccion($id_usuario, $id_localidad, $direccion, $referencia) {
            $sql = "INSERT INTO usuario_provincia(direccion,referencia,id_localidad,id_usuario) VALUES(:direccion,:referencia,:id_localidad,:id_usuario)";
            $query = $this->acceso->prepare($sql);
            $query->execute(array(':direccion'=>$direccion,':referencia'=>$referencia,':id_localidad'=>$id_localidad,':id_usuario'=>$id_usuario));
        }
        function llenar_direcciones($id_usuario) {
            $sql = "SELECT ul.id as id,direccion,referencia,l.nombre as localidades,p.nombre as provincias FROM usuario_provincia ul
                        JOIN localidades l ON l.id=ul.id_localidad
                        JOIN provincias p ON p.id=l.id_provincia
                        WHERE id_usuario=:id AND estado = 'A'";
            $query = $this->acceso->prepare($sql);
            $query->execute(array(':id'=>$id_usuario));
            $this->objetos = $query->fetchAll();
            return $this->objetos;
        }
        function eliminar_direccion($id_direccion) {
            $sql = "UPDATE usuario_provincia SET estado = 'I' WHERE id=:id_direccion";
            $query = $this->acceso->prepare($sql);
            $query->execute(array(':id_direccion'=>$id_direccion,));
        }
        function recuperar_direccion($id_direccion) {
            $sql = "SELECT ul.id as id,direccion,referencia,l.nombre as localidades,p.nombre as provincias FROM usuario_provincia ul
                        JOIN localidades l ON l.id=ul.id_localidad
                        JOIN provincias p ON p.id=l.id_provincia
                        WHERE ul.id=:id AND estado = 'A'";
            $query = $this->acceso->prepare($sql);
            $query->execute(array(':id'=>$id_direccion));
            $this->objetos = $query->fetchAll();
            return $this->objetos;
        }
    }
    