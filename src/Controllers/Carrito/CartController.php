<?php

namespace Controllers\Carrito;

use Controllers\PrivateController;
use Dao\Carrito\CartDao;
use Utilities\Security;
use Views\Renderer;

class CartController extends PrivateController
{
    public function run(): void
    {
        $viewData = [];
        $usercod = Security::getUserId();
    
        if ($this->isPostBack()) {
            header('Content-Type: application/json'); // Responder como JSON si es un POST
            try {
                $action = $_POST["action"] ?? ""; // Obtener acción desde POST
                CartDao::createCart($usercod); // Asegura que haya un carrito creado para el usuario
    
                switch ($action) {
                    case "add":
                        $producto_id = intval($_POST["producto_id"]);
                        $cantidad = intval($_POST["cantidad"]);
                        $precio_unitario = floatval($_POST["precio_unitario"]);
    
                        CartDao::addToCart($usercod, $producto_id, $cantidad, $precio_unitario);
                        echo json_encode(["success" => true, "message" => "Producto agregado"]);
                        break;
    
                    case "remove":
                        $detalle_id = intval($_POST["detalle_id"]);
                        CartDao::removeFromCart($detalle_id); // Eliminar producto del carrito
                        break;
    
                    case "clear":
                        CartDao::clearCart($usercod); // Vaciar carrito
                        break;
                }
            } catch (\Exception $ex) {
                echo json_encode(["success" => false, "message" => $ex->getMessage()]);
            }
            exit; // Terminar la ejecución después de la acción
        }
    
        // Obtener los productos del carrito para este usuario
        $viewData['cartItems'] = CartDao::getCartItems($usercod);  // Asegúrate que devuelva un array
    
        // Calcular el total del carrito
        $total = 0;
        foreach ($viewData['cartItems'] as $item) {
            $total += $item['subtotal']; // Sumar los subtotales de cada item
        }
        $viewData['total'] = $total; // Pasar el total a la vista
    
        // Renderizar la vista de carrito con los datos
        Renderer::render("carrito/cart", $viewData);
    }
}