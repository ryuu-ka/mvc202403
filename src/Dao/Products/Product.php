<?php

namespace Dao\Products;

use Dao\Table;

class Product extends Table
{
    public static function obtenerProductos()
    {
        $sqlstr = "SELECT * FROM productos;";
        return self::obtenerRegistros($sqlstr, []);
    }

    public static function obtenerProductoPorId($id)
    {
        $sqlstr = "SELECT * FROM productos WHERE producto_id = :producto_id";
        return self::obtenerUnRegistro($sqlstr, ["producto_id" => $id]);
    }

    public static function agregarProducto($producto)
    {
        unset($producto["producto_id"]);
        $sqlstr = "INSERT INTO productos (
            producto_nombre, producto_descripcion, producto_precio, producto_stock, producto_imagen, producto_estado, categoria_id
        ) VALUES (
            :producto_nombre, :producto_descripcion, :producto_precio, :producto_stock, :producto_imagen, :producto_estado, :categoria_id
        );";
        return self::executeNonQuery($sqlstr, $producto);
    }

    public static function actualizarProducto($producto)
    {
        $sqlstr = "UPDATE productos SET 
            producto_nombre = :producto_nombre, producto_descripcion = :producto_descripcion, 
            producto_precio = :producto_precio, producto_stock = :producto_stock, 
            producto_imagen = :producto_imagen, producto_estado = :producto_estado, 
            categoria_id = :categoria_id
        WHERE producto_id = :producto_id;";
        return self::executeNonQuery($sqlstr, $producto);
    }

    public static function eliminarProducto($producto_id)
    {
        $sqlstr = "DELETE FROM productos WHERE producto_id = :producto_id";
        return self::executeNonQuery($sqlstr, ["producto_id" => $producto_id]);
    }
}
