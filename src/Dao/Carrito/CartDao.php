<?php

namespace Dao\Carrito;

use Dao\Table as Table;

class CartDao extends Table
{
    public static function getCart($usercod){
        $sql = "SELECT carrito_id FROM carritos WHERE usercod = :usercod AND carrito_estado = 'PEN';";
        $carrito = self::obtenerUnRegistro($sql, ["usercod" => $usercod]);

        return $carrito["carrito_id"];
    }

    public static function createCart($usercod)
    {
        $carrito = self::getCart($usercod);
        if (!$carrito) {
            // Si no existe un carrito pendiente, crea uno nuevo
            $sql = "INSERT INTO carritos (usercod, carrito_estado) VALUES (:usercod, 'PEN');";
            self::executeNonQuery($sql, ["usercod" => $usercod]);
        }
    }

    public static function useCart($usercod)
    {
        $carrito["carrito_id"] = self::getCart($usercod);
        if ($carrito["carrito_id"]) {
            $sql = "UPDATE carritos SET carrito_estado = 'PGD' WHERE carrito_id = :carrito_id;";
            return self::executeNonQuery($sql, ["carrito_id" => $carrito["carrito_id"]]);;
        }
    }

    // Función para agregar un producto al carrito
    public static function addToCart($usercod, $producto_id, $cantidad, $precio_unitario)
    {
        // Verificar si el producto existe
    $sqlProducto = "SELECT COUNT(*) FROM productos WHERE producto_id = :producto_id";
    $productoExiste = self::obtenerUnRegistro($sqlProducto, ["producto_id" => $producto_id]);

    // Depuración
    error_log("Producto ID: $producto_id - Existencia: " . print_r($productoExiste, true));

    if (!$productoExiste || $productoExiste['COUNT(*)'] == 0) {
        echo json_encode(["success" => false, "message" => "Producto no encontrado"]);
        exit;
    }

        // Si el producto existe, procede a agregarlo al carrito
        $sqlCarrito = "SELECT carrito_id FROM carritos WHERE usercod = :usercod AND carrito_estado = 'PEN';";
        $carrito = self::obtenerUnRegistro($sqlCarrito, ["usercod" => $usercod]);

        if ($carrito) {
            $sqlDetalle = "INSERT INTO carrito_detalle (carrito_id, producto_id, cantidad, precio_unitario)
                           VALUES (:carrito_id, :producto_id, :cantidad, :precio_unitario)
                           ON DUPLICATE KEY UPDATE cantidad = cantidad + :cantidad;";
            self::executeNonQuery($sqlDetalle, [
                "carrito_id" => $carrito["carrito_id"],
                "producto_id" => $producto_id,
                "cantidad" => $cantidad,
                "precio_unitario" => $precio_unitario
            ]);
        }
    }

    // Función para eliminar un producto del carrito
    public static function removeFromCart($detalle_id)
    {
        $sql = "DELETE FROM carrito_detalle WHERE detalle_id = :detalle_id;";
        self::executeNonQuery($sql, ["detalle_id" => $detalle_id]);
    }

    // Función para vaciar el carrito
    public static function clearCart($usercod)
    {
        $carrito["carrito_id"] = self::getCart($usercod);
        if ($carrito["carrito_id"]) {
            $sql = "DELETE FROM carrito_detalle WHERE carrito_id = :carrito_id;";
            self::executeNonQuery($sql, ["carrito_id" => $carrito["carrito_id"]]);
        }
    }

    public static function getCartItems($usercod)
    {
        // Obtener carrito pendiente para el usuario
        $sqlCarrito = "SELECT carrito_id FROM carritos WHERE usercod = :usercod AND carrito_estado = 'PEN';";
        $carrito = self::obtenerUnRegistro($sqlCarrito, ["usercod" => $usercod]);
    
        if ($carrito) {
            // Obtener los detalles del carrito
            $sqlDetalle = "SELECT cd.detalle_id, p.producto_nombre, p.producto_precio, cd.cantidad, (cd.cantidad * cd.precio_unitario) as subtotal
                           FROM carrito_detalle cd
                           JOIN productos p ON p.producto_id = cd.producto_id
                           WHERE cd.carrito_id = :carrito_id;";
            return self::obtenerRegistros($sqlDetalle, ["carrito_id" => $carrito["carrito_id"]]);
        }
    
        return []; // Si no hay carrito o productos, retornar array vacío
    }
    

}
?>
