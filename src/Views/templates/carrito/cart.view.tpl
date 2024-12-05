<h1>Carrito de Compras</h1>

<section class="WWList">
  <table>
    <thead>
      <tr>
        <th>Producto</th>
        <th>Precio Unitario</th>
        <th>Cantidad</th>
        <th>Subtotal</th>
        <th>Acciones</th>
      </tr>
    </thead>
    <tbody>
      {{foreach cartItems}}
      <tr>
        <td>{{producto_nombre}}</td>
        <td>{{producto_precio}}</td>
        <td>{{cantidad}}</td>
        <td>{{subtotal}}</td>
        <td class="center">
          <form method="POST">
            <input type="hidden" name="detalle_id" value="{{detalle_id}}">
            <input type="hidden" name="action" value="remove">
            <button id="btnEliminar">Eliminar</button>
          </form>
        </td>
      </tr>
      {{endfor cartItems}}
    </tbody>
    <tfoot>
      <tr>
        <td colspan="3" class="right"><strong>Total:</strong></td>
        <td colspan="2">{{total}}</td> 
      </tr>
    </tfoot>
  </table>
  
  <form action="index.php?page=checkout_checkout" method="post">
    <button type="submit">Realizar Pedido</button>
  </form> <br>

  <form method="POST">
    <input type="hidden" name="action" value="clear">
    <button id="btnClear">Vaciar Carrito</button>
  </form> 
</section>

