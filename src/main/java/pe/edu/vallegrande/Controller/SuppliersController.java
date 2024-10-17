package pe.edu.vallegrande.Controller;

import pe.edu.vallegrande.dto.Suppliers;
import pe.edu.vallegrande.db.ConexionDB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SuppliersController {

    /* Listar todos los proveedores */
    public List<Suppliers> listarTodos() {
        List<Suppliers> suppliersList = new ArrayList<>();
        try (Connection connection = ConexionDB.getConnection();
             Statement stmt = connection.createStatement()) {

            String query = "SELECT * FROM Suppliers";
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                Suppliers supplier = new Suppliers(
                        rs.getInt("suppliers_id"),
                        rs.getString("name"),
                        rs.getString("lastName"),
                        rs.getString("phone"),
                        rs.getString("email"),
                        rs.getString("dni"),
                        rs.getString("status").charAt(0)
                );
                suppliersList.add(supplier);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return suppliersList;
    }

    /* Agregar un nuevo proveedor */
    public void agregarProveedor(Suppliers supplier) {
        String query = "INSERT INTO Suppliers (name, lastName, phone, email, dni, Status) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, supplier.getName());
            pstmt.setString(2, supplier.getLastName());
            pstmt.setString(3, supplier.getPhone());
            pstmt.setString(4, supplier.getEmail());
            pstmt.setString(5, supplier.getDni());
            pstmt.setString(6, String.valueOf(supplier.getStatus()));

            pstmt.executeUpdate();
            System.out.println("Proveedor creado exitosamente.");
        } catch (Exception e) {
            System.out.println("Error al crear el proveedor.");
            e.printStackTrace();
        }
    }

    /* Editar un proveedor existente */
    public void editarProveedor(Suppliers supplier) {
        String query = "UPDATE Suppliers SET name = ?, lastName = ?, phone = ?, email = ?, dni = ?, Status = ? WHERE suppliers_id = ?";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setString(1, supplier.getName());
            pstmt.setString(2, supplier.getLastName());
            pstmt.setString(3, supplier.getPhone());
            pstmt.setString(4, supplier.getEmail());
            pstmt.setString(5, supplier.getDni());
            pstmt.setString(6, String.valueOf(supplier.getStatus()));
            pstmt.setInt(7, supplier.getSuppliersId());

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Proveedor actualizado exitosamente.");
            } else {
                System.out.println("No se encontró un proveedor con el ID especificado.");
            }
        } catch (Exception e) {
            System.out.println("Error al actualizar el proveedor.");
            e.printStackTrace();
        }
    }

    /* Buscar un proveedor por ID */
    public Suppliers buscarProveedorPorId(int id) {
        Suppliers supplier = null;
        String query = "SELECT * FROM Suppliers WHERE suppliers_id = ?";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                supplier = new Suppliers(
                        rs.getInt("suppliers_id"),
                        rs.getString("name"),
                        rs.getString("lastName"),
                        rs.getString("phone"),
                        rs.getString("email"),
                        rs.getString("dni"),
                        rs.getString("status").charAt(0)
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return supplier;
    }

    /* Eliminar un proveedor */
    public void eliminarProveedor(int id) {
        String query = "DELETE FROM Suppliers WHERE suppliers_id = ?";

        try (Connection connection = ConexionDB.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(query)) {

            pstmt.setInt(1, id);

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Proveedor eliminado exitosamente.");
            } else {
                System.out.println("No se encontró un proveedor con el ID especificado.");
            }
        } catch (Exception e) {
            System.out.println("Error al eliminar el proveedor.");
            e.printStackTrace();
        }
    }
}
