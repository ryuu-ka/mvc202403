<?php

namespace Dao\Transacciones;

use Dao\Table;

class Transaccion extends Table
{
    // Método para guardar una transacción en la tabla transacciones
    public static function guardarTransaccion($carritoId, $total, $metodoPago)
    {
        // Preparar los datos para la transacción
        $data = [
            "carrito_id" => $carritoId,
            "transaccion_total" => $total,
            "metodo_pago" => $metodoPago
        ];

        // SQL para insertar una nueva transacción
        $sqlstr = "INSERT INTO transacciones (carrito_id, transaccion_total, metodo_pago) 
                   VALUES (:carrito_id, :transaccion_total, :metodo_pago);";

        // Ejecutar la consulta y retornar el resultado
        return self::executeNonQuery($sqlstr, $data);
    }

    // Método para obtener el historial de transacciones con los detalles de los productos
    public static function obtenerHistorialTransacciones($usercod)
    {
        $sql = "
            SELECT 
                t.transaccion_id,
                t.transaccion_fch,
                t.transaccion_total,
                t.metodo_pago,
                t.transaccion_estado
            FROM 
                transacciones t
            JOIN 
                carritos c ON t.carrito_id = c.carrito_id
            JOIN 
                carrito_detalle cd ON c.carrito_id = cd.carrito_id
            WHERE 
                c.usercod = :usercod
            GROUP BY 
                t.transaccion_id
            ORDER BY 
                t.transaccion_fch DESC;
        ";

        // Ejecutar la consulta y retornar los resultados
        return self::obtenerRegistros($sql, ["usercod" => $usercod]);
    }
}
