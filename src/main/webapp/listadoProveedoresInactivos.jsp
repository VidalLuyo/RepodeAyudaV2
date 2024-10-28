<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="pe.edu.vallegrande.service.*" %>
<%@ page import="pe.edu.vallegrande.dto.*" %>
<%@ page import="pe.edu.vallegrande.Controller.SuppliersController" %>
<%@ page import="pe.edu.vallegrande.Controller.CustomerController" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.lineicons.com/5.0/lineicons.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link rel="stylesheet" href="https://cdn.lineicons.com/3.0.0/lineicons.css">
    <title>Registrar Proveedor</title>
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
                <a href="#" class="sidebar-link collapsed has-dropdown" data-bs-toggle="collapse" data-bs-target="#auth">
                    <i class="lni lni-folder"></i>
                    <span>Listado de Proveedores</span>
                </a>
                <ul id="auth" class="sidebar-dropdown list-unstyled collapse">
                    <li class="sidebar-item">
                        <a href="listadoProveedores.jsp" class="sidebar-link">Proveedores</a>
                    </li>
                    <li class="sidebar-item">
                        <a href="listadoProveedoresInactivos.jsp" class="sidebar-link">Proveedores Inactivos</a>
                    </li>
                </ul>
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
                <svg width="32" height="32" viewBox="0 0 25 24" fill="#000000" xmlns="http://www.w3.org/2000/svg">
                    <path d="M3.5625 6C3.5625 5.58579 3.89829 5.25 4.3125 5.25H20.3125C20.7267 5.25 21.0625 5.58579 21.0625 6C21.0625 6.41421 20.7267 6.75 20.3125 6.75L4.3125 6.75C3.89829 6.75 3.5625 6.41422 3.5625 6Z" fill="#000000"/>
                    <path d="M3.5625 18C3.5625 17.5858 3.89829 17.25 4.3125 17.25L20.3125 17.25C20.7267 17.25 21.0625 17.5858 21.0625 18C21.0625 18.4142 20.7267 18.75 20.3125 18.75L4.3125 18.75C3.89829 18.75 3.5625 18.4142 3.5625 18Z" fill="#000000"/>
                    <path d="M4.3125 11.25C3.89829 11.25 3.5625 11.5858 3.5625 12C3.5625 12.4142 3.89829 12.75 4.3125 12.75L20.3125 12.75C20.7267 12.75 21.0625 12.4142 21.0625 12C21.0625 11.5858 20.7267 11.25 20.3125 11.25L4.3125 11.25Z" fill="#000000"/>
                </svg>
            </button>
        </nav>

        <main class="p-3">


            <div class="card mb-4">
                <div class="card-header">
                    Proveedores
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>DNI</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Dirección</th>
                                <th>Teléfono</th>
                                <th>Email</th>
                                <th>Estado</th>
                                <th>Acciones</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                CustomerController suppliersController = new CustomerController();
                                List<Customer> customers = suppliersController.listarInactivos();

                                if (customers.isEmpty()) {
                            %>
                            <tr>
                                <td colspan="8" class="text-center">No hay proveedores disponibles por el momento.</td>
                            </tr>
                            <%
                            } else {
                                for (Customer customer : customers) {
                            %>
                            <tr>
                                <td><%= customer.getDni() %></td>
                                <td><%= customer.getName() %></td>
                                <td><%= customer.getLastName() %></td>
                                <td><%= customer.getAddress() %></td>
                                <td><%= customer.getPhone() %></td>
                                <td><%= customer.getEmail() %></td>
                                <td><%= customer.getStatus() %></td>
                                <td>
                                    <a href="CustomerServlet?action=reactivate&id=<%= customer.getCustomerId() %>" class="btn btn-success btn-sm">Reactivar</a>

                                    <a href="listadoProveedoresInactivos.jsp" class="btn btn-danger btn-sm">Eliminar</a>
                                </td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
</body>
</html>

