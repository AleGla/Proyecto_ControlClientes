<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/a69175ebfc.js" crossorigin="anonymous"></script>

        <title>Editar Cliente</title>
    </head>
    <body>
        <!-- CABECERO-->
        <jsp:include page="/WEB-INF/paginas/comunes/cabecero.jsp"/>

        <form action="${pageContext.request.contextPath}/ServletControlador?action=modificar&idCliente=${c.idCliente}"
              method="POST" class="was-validated">        
            <!-- BOTONES DE NAVEGACION-->
            <jsp:include page="/WEB-INF/paginas/comunes/botonesNavegacionEdicion.jsp"/>

            <section id="details">
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div class="card">
                                <div class="card-header">
                                    <h4><i class="fas fa-users-cog"></i> Editar Cliente</h4>
                                </div>
                                <div class="card-body">

                                    <div class="form-group">
                                        <label for="nombre">Nombre:</label> <input type="text" class="form-control" name="nombre" value="${c.nombre}" required/>
                                    </div>

                                    <div class="form-group">
                                        <label for="apellido">Apellido:</label> <input type="text" class="form-control" name="apellido" value="${c.apellido}" required/>
                                    </div>

                                    <div class="form-group">
                                        <label for="email">Email:</label> <input type="email" class="form-control" name="email" value="${c.email}" required/>
                                    </div>

                                    <div class="form-group">
                                        <label for="telefono">Telefono:</label> <input type="text" class="form-control" name="telefono" value="${c.telefono}" required/>
                                    </div>

                                    <div class="form-group">
                                        <label for="saldo">Saldo:</label> <input type="number" class="form-control" name="saldo" value="${c.saldo}" step="any" required/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
            </section>
        </form>

        <!-- PIE PAGINA -->
        <jsp:include page="/WEB-INF/paginas/comunes/piePagina.jsp"/>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

    </body>
</html>
