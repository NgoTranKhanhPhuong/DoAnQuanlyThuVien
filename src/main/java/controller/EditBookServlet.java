package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditBookServlet")
public class EditBookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/Thuvien_database";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "09042004";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Lấy dữ liệu từ form
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String quantityStr = request.getParameter("quantity");
        
        // Kiểm tra dữ liệu hợp lệ
        if (id == null || id.isEmpty() || name == null || name.isEmpty() || quantityStr == null || quantityStr.isEmpty()) {
            response.getWriter().write("{\"message\":\"Dữ liệu không hợp lệ!\"}");
            return;
        }

        int quantity;
        try {
            quantity = Integer.parseInt(quantityStr); // Chuyển đổi số lượng thành int
        } catch (NumberFormatException e) {
            response.getWriter().write("{\"message\":\"Số lượng không hợp lệ!\"}");
            return;
        }

        // Khai báo kết nối và PreparedStatement
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Kết nối cơ sở dữ liệu
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Cập nhật thông tin sách
            String sql = "UPDATE Sach SET nameSach = ?, soluong = ? WHERE idSach = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setInt(2, quantity);
            stmt.setString(3, id);

            // Thực thi câu lệnh và kiểm tra kết quả
            int rowsAffected = stmt.executeUpdate();

            // Trả về kết quả
            if (rowsAffected > 0) {
                response.getWriter().write("{\"message\":\"Cập nhật thông tin sách thành công.\"}");
            } else {
                response.getWriter().write("{\"message\":\"Không tìm thấy sách cần cập nhật.\"}");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("{\"message\":\"Lỗi xảy ra khi cập nhật thông tin sách.\"}");
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
