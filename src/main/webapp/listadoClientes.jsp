<%@ page import="pe.edu.vallegrande.dto.Customer" %>
<%@ page import="pe.edu.vallegrande.Controller.CustomerController" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- UTF-8 habilitado -->
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8" /> <!-- Codificación UTF-8 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Listado de Clientes</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        /* Estilos Generales */
        body, html {
            height: 100%;
        }

        #wrapper {
            display: flex;
            min-height: 100vh;
        }

        #sidebar-wrapper {
            min-width: 250px;
            max-width: 250px;
            background-color: #1e2125;
            padding-top: 20px;
            position: fixed;
            height: 100%;
        }

        #sidebar-wrapper .list-group-item {
            background-color: #1e2125;
            color: #c9c9c9;
            border: none;
            padding: 15px;
            font-size: 1.1em;
        }

        #sidebar-wrapper .list-group-item:hover {
            background-color: #343a40;
            color: #fff;
        }

        #sidebar-wrapper .list-group-item.active {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }

        #page-content-wrapper {
            width: 100%;
            padding: 20px;
            margin-left: 250px;
        }

        .navbar {
            background-color: #343a40;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .table {
            border-collapse: separate;
            border-spacing: 0 15px;
        }

        .table td, .table th {
            padding: 12px;
            vertical-align: middle;
        }

        .table thead th {
            background-color: #007bff;
            color: white;
            border: none;
        }

        .table tbody tr {
            background-color: #f8f9fa;
            border-radius: 12px;
        }

        .table tbody tr:hover {
            background-color: #e9ecef;
        }

        .table tbody td {
            border-top: none;
            border-bottom: none;
        }

        .card {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>

<body>

<div id="wrapper">
    <div id="sidebar-wrapper" class="bg-dark">
        <div class="sidebar-heading text-center py-4 text-light fs-4 fw-bold">
            <i class="fas fa-user me-2"></i>CustomerApp
        </div>
        <div class="list-group list-group-flush">
            <a href="listadoClientes.jsp" class="list-group-item list-group-item-action active">Inicio</a>
            <a href="listadoProveedores.jsp" class="list-group-item list-group-item-action">Proveedores</a>
            <a href="listadoClientes.jsp" class="list-group-item list-group-item-action">Clientes</a>
        </div>
    </div>

    <div id="page-content-wrapper">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand ms-3" href="#">CustomerApp</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link text-light" href="#">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-light" href="#">Perfil</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-light" href="#">Salir</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container-fluid px-4">
            <h1 class="mt-4">Listado de Clientes</h1>

            <!-- Card para agregar un nuevo cliente -->
            <div class="card mb-4">
                <div class="card-header">
                    Registrar Cliente
                </div>
                <div class="card-body">
                    <form action="CustomerServlet" method="post" accept-charset="UTF-8">
                        <input type="hidden" name="action" value="add">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="name">Nombre</label>
                                <input type="text" class="form-control" id="name" name="name" placeholder="Nombre del cliente" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="lastName">Apellido</label>
                                <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Apellido del cliente" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="address">Dirección</label>
                                <input type="text" class="form-control" id="address" name="address" placeholder="Dirección" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="phone">Teléfono</label>
                                <input type="text" class="form-control" id="phone" name="phone" placeholder="Teléfono" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="email">Email</label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="Email" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="dni">DNI</label>
                                <input type="text" class="form-control" id="dni" name="dni" placeholder="DNI" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="status">Estado</label>
                                <select class="form-control" id="status" name="status">
                                    <option value="A">Activo</option>
                                    <option value="I">Inactivo</option>
                                </select>
                            </div>
                        </div>
                        <button type="submit" class="btn btn-success">Agregar Cliente</button>
                    </form>
                </div>
            </div>

            <!-- Card para listado de clientes -->
            <div class="card mb-4">
                <div class="card-header">
                    Clientes
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Dirección</th>
                                <th>Teléfono</th>
                                <th>Email</th>
                                <th>DNI</th>
                                <th>Estado</th>
                                <th>Acciones</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                CustomerController customerController = new CustomerController();
                                List<Customer> customers = customerController.listarTodos();

                                if (customers.isEmpty()) {
                            %>
                            <tr>
                                <td colspan="9" class="text-center">No hay clientes disponibles por el momento.</td>
                            </tr>
                            <%
                            } else {
                                for (Customer customer : customers) {
                            %>
                            <tr>
                                <td><%= customer.getCustomerId() %></td>
                                <td><%= customer.getName() %></td>
                                <td><%= customer.getLastName() %></td>
                                <td><%= customer.getAddress() %></td>
                                <td><%= customer.getPhone() %></td>
                                <td><%= customer.getEmail() %></td>
                                <td><%= customer.getDni() %></td>
                                <td><%= customer.getStatus() %></td>
                                <td>
                                    <!-- Botón Editar -->
                                    <a href="editarCliente.jsp?id=<%= customer.getCustomerId() %>" class="btn btn-primary btn-sm">Editar</a>
                                    <!-- Botón Eliminar -->
                                    <a href="CustomerServlet?action=delete&id=<%= customer.getCustomerId() %>" class="btn btn-danger btn-sm">Eliminar</a>
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
        </div>

    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
