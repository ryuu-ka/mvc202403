<h1>{{modes_dsc}}</h1>
<section class="grid">
    <form action="index.php?page=Products-ProductF&mode={{mode}}&producto_id={{producto_id}}" method="post"
        enctype="multipart/form-data" class="row">
        {{with producto}}
        <div class="row col-6 offset-3">
            <label class="col-4" for="producto_id">Código</label>
            <input class="col-8" type="text" name="producto_id" id="producto_id" value="{{producto_id}}" readonly />
            <input type="hidden" name="xssToken" value="{{~xssToken}}" />
        </div>

        <div class="row col-6 offset-3">
            <label class="col-4" for="producto_nombre">Nombre</label>
            <input class="col-8" type="text" name="producto_nombre" id="producto_nombre" value="{{producto_nombre}}"
                required {{~readonly}} />
        </div>

        <div class="row col-6 offset-3">
            <label class="col-4" for="producto_descripcion">Descripción</label>
            <textarea class="col-8" name="producto_descripcion" id="producto_descripcion" rows="4"
                {{~readonly}}>{{producto_descripcion}}</textarea>
        </div>

        <div class="row col-6 offset-3">
            <label class="col-4" for="producto_precio">Precio</label>
            <input class="col-8" type="double" name="producto_precio" id="producto_precio" step="0.01"
                value="{{producto_precio}}" required {{~readonly}} />
        </div>

        <div class="row col-6 offset-3">
            <label class="col-4" for="producto_stock">Stock</label>
            <input class="col-8" type="number" name="producto_stock" id="producto_stock" value="{{producto_stock}}"
                required {{~readonly}} />
        </div>

        <div class="row col-6 offset-3">
            <label class="col-4" for="categoria_id">Categoría</label>
            <input class="col-8" type="number" name="categoria_id" id="categoria_id"
                value="{{categoria_id}}" required {{~readonly}} />
        </div>

        <div class="row col-6 offset-3">
            <label class="col-4" for="producto_estado">Estado</label>
            <select class="col-8" name="producto_estado" id="producto_estado" required {{~readonly}}>
                <option value="ACT" >Activo</option>
                <option value="INA" >Inactivo</option>
            </select>
        </div>

        <div class="row col-6 offset-3">
            <button type="submit" class="primary">Confirmar</button>&nbsp;
            <button id="btnCancelar" class="btn">Cancelar</button>
        </div>
        {{if ~global_haserror}}
        <div class="error">
            <ul>
                {{foreach ~global_error}}
                <li>{{this}}</li>
                {{endfor ~global_error}}
            </ul>
        </div>
        {{endif ~global_haserror}}
        {{endwith producto}}
    </form>
</section>

<script>
    document.addEventListener("DOMContentLoaded", () => {
        document.getElementById("btnCancelar").addEventListener('click', (e) => {
            e.preventDefault();
            e.stopPropagation();
            window.location.assign("index.php?page=Products-Products");
        });
    });
</script>