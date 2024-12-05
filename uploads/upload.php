<?php
$target_dir = "C:/xampp/htdocs/MVC202403/public/imgs/hero/";


if (!file_exists($target_dir)) {
    mkdir($target_dir, 0777, true);
}

$target_file = $target_dir . basename($_FILES["product_image"]["name"]);
$fileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));


if (getimagesize($_FILES["product_image"]["tmp_name"]) === false) {
    echo "Lo siento, solo se permiten archivos de imagen.";
    exit;
}


if ($_FILES["product_image"]["size"] > 5000000) {
    echo "Lo siento, el archivo es demasiado grande.";
    exit;
}

if ($fileType != "jpg" && $fileType != "jpeg" && $fileType != "png" && $fileType != "gif") {
    echo "Lo siento, solo se permiten archivos JPG, JPEG, PNG y GIF.";
    exit;
}


if (move_uploaded_file($_FILES["product_image"]["tmp_name"], $target_file)) {
    echo "El archivo " . htmlspecialchars(basename($_FILES["product_image"]["name"])) . " ha sido subido.";
} else {
    echo "Lo siento, hubo un error al subir tu archivo.";
}
?>
