<?php

namespace Controllers\Checkout;

use Controllers\PrivateController;
use Dao\Transacciones\Transaccion;
use Utilities\Security;

class TransaccionC extends PrivateController
{
    public function run(): void
    {
        $dataview = [];
        $dataview["historial"] = $this->historial();
        \Views\Renderer::render("paypal/transaccion", $dataview);
    }
    
    private static function historial()
    {
        $usercod = Security::getUserId(); 
        return Transaccion::obtenerHistorialTransacciones($usercod);
    }
}