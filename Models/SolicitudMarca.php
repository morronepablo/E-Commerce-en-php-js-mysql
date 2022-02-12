<?php
include_once 'Conexion.php';
class SolicitudMarca {
    var $objetos;
    public function __construct() {
        $db = new Conexion();
        $this->acceso = $db->pdo;
    }
    function buscar($nombre) {
        $sql = "SELECT *
                FROM solicitud_marca sm
                WHERE sm.nombre=:nombre AND estado='A'";
        $query = $this->acceso->prepare($sql);
        $variables = array(
            ':nombre' => $nombre
        );
        $query->execute ($variables);
        $this->objetos = $query->fetchAll();
        return $this->objetos;
    }
    function crear($nombre, $desc, $nombre_imagen, $id_usuario) {
        $sql = "INSERT INTO solicitud_marca (nombre, descripcion, imagen, id_usuario)
                VALUES (:nombre, :descripcion, :imagen, :id_usuario)";
        $query = $this->acceso->prepare($sql);
        $variables = array(
            ':nombre'      => $nombre,
            ':descripcion' => $desc,
            ':imagen'      => $nombre_imagen,
            ':id_usuario'  => $id_usuario
        );
        $query->execute ($variables);
    }
    function read_tus_solicitudes($id_usuario) {
        $sql = "SELECT *
                FROM solicitud_marca sm
                WHERE sm.id_usuario=:id_usuario AND estado='A' ORDER BY fecha_creacion DESC";
        $query = $this->acceso->prepare($sql);
        $variables = array(
            ':id_usuario'  => $id_usuario
        );
        $query->execute ($variables);
        $this->objetos = $query->fetchAll();
        return $this->objetos;
    }
}