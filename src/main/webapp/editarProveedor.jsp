<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="pe.edu.vallegrande.service.*" %>
<%@ page import="pe.edu.vallegrande.dto.*" %>
<%@ page import="pe.edu.vallegrande.Controller.SuppliersController" %>
<%@ page import="pe.edu.vallegrande.Controller.CustomerController" %>
<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.lineicons.com/5.0/lineicons.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link rel="stylesheet" href="https://cdn.lineicons.com/3.0.0/lineicons.css">

    <title>SIDEBAR TEST</title>
</head>
<body>

<div class="d-flex">
    <!-- Sidebar -->
    <aside id="sidebar" class="sidebar-toggle">
        <div class="sidebar-logo">
            <a href="#">NUEVOAGRO ZAM</a>
        </div>
        <!-- Sidebar Navigation -->
        <ul class="sidebar-nav p-0">

            <li class="sidebar-item">
                <a href="#" class="sidebar-link">
                    <i class="lni lni-home"></i>
                    <span>Tabla principal</span>
                </a>
            </li>
            <li class="sidebar-item">
                <a href="#" class="sidebar-link">
                    <i class="lni lni-calendar"></i>
                    <span>Agenda</span>
                </a>
            </li>
            <li class="sidebar-header">
                Pages
            </li>
            <li class="sidebar-item">
                <a href="#" class="sidebar-link collapsed has-dropdown" data-bs-toggle="collapse"
                   data-bs-target="#auth" aria-expanded="true" aria-controls="auth">
                    <i class="lni lni-folder"></i>  <!-- Cambié a un ícono de carpeta -->
                    <span>Listado de Proveedores</span>
                </a>
                <ul id="auth" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                    <li class="sidebar-item">
                        <a href="controlador?accion=listar&page=productos" class="sidebar-link">Agregar Proveedores</a>
                    </li>
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link">Inventario</a>
                    </li>
                </ul>
            </li>
            <li class="sidebar-item">
                <a href="#" class="sidebar-link">
                    <i class="lni lni-cart"></i>
                    <span>Ventas</span>
                </a>
            </li>
            <li class="sidebar-item">
                <a href="controlador?accion=listar&page=compras" class="sidebar-link">
                    <i class="lni lni-shopping-basket"></i>
                    <span>Compras</span>
                </a>
            </li>
            <li class="sidebar-item">
                <a href="#" class="sidebar-link">
                    <i class="lni lni-cog"></i>
                    <span>Proveedores</span>
                </a>
            </li>
            <li class="sidebar-item">
                <a href="#" class="sidebar-link">
                    <i class="lni lni-cog"></i>
                    <span>Configuración</span>
                </a>
            </li>
        </ul>
        <!-- Sidebar Navigation Ends -->
        <div class="sidebar-footer">
            <a href="#" class="sidebar-link">
                <i class="lni lni-exit"></i>
                <span>Cerrar sesión</span>
            </a>
        </div>
    </aside>
    <!-- Sidebar Ends -->
    <!-- Main Component -->
    <div class="main">
        <nav class="navbar navbar-expand">
            <button class="toggler-btn" type="button">
                <svg width="32" height="32" viewBox="0 0 25 24" fill="#000000" xmlns="http://www.w3.org/2000/svg" transform="rotate(180 0 0) scale(-1, 1) translate(-0, 0) scale(1, -1) translate(0, -0)">
                    <path d="M3.5625 6C3.5625 5.58579 3.89829 5.25 4.3125 5.25H20.3125C20.7267 5.25 21.0625 5.58579 21.0625 6C21.0625 6.41421 20.7267 6.75 20.3125 6.75L4.3125 6.75C3.89829 6.75 3.5625 6.41422 3.5625 6Z" fill="#000000"/>
                    <path d="M3.5625 18C3.5625 17.5858 3.89829 17.25 4.3125 17.25L20.3125 17.25C20.7267 17.25 21.0625 17.5858 21.0625 18C21.0625 18.4142 20.7267 18.75 20.3125 18.75L4.3125 18.75C3.89829 18.75 3.5625 18.4142 3.5625 18Z" fill="#000000"/>
                    <path d="M4.3125 11.25C3.89829 11.25 3.5625 11.5858 3.5625 12C3.5625 12.4142 3.89829 12.75 4.3125 12.75L20.3125 12.75C20.7267 12.75 21.0625 12.4142 21.0625 12C21.0625 11.5858 20.7267 11.25 20.3125 11.25L4.3125 11.25Z" fill="#000000"/>
                </svg>
            </button>
        </nav>
        <main class="p-3">
            <!-- Content -->
            <div class="container-fluid px-4">
                <h1 class="mt-4">Editar Proveedor</h1>


                <!-- Cargar datos del cliente -->
                <%
                    int customerId = Integer.parseInt(request.getParameter("id"));
                    CustomerController customerController = new CustomerController();
                    Customer customer = customerController.buscarClientePorId(customerId);
                %>


                <!-- Formulario para editar el cliente -->
                <div class="card mb-4">
                    <div class="card-header">
                        Editar Proveedor
                    </div>
                    <div class="card-body">
                        <form action="CustomerServlet" method="post" accept-charset="UTF-8">
                            <input type="hidden" name="action" value="edit">
                            <input type="hidden" name="id" value="<%= customer.getCustomerId() %>">
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="name" class="form-label">Nombre</label>
                                    <input type="text" class="form-control" id="name" name="name" value="<%= customer.getName() %>" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="lastName" class="form-label">Apellido</label>
                                    <input type="text" class="form-control" id="lastName" name="lastName" value="<%= customer.getLastName() %>" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="address" class="form-label">Dirección</label>
                                    <input type="text" class="form-control" id="address" name="address" value="<%= customer.getAddress() %>" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="phone" class="form-label">Teléfono</label>
                                    <input type="text" class="form-control" id="phone" name="phone" value="<%= customer.getPhone() %>" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="email" class="form-label">Email</label>
                                    <input type="email" class="form-control" id="email" name="email" value="<%= customer.getEmail() %>" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="dni" class="form-label">DNI</label>
                                    <input type="text" class="form-control" id="dni" name="dni" value="<%= customer.getDni() %>" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label for="status" class="form-label">Estado</label>
                                    <select class="form-control" id="status" name="status">
                                        <option value="A" <%= (customer.getStatus() == 'A' ? "selected" : "") %>>Activo</option>
                                        <option value="I" <%= (customer.getStatus() == 'I' ? "selected" : "") %>>Inactivo</option>
                                    </select>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-success">Guardar Cambios</button>
                            <a href="listadoProveedores.jsp" class="btn btn-secondary">Cancelar</a>
                        </form>
                    </div>
                </div>
            </div>





        </main>


<script>
    function openEditProductModal(productData) {
        // Rellenar los campos del formulario con los datos del producto
        document.getElementById('comercialName').value = productData.comercialName;
        // Rellena el resto de campos según productData

        // Mostrar el modal
        $('#addProductModal').modal('show');
    }


</script>
<script src="./js/jquery-3.7.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="./js/script.js"></script>
<script src="./js/validaciones.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
</body>
</html>
