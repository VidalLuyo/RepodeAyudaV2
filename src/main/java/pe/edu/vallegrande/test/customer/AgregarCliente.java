package pe.edu.vallegrande.test.customer;

import pe.edu.vallegrande.Controller.CustomerController;
import pe.edu.vallegrande.dto.Customer;

public class AgregarCliente {

    public static void main(String[] args) {
        CustomerController customerController = new CustomerController();

        // Crear un nuevo cliente
        Customer nuevoCliente = new Customer();
        nuevoCliente.setName("Juan");
        nuevoCliente.setLastName("Perez");
        nuevoCliente.setAddress("Av. Principal 123");
        nuevoCliente.setPhone("987654321");
        nuevoCliente.setEmail("juan.perez@example.com");
        nuevoCliente.setDni("12345678");
        nuevoCliente.setStatus('A');

        customerController.agregarCliente(nuevoCliente);
    }
}
