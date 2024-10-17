package pe.edu.vallegrande.service;

import pe.edu.vallegrande.Controller.SuppliersController;
import pe.edu.vallegrande.dto.Suppliers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/SuppliersServlet")
public class SuppliersServlet extends HttpServlet {

    private SuppliersController suppliersController = new SuppliersController();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Establecer la codificación en UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            // Eliminar proveedor
            int suppliersId = Integer.parseInt(request.getParameter("id"));
            suppliersController.eliminarProveedor(suppliersId);
            response.sendRedirect("listadoProveedores.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Establecer la codificación en UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            // Agregar un nuevo proveedor
            String name = request.getParameter("name");
            String lastName = request.getParameter("lastName");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String dni = request.getParameter("dni");

            // Verificar si el status fue enviado
            String statusParam = request.getParameter("status");
            char status = (statusParam != null && !statusParam.isEmpty()) ? statusParam.charAt(0) : 'A'; // Valor por defecto 'A'

            Suppliers nuevoProveedor = new Suppliers();
            nuevoProveedor.setName(name);
            nuevoProveedor.setLastName(lastName);
            nuevoProveedor.setPhone(phone);
            nuevoProveedor.setEmail(email);
            nuevoProveedor.setDni(dni);
            nuevoProveedor.setStatus(status);

            suppliersController.agregarProveedor(nuevoProveedor);
            response.sendRedirect("listadoProveedores.jsp");

        } else if ("edit".equals(action)) {
            // Editar un proveedor existente
            int suppliersId = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String lastName = request.getParameter("lastName");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String dni = request.getParameter("dni");

            // Verificar si el status fue enviado
            String statusParam = request.getParameter("status");
            char status = (statusParam != null && !statusParam.isEmpty()) ? statusParam.charAt(0) : 'A'; // Valor por defecto 'A'

            Suppliers proveedorEditado = new Suppliers();
            proveedorEditado.setSuppliersId(suppliersId);
            proveedorEditado.setName(name);
            proveedorEditado.setLastName(lastName);
            proveedorEditado.setPhone(phone);
            proveedorEditado.setEmail(email);
            proveedorEditado.setDni(dni);
            proveedorEditado.setStatus(status);

            suppliersController.editarProveedor(proveedorEditado);
            response.sendRedirect("listadoProveedores.jsp");
        }
    }
}
