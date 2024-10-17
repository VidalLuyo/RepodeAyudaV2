package pe.edu.vallegrande.test.customer;


import pe.edu.vallegrande.Controller.CustomerController;

public class EliminarProducto {

    public static void main(String[] args) {
        CustomerController ClientController = new CustomerController();

        int id = 1;
        ClientController.eliminarCliente(id);
    }
}