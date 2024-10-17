package pe.edu.vallegrande.service;

import pe.edu.vallegrande.Controller.CustomerController;
import pe.edu.vallegrande.dto.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/CustomerServlet")
public class CustomerServlet extends HttpServlet {

    private CustomerController customerController = new CustomerController();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Establecer la codificación en UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String action = request.getParameter("action");

        if ("delete".equals(action)) {
            // Eliminar cliente
            int customerId = Integer.parseInt(request.getParameter("id"));
            customerController.eliminarCliente(customerId);
            response.sendRedirect("listadoClientes.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Establecer la codificación en UTF-8
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String action = request.getParameter("action");

        if ("add".equals(action)) {
            // Agregar un nuevo cliente
            String name = request.getParameter("name");
            String lastName = request.getParameter("lastName");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String dni = request.getParameter("dni");

            // Verificar si el status fue enviado
            String statusParam = request.getParameter("status");
            char status = (statusParam != null && !statusParam.isEmpty()) ? statusParam.charAt(0) : 'A'; // Valor por defecto 'A'

            Customer nuevoCliente = new Customer();
            nuevoCliente.setName(name);
            nuevoCliente.setLastName(lastName);
            nuevoCliente.setAddress(address);
            nuevoCliente.setPhone(phone);
            nuevoCliente.setEmail(email);
            nuevoCliente.setDni(dni);
            nuevoCliente.setStatus(status);

            customerController.agregarCliente(nuevoCliente);
            response.sendRedirect("listadoClientes.jsp");

        } else if ("edit".equals(action)) {
            // Editar un cliente existente
            int customerId = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String lastName = request.getParameter("lastName");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String dni = request.getParameter("dni");

            // Verificar si el status fue enviado
            String statusParam = request.getParameter("status");
            char status = (statusParam != null && !statusParam.isEmpty()) ? statusParam.charAt(0) : 'A'; // Valor por defecto 'A'

            Customer clienteEditado = new Customer();
            clienteEditado.setCustomerId(customerId);
            clienteEditado.setName(name);
            clienteEditado.setLastName(lastName);
            clienteEditado.setAddress(address);
            clienteEditado.setPhone(phone);
            clienteEditado.setEmail(email);
            clienteEditado.setDni(dni);
            clienteEditado.setStatus(status);

            customerController.editarCliente(clienteEditado);
            response.sendRedirect("listadoClientes.jsp");
        }
    }
}
