<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="es_AR"/>

<section id="clientes">
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <div class="card">
                    <div class="card-header">
                        <h4><i class="fas fa-users"></i>  Listado De Clientes</h4>
                    </div>
                    <table class="table table-striped">
                        <thead class="thead-dark">
                            <tr>
                                <th><i class="fas fa-id-card"></i></th>
                                <th>Nombre</th>
                                <th>Saldo</th>
                                <th>Editar</th>
                                <th>Eliminar</th>
                            </tr>
                        </thead>

                        <tbody>
                            <!-- ITERAMOS CADA ELEMENTO DE LA LISTA DE CLIENTES -->
                            <c:forEach var="cliente" items="${clientes}" varStatus="status">
                                <tr>
                                    <td>${status.count}</td>
                                    <td>${cliente.nombre} ${cliente.apellido}</td>
                                    <td><fmt:formatNumber value="${cliente.saldo}" type="currency"/></td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/ServletControlador?action=editar&idCliente=${cliente.idCliente}"
                                           class="btn btn-secondary"><i class="fas fa-user-edit"></i></a>
                                    </td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/ServletControlador?action=eliminar&idCliente=${cliente.idCliente}"
                                           class="btn btn-danger"><i class="fas fa-user-times"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- INICIO TARJETAS PARA LOS TOTALES -->
            <div class="col-md-3">
                <div class="card text-center bg-danger text-white mb-3">
                    <div class="card-body">
                        <h3>Saldo Total <i class="fas fa-wallet"></i></h3>
                        <h4 class="display-4">
                            <fmt:formatNumber value="${saldoTotal}" type="currency"/>
                        </h4>
                    </div>
                </div>
                <div class="card text-center bg-success text-white mb-3">
                    <div class="card-body">
                        <h3>Total Clientes</h3>
                        <h4 class="display-4">
                            <i class="fas fa-users"></i> ${totalClientes}
                        </h4>
                    </div>
                </div>
            </div>          
            <!-- FIN TARJETAS PARA LOS TOTALES -->
        </div>        
    </div>
</section>


<!-- AGREGAR CLIENTE -->
<jsp:include page="/WEB-INF/paginas/cliente/agregarCliente.jsp"/>