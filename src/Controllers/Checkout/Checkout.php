<?php

namespace Controllers\Checkout;

use Controllers\PrivateController;
use Dao\Carrito\CartDao;
use Utilities\Security;
use Dao\Transacciones\Transaccion;

class Checkout extends PrivateController
{
    public function run(): void
    {
        $viewData = array();
        if ($this->isPostBack()) {
            $usercod = Security::getUserId();  
            $itemsCarrito = CartDao::getCartItems($usercod);

            // Crear la orden de PayPal
            $PayPalOrder = new \Utilities\Paypal\PayPalOrder(
                "test" . (time() - 10000000),
                "http://localhost/mvc202403/index.php?page=Checkout_Error",
                "http://localhost/mvc202403/index.php?page=Checkout_Accept"
            );

            $subtotal = 0;
            foreach ($itemsCarrito as $item) {
                $subtotal += $item['subtotal']; 
            }
            $total = $subtotal + $subtotal * 0.10;

            // Agregar los productos a la orden de PayPal
            foreach ($itemsCarrito as $item) {
                $PayPalOrder->addItem($item['producto_nombre'], $item['producto_nombre'], "PRD" . $item['detalle_id'], 
                    $item['producto_precio'], $item['producto_precio'] * 0.10, $item['cantidad'], "PHYSICAL_GOODS" 
                );
            }

            $carrito_id = CartDao::getCart($usercod);
            if ($carrito_id) {
                CartDao::useCart($usercod, $carrito_id);
            }

            Transaccion::guardarTransaccion($carrito_id, $total, 'PayPal');

            // Actualizar el carrito a "PGD" después de guardar la transacción
            CartDao::useCart($usercod);

            // Limpiar el carrito (ahora es seguro hacerlo)
            CartDao::clearCart($usercod);

            // Crear la API de PayPal y obtener el token
            $PayPalRestApi = new \Utilities\PayPal\PayPalRestApi(
                \Utilities\Context::getContextByKey("PAYPAL_CLIENT_ID"),
                \Utilities\Context::getContextByKey("PAYPAL_CLIENT_SECRET")
            );
            $PayPalRestApi->getAccessToken();

            // Crear la orden en PayPal
            $response = $PayPalRestApi->createOrder($PayPalOrder);

            // Guardar el ID de la orden en la sesión
            $_SESSION["orderid"] = $response->id;

            // Redirigir al usuario para que apruebe el pago
            foreach ($response->links as $link) {
                if ($link->rel == "approve") {
                    \Utilities\Site::redirectTo($link->href);
                }
            }

            die();
        }

        \Views\Renderer::render("paypal/checkout", $viewData);
    }
}
