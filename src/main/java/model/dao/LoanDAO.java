package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class LoanDAO {
    private static final String URL = "jdbc:mysql://localhost:3306/Thuvien_database";
    private static final String USER = "root";
    private static final String PASSWORD = "09042004";
    
    public LoanDAO() {
        try {
            // Đảm bảo Driver JDBC được tải
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public boolean addLoan(String maSV, String idSach, String status, String ngayMuon, String ngayTra, String ngayPhaiTraSach) {
        String sql = "INSERT INTO phieumuon (MaSV, idSach, status, ngaymuon, ngaytra, ngayphaitrasach) VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
             
            stmt.setString(1, maSV);
            stmt.setString(2, idSach);
            stmt.setString(3, status); // Kiểm tra giá trị của 'status'
            stmt.setString(4, ngayMuon);
            stmt.setString(5, ngayTra); // Có thể NULL nếu ngày trả không có
            stmt.setString(6, ngayPhaiTraSach);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0; // Trả về true nếu có dòng được chèn thành công
        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Trả về false nếu có lỗi
        }
    }

}
