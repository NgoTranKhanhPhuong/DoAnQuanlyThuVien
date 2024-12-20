package model.dao;

import model.bean.Sachs;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SachsDAO {

    // Database connection details
    private static final String URL = "jdbc:mysql://localhost:3306/Thuvien_database";
    private static final String USER = "root";
    private static final String PASSWORD = "Phuong13022004";

    // Method to get a connection to the database
    private Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Ensure the JDBC driver is loaded
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("JDBC Driver not found.", e);
        }
    }

    // Method to insert a new Sachs into the database
    public boolean insertSachs(Sachs sachs) {
        String sql = "INSERT INTO sach (idSach, nameSach, soluong, idTheloai, idTacgia) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, sachs.getIdSach());
            stmt.setString(2, sachs.getNameSach());
            stmt.setInt(3, sachs.getSoluong());
            stmt.setInt(4, sachs.getIdTheloai());
            stmt.setInt(5, sachs.getIdTacgia());
            return stmt.executeUpdate() > 0; // Returns true if the insert is successful
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to get all Sachs from the database
    public List<Sachs> getAllSachs() {
        List<Sachs> sachsList = new ArrayList<>();
        String sql = "SELECT * FROM sach";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Sachs sachs = new Sachs(
                        rs.getInt("idSach"),
                        rs.getString("nameSach"),
                        rs.getInt("soluong"),
                        rs.getInt("idTheloai"),
                        rs.getInt("idTacgia")
                );
                sachsList.add(sachs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sachsList;
    }

    // Method to get a Sachs by ID
    public Sachs getSachsById(int idSach) {
        String sql = "SELECT * FROM sach WHERE idSach = ?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idSach);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Sachs(
                            rs.getInt("idSach"),
                            rs.getString("nameSach"),
                            rs.getInt("soluong"),
                            rs.getInt("idTheloai"),
                            rs.getInt("idTacgia")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Return null if no Sachs found with the given id
    }

    // Method to update a Sachs
    public boolean updateSachs(Sachs sachs) {
        String sql = "UPDATE sach SET nameSach = ?, soluong = ?, idTheloai = ?, idTacgia = ? WHERE idSach = ?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, sachs.getNameSach());
            stmt.setInt(2, sachs.getSoluong());
            stmt.setInt(3, sachs.getIdTheloai());
            stmt.setInt(4, sachs.getIdTacgia());
            stmt.setInt(5, sachs.getIdSach());
            return stmt.executeUpdate() > 0; // Returns true if the update is successful
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to delete a Sachs by ID
    public boolean deleteSachs(int idSach) {
        String sql = "DELETE FROM sach WHERE idSach = ?";
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, idSach);
            return stmt.executeUpdate() > 0; // Returns true if the delete is successful
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
