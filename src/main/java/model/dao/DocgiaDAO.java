package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.DriverManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.DriverManager;

public class DocgiaDAO<Docgia> {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/thuvien_database"; // URL của CSDL
    private static final String DB_USER = "root"; // Tên người dùng CSDL
    private static final String DB_PASSWORD = "password"; // Mật khẩu CSDL
    
    public List<Docgia> getAllDocgia(){
    	List<Docgia> list = new ArrayList<>();
		return list;
    }

    public static boolean deleteDocGia(String maSV) {
        // Kết nối CSDL
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            // Bắt đầu giao dịch (transaction) để đảm bảo tính toàn vẹn dữ liệu
            conn.setAutoCommit(false);
            
            // Xóa các bản ghi trong bảng phieumuon trước
            String deletePhieuMuonSQL = "DELETE FROM phieumuon WHERE MaSV = ?";
            try (PreparedStatement stmt1 = conn.prepareStatement(deletePhieuMuonSQL)) {
                stmt1.setString(1, maSV);
                int rowsAffected = stmt1.executeUpdate();
                System.out.println("Số bản ghi bị xóa trong phieumuon: " + rowsAffected);
            }

            // Sau đó xóa bản ghi trong bảng docgia
            String deleteDocGiaSQL = "DELETE FROM docgia WHERE MaSV = ?";
            try (PreparedStatement stmt2 = conn.prepareStatement(deleteDocGiaSQL)) {
                stmt2.setString(1, maSV);
                int rowsAffected = stmt2.executeUpdate();
                System.out.println("Số bản ghi bị xóa trong docgia: " + rowsAffected);
            }

            // Commit giao dịch nếu không có lỗi
            conn.commit();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}


