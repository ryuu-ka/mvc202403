<?php

namespace Controllers\Products;

use Controllers\PrivateController;
use Views\Renderer;
use Utilities\Site;
use Dao\Products\Product;
use Utilities\Validators;

class ProductF extends PrivateController
{
    private $viewData = [];
    private $modeDscArr = [
        "INS" => "Crear nuevo Producto",
        "UPD" => "Editando %s (%s)",
        "DSP" => "Detalle de %s (%s)",
        "DEL" => "Eliminando %s (%s)",
    ];
    private $mode = '';
    private $errors = [];
    private $xssToken = '';

    private function addError($error, $context = 'global')
    {
        if (isset($this->errors[$context])) {
            $this->errors[$context][] = $error;
        } else {
            $this->errors[$context] = [$error];
        }
    }

    // Estructura del Producto
    private $producto = [
        "producto_id" => 0,
        "producto_nombre" => '',
        "producto_descripcion" => '',
        "producto_precio" => 0.00,
        "producto_stock" => 0,
        "producto_imagen" => '',
        "producto_estado" => 'ACT',
        "categoria_id" => 1
    ];

    public function run(): void
    {
        $this->inicializarForm();
        if ($this->isPostBack()) {
            $this->cargarDatosDelFormulario();
            if ($this->validarDatos()) {
                $this->procesarAccion();
            }
        }
        $this->generarViewData();
        Renderer::render('products/product', $this->viewData);
    }

    private function inicializarForm()
    {
        if (isset($_GET["mode"]) && isset($this->modeDscArr[$_GET["mode"]])) {
            $this->mode = $_GET["mode"];
            if ($this->mode !== 'DSP') {
                if (!$this->isFeatureAutorized("productos_" . $this->mode . "_enabled")) {
                    Site::redirectToWithMsg("index.php?page=Products-Products", "Algo salió mal. Intente de nuevo.");
                }
            }
        } else {
            Site::redirectToWithMsg("index.php?page=Products-Products", "Algo salió mal. Intente de nuevo.");
            die();
        }

        if ($this->mode !== 'INS' && isset($_GET["producto_id"])) {
            $this->producto["producto_id"] = intval($_GET["producto_id"]);
            $this->cargarDatosProducto();  // Aquí cargas los datos del producto, incluida la categoría.
        }
    }

    private function cargarDatosProducto()
    {
        $tmpProducto = Product::obtenerProductoPorId($this->producto["producto_id"]);
        $this->producto = $tmpProducto;
    }

    private function cargarDatosDelFormulario()
    {
        $this->producto["producto_nombre"] = $_POST["producto_nombre"];
        $this->producto["producto_descripcion"] = $_POST["producto_descripcion"];
        $this->producto["producto_precio"] = floatval($_POST["producto_precio"]);
        $this->producto["producto_stock"] = intval($_POST["producto_stock"]);
        $this->producto["producto_imagen"] = $_POST["producto_imagen"];
        $this->producto["producto_estado"] = $_POST["producto_estado"];
        $this->producto["categoria_id"] = intval($_POST["categoria_id"]);
        $this->xssToken = $_POST["xssToken"];
    }

    private function validarDatos()
    {
        if (!$this->validarAntiXSSToken()) {
            Site::redirectToWithMsg('index.php?page=Products-Products', "Error al procesar la solicitud.");
        }
        if (Validators::IsEmpty($this->producto["producto_nombre"])) {
            $this->addError("El nombre del producto no puede estar vacío.", "producto_nombre");
        }
        return count($this->errors) === 0;
    }

    private function procesarAccion()
    {
        switch ($this->mode) {
            case 'INS':
                $result = Product::agregarProducto($this->producto);
                if ($result) {
                    Site::redirectToWithMsg("index.php?page=Products-Products", "Producto registrado satisfactoriamente.");
                }
                break;
            case 'UPD':
                $result = Product::actualizarProducto($this->producto);
                if ($result) {
                    Site::redirectToWithMsg("index.php?page=Products-Products", "Producto actualizado satisfactoriamente.");
                }
                break;
            case 'DEL':
                $result = Product::eliminarProducto($this->producto['producto_id']);
                if ($result) {
                    Site::redirectToWithMsg("index.php?page=Products-Products", "Producto eliminado satisfactoriamente.");
                }
                break;
        }
    }

    private function generateAntiXSSToken()
    {
        $_SESSION["ProductF_XSST"] = hash("sha256", time() . "ProductF");
        $this->xssToken = $_SESSION["ProductF_XSST"];
    }

    private function validarAntiXSSToken()
    {
        if (isset($_SESSION["ProductF_XSST"])) {
            if ($this->xssToken === $_SESSION["ProductF_XSST"]) {
                return true;
            }
        }
        return false;
    }

    private function generarViewData()
    {
        $this->viewData["mode"] = $this->mode;
        $this->viewData["modes_dsc"] = sprintf(
            $this->modeDscArr[$this->mode],
            $this->producto["producto_nombre"],
            $this->producto["producto_id"]
        );
        $this->viewData["producto"] = $this->producto;
        $this->viewData["readonly"] = ($this->mode === 'DEL' || $this->mode === 'DSP') ? 'readonly' : '';
        foreach ($this->errors as $context => $errores) {
            $this->viewData[$context . '_error'] = $errores;
            $this->viewData[$context . '_haserror'] = count($errores) > 0;
        }
        $this->generateAntiXSSToken();
        $this->viewData["xssToken"] = $this->xssToken;
    }
}
