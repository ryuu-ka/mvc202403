<?php
namespace Dao\Products;
use Dao\Table;

class Products extends Table {
    public static function getAllProducts() {
        $sqlstr = "SELECT p.producto_id AS productId, p.producto_nombre AS productName, p.producto_descripcion AS productDescription, p.producto_precio AS productPrice, p.producto_imagen AS productImgUrl, p.producto_estado AS productStatus 
                    FROM productos p 
                    WHERE p.producto_estado = 'ACT' 
                    ORDER BY p.producto_id DESC 
                    LIMIT 30";
        $params = [];
        $registros = self::obtenerRegistros($sqlstr, $params);
        return $registros;
    }

    public static function getDailyDeals() {
      $sqlstr = "SELECT p.producto_id AS productId, p.producto_nombre AS productName, p.producto_descripcion AS productDescription, 
                  p.producto_precio AS productPrice, p.producto_imagen AS productImgUrl, p.producto_estado AS productStatus 
                  FROM productos p 
                  WHERE p.producto_estado = 'OFERTA'";
      $params = [];
      $registros = self::obtenerRegistros($sqlstr, $params);
      return $registros;
  }

    
    public static function getProducts(
        string $partialName = "",
        string $status = "",
        string $orderBy = "",
        bool $orderDescending = false,
        int $page = 0,
        int $itemsPerPage = 10
    ) {
        $sqlstr = "SELECT p.producto_id AS productId, p.producto_nombre AS productName, p.producto_descripcion AS productDescription, p.producto_precio AS productPrice, p.producto_imagen AS productImgUrl, p.producto_estado AS productStatus,
                    CASE 
                        WHEN p.producto_estado = 'ACT' THEN 'Activo' 
                        WHEN p.producto_estado = 'INA' THEN 'Inactivo' 
                        ELSE 'Sin Asignar' 
                    END AS productStatusDsc 
                    FROM productos p";
        $sqlstrCount = "SELECT COUNT(*) AS count FROM productos p";
        $conditions = [];
        $params = [];

        if ($partialName != "") {
            $conditions[] = "p.producto_nombre LIKE :partialName";
            $params["partialName"] = "%" . $partialName . "%";
        }

        if (!in_array($status, ["ACT", "INA", ""])) {
            throw new \Exception("Error Processing Request: Status has invalid value");
        }

        if ($status != "") {
            $conditions[] = "p.producto_estado = :status";
            $params["status"] = $status;
        }

        if (count($conditions) > 0) {
            $sqlstr .= " WHERE " . implode(" AND ", $conditions);
            $sqlstrCount .= " WHERE " . implode(" AND ", $conditions);
        }

        if (!in_array($orderBy, ["producto_id", "producto_nombre", "producto_precio", ""])) {
            throw new \Exception("Error Processing Request: OrderBy has invalid value");
        }

        if ($orderBy != "") {
            $sqlstr .= " ORDER BY " . $orderBy;
            if ($orderDescending) {
                $sqlstr .= " DESC";
            }
        }

        $numeroDeRegistros = self::obtenerUnRegistro($sqlstrCount, $params)["count"];
        $pagesCount = ceil($numeroDeRegistros / $itemsPerPage);

        if ($page > $pagesCount - 1) {
            $page = $pagesCount - 1;
        }

        $sqlstr .= " LIMIT " . $page * $itemsPerPage . ", " . $itemsPerPage;

        $registros = self::obtenerRegistros($sqlstr, $params);
        return ["products" => $registros, "total" => $numeroDeRegistros, "page" => $page, "itemsPerPage" => $itemsPerPage];
    }


    public static function getProductById(int $productId) {
        $sqlstr = "SELECT p.producto_id AS productId, p.producto_nombre AS productName, p.producto_descripcion AS productDescription, p.producto_precio AS productPrice, p.producto_imagen AS productImgUrl, p.producto_estado AS productStatus 
                    FROM productos p 
                    WHERE p.producto_id = :productId";
        $params = ["productId" => $productId];
        return self::obtenerUnRegistro($sqlstr, $params);
    }


    public static function insertProduct(
        string $productName,
        string $productDescription,
        float $productPrice,
        string $productImgUrl,
        string $productStatus
    ) {
        $sqlstr = "INSERT INTO productos (producto_nombre, producto_descripcion, producto_precio, producto_imagen, producto_estado) 
                    VALUES (:productName, :productDescription, :productPrice, :productImgUrl, :productStatus)";
        $params = [
            "productName" => $productName,
            "productDescription" => $productDescription,
            "productPrice" => $productPrice,
            "productImgUrl" => $productImgUrl,
            "productStatus" => $productStatus
        ];
        return self::executeNonQuery($sqlstr, $params);
    }


    public static function updateProduct(
        int $productId,
        string $productName,
        string $productDescription,
        float $productPrice,
        string $productImgUrl,
        string $productStatus
    ) {
        $sqlstr = "UPDATE productos 
                    SET producto_nombre = :productName, 
                        producto_descripcion = :productDescription, 
                        producto_precio = :productPrice, 
                        producto_imagen = :productImgUrl, 
                        producto_estado = :productStatus 
                    WHERE producto_id = :productId";
        $params = [
            "productId" => $productId,
            "productName" => $productName,
            "productDescription" => $productDescription,
            "productPrice" => $productPrice,
            "productImgUrl" => $productImgUrl,
            "productStatus" => $productStatus
        ];
        return self::executeNonQuery($sqlstr, $params);
    }

    public static function deleteProduct(int $productId) {
        $sqlstr = "DELETE FROM productos WHERE producto_id = :productId";
        $params = ["productId" => $productId];
        return self::executeNonQuery($sqlstr, $params);
    }
}

?>
