<h1>Historial de Transacciones</h1>
<section class="WWList">
    <table>
        <thead>
            <tr>
                <th>ID Transacción</th>
                <th>Fecha</th>
                <th>Total</th>
                <th>Método de Pago</th>
                <th>Estado</th>
            </tr>
        </thead>
        <tbody>
            {{foreach historial}}
            <tr>
                <td>{{transaccion_id}}</td>
                <td>{{transaccion_fch}}</td>
                <td>{{transaccion_total}}</td>
                <td>{{metodo_pago}}</td>
                <td>{{transaccion_estado}}</td>
            </tr>
            {{endfor historial}}
        </tbody>
    </table>
    <form>
        <button id="btnCancelar" class="btn">Volver</button>
    </form>   
</section>

<script> document.addEventListener("DOMContentLoaded", () => {
    const btnCancelar = document.getElementById("btnCancelar");
    btnCancelar.addEventListener("click", (e) => {
      e.preventDefault();
      e.stopPropagation();
      window.location.assign("index.php?page=Index");
    });
  }); </script>
