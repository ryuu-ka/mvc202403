<h1>Ordenes Finalizadas</h1>
<form>
    <button id="btnHistorial" class="btn">Mostrar Historial de Transacciones</button>
</form>   

<script> document.addEventListener("DOMContentLoaded", () => {
    const btnHistorial = document.getElementById("btnHistorial");
    btnHistorial.addEventListener("click", (e) => {
      e.preventDefault();
      e.stopPropagation();
      window.location.assign("index.php?page=Checkout-TransaccionC");
    });
  }); </script>
