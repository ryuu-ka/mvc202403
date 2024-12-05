<?php

namespace Controllers;

use \Dao\Products\Products as Products;
use \Views\Renderer as Renderer;
use \Utilities\Site as Site;

class HomeController extends PublicController
{
  public function run(): void
  {
    Site::addLink("public/css/products.css");

    $viewData = [];
    $viewData["productsNew"] = Products::getAllProducts();
    Renderer::render("home", $viewData);
  }
}
?>