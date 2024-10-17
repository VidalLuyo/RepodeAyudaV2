package pe.edu.vallegrande.test.customer;

import pe.edu.vallegrande.Controller.CustomerController;
import pe.edu.vallegrande.dto.Customer;

import java.util.List;

public class Listar{

    public static void main(String[] args) {
        CustomerController controller = new CustomerController();
        List<Customer> clientes = controller.listarTodos();

        System.out.println("Lista de Clientes:");
        for (Customer customer : clientes) {
            System.out.println("ID: " + customer.getCustomerId());
            System.out.println("Nombre: " + customer.getName());
            System.out.println("Apellido: " + customer.getLastName());
            System.out.println("Dirección: " + customer.getAddress());
            System.out.println("Teléfono: " + customer.getPhone());
            System.out.println("Email: " + customer.getEmail());
            System.out.println("DNI: " + customer.getDni());
            System.out.println("Estado: " + customer.getStatus());
        }
    }
}
