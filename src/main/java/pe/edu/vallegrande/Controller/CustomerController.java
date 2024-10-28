package pe.edu.vallegrande.Controller;

import pe.edu.vallegrande.dto.Customer;
import pe.edu.vallegrande.db.ConexionDB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerController {

    /* Listar todos los clientes */
    public List<Customer> listarTodos() {
        List<Customer> customerList = new ArrayList<>();
        try (Connection connection = ConexionDB.getConnection();
             Statement stmt = connection.createStatement()) {

            String query = "SELECT * FROM Customer WHERE status = 'A'";
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                Customer customer = new Customer(
                        rs.getInt("customer_id"),
                        rs.getString("name"),
                        rs.getString("lastName"),
                        rs.getString("address"),
                        rs.getString("phone"),
                        rs.getString("email"),
                        rs.getString("dni"),
                        rs.getString("status").charAt(0)
                );
                customerList.add(customer);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return customerList;
    }

    /* Listar todos los clientes inactivos */
    public List<Customer> listarInactivos() {
        List<Customer> inactiveCustomers = new ArrayList<>();
        String query = "SELECT * FROM Customer WHERE status = 'I'";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Customer customer = new Customer(
                        rs.getInt("customer_id"),
                        rs.getString("name"),
                        rs.getString("lastName"),
                        rs.getString("address"),
                        rs.getString("phone"),
                        rs.getString("email"),
                        rs.getString("dni"),
                        rs.getString("status").charAt(0)
                );
                inactiveCustomers.add(customer);
            }
        } catch (Exception e) {
            System.out.println("Error al listar clientes inactivos.");
            e.printStackTrace();
        }
        return inactiveCustomers;
    }


    /* Cambiar estado de cliente de 'A' a 'I' */
    public void reactivarCliente(int id) {
        String query = "UPDATE Customer SET status = 'A' WHERE customer_id = ? AND status = 'I'";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, id);

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Cliente reactivado exitosamente.");
            } else {
                System.out.println("No se encontró un cliente inactivo con el ID especificado.");
            }
        } catch (Exception e) {
            System.out.println("Error al reactivar el cliente.");
            e.printStackTrace();
        }
    }


    /* Agregar un nuevo cliente */
    public void agregarCliente(Customer customer) {
        String query = "INSERT INTO Customer (name, lastName, address, phone, email, dni, Status) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, customer.getName());
            pstmt.setString(2, customer.getLastName());
            pstmt.setString(3, customer.getAddress());
            pstmt.setString(4, customer.getPhone());
            pstmt.setString(5, customer.getEmail());
            pstmt.setString(6, customer.getDni());
            pstmt.setString(7, String.valueOf(customer.getStatus()));

            pstmt.executeUpdate();
            System.out.println("Cliente creado exitosamente.");
        } catch (Exception e) {
            System.out.println("Error al crear el cliente.");
            e.printStackTrace();
        }
    }

    /* Editar un cliente existente */
    public void editarCliente(Customer customer) {
        String query = "UPDATE Customer SET name = ?, lastName = ?, address = ?, phone = ?, email = ?, dni = ?, Status = ? WHERE customer_id = ?";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, customer.getName());
            pstmt.setString(2, customer.getLastName());
            pstmt.setString(3, customer.getAddress());
            pstmt.setString(4, customer.getPhone());
            pstmt.setString(5, customer.getEmail());
            pstmt.setString(6, customer.getDni());
            pstmt.setString(7, String.valueOf(customer.getStatus()));
            pstmt.setInt(8, customer.getCustomerId());

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Cliente actualizado exitosamente.");
            } else {
                System.out.println("No se encontró un cliente con el ID especificado.");
            }
        } catch (Exception e) {
            System.out.println("Error al actualizar el cliente.");
            e.printStackTrace();
        }
    }

    /* Buscar un cliente por ID */
    public Customer buscarClientePorId(int id) {
        Customer customer = null;
        String query = "SELECT * FROM Customer WHERE customer_id = ?";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                customer = new Customer(
                        rs.getInt("customer_id"),
                        rs.getString("name"),
                        rs.getString("lastName"),
                        rs.getString("address"),
                        rs.getString("phone"),
                        rs.getString("email"),
                        rs.getString("dni"),
                        rs.getString("status").charAt(0)
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    /* Cambiar estado de un cliente a 'I' (inactivo) */
    public void eliminarCliente(int id) {
        String query = "UPDATE Customer SET status = 'I' WHERE customer_id = ?";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, id);

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Proveedor desactivado exitosamente.");
            } else {
                System.out.println("No se encontró un cliente con el ID especificado.");
            }
        } catch (Exception e) {
            System.out.println("Error al desactivar el cliente.");
            e.printStackTrace();
        }
    }

}
