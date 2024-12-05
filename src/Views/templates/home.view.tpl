<h1>CATALOGO DE PRODUCTOS</h1>

<div class="product-list">
    {{foreach productsNew}}
    <div class="product" data-productId="{{productId}}">
        <img src="public/imgs/hero/{{productImgUrl}}" alt="{{productName}}">
        <h2>{{productName}}</h2>
        <p>{{productDescription}}</p>
        <p>L.{{productPrice}}</p>
        <div class="product-info">
        </div>
        <form action="index.php?page=Carrito_CartController" method="POST">
    <input type="hidden" name="producto_id" value="{{productId}}">
    <input type="number" name="cantidad" value="1" min="1" max="{{productStock}}">
    <input type="hidden" name="precio_unitario" value="{{productPrice}}">
    <input type="hidden" name="action" value="add">
    <button type="submit">Agregar al carrito</button>
</form>


    </div>
    {{endfor productsNew}}
</div>

<script>
    // Función para actualizar el carrito
function actualizarCarritoUI() {
    fetch('index.php?page=Carrito_CartController')  // Solicita los datos del carrito actual
        .then(response => response.text())  // Respuesta en formato HTML
        .then(data => {
            document.querySelector('.WWList').innerHTML = data;  // Actualiza la lista del carrito
        })
        .catch(error => console.error('Error al actualizar el carrito:', error));
}

// Escucha de los botones de "Agregar al carrito"
document.querySelectorAll('.add-to-cart').forEach(button => {
    button.addEventListener('click', function(event) {
        event.preventDefault();  // Evitar que el formulario se envíe de manera tradicional

        const productId = this.getAttribute('data-product-id');
        const productPrice = this.getAttribute('data-product-price');
        const quantity = 1;  // Siempre añadimos 1 cantidad por defecto

        // Hacer la petición para agregar al carrito
        fetch('index.php?page=Carrito_CartController', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: new URLSearchParams({
                action: 'add',
                producto_id: productId,
                cantidad: quantity,
                precio_unitario: productPrice
            })
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('Producto agregado al carrito!');
                actualizarCarritoUI();  // Actualiza la vista del carrito
            } else {
                alert('Error: ' + data.message);
            }
        })
        .catch(error => console.error('Error:', error));
    });
});
</script>
