<div class="modal fade" id="agregarClienteModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header bg-info text-white">
                <h5 class="modal-title"><i class="fas fa-user"></i>  Agregar Cliente</h5>
                <button class="btn-close" data-bs-dismiss="modal">
                </button>
            </div>

            <form action="${pageContext.request.contextPath}/ServletControlador?action=insertar" method="POST" class="was-validated">

                <div class="modal-body">
                    <div class="form-group">
                        <label for="nombre">Nombre:</label> <input type="text" class="form-control" name="nombre" required/>
                    </div>

                    <div class="form-group">
                        <label for="apellido">Apellido:</label> <input type="text" class="form-control" name="apellido" required/>
                    </div>

                    <div class="form-group">
                        <label for="email">Email:</label> <input type="email" class="form-control" name="email" required/>
                    </div>

                    <div class="form-group">
                        <label for="telefono">Telefono:</label> <input type="text" class="form-control" name="telefono" required/>
                    </div>

                    <div class="form-group">
                        <label for="saldo">Saldo:</label> <input type="number" class="form-control" name="saldo" step="any" required/>
                    </div>
                </div>
                
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary"><i class="fas fa-check-circle"></i> Guardar</button>
                </div>

            </form>
        </div>
    </div>
</div>