package pe.edu.vallegrande.test.customer;

import pe.edu.vallegrande.Controller.CustomerController;
import pe.edu.vallegrande.dto.Customer;

public class EditarCliente {

    public static void main(String[] args) {
        CustomerController customerController = new CustomerController();

        Customer clienteEditado = new Customer();
        clienteEditado.setCustomerId(2);
        clienteEditado.setName("Carlos");
        clienteEditado.setLastName("Gomez");
        clienteEditado.setAddress("Jr. Independencia 456");
        clienteEditado.setPhone("987123456");
        clienteEditado.setEmail("carlos.gomez@example.com");
        clienteEditado.setDni("87654321");
        clienteEditado.setStatus('I');

        customerController.editarCliente(clienteEditado);
    }
}
