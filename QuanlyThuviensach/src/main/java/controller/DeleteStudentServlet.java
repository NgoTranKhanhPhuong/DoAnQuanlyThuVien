package controller;

import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteStudentServlet")
public class DeleteStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/Thuvien_database";
    private static final String USER = "root";
    private static final String PASSWORD = "09042004";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String maSV = request.getParameter("maSV");

        Connection conn = null;
        PreparedStatement stmt = null;

        if (maSV == null || maSV.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Mã sinh viên không hợp lệ.");
            return;
        }

        try {
            // Kết nối cơ sở dữ liệu
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);

            // SQL xóa sinh viên theo MaSV
            String sql = "DELETE FROM docgia WHERE MaSV = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, maSV);

            // Thực thi câu lệnh xóa
            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                // Nếu xóa thành công, chuyển hướng đến trang danh sách sinh viên
                response.sendRedirect("InforDocgia.jsp");  // Trang hiển thị danh sách sinh viên
            } else {
                // Nếu không tìm thấy sinh viên để xóa, hiển thị lỗi
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Không tìm thấy sinh viên để xóa.");
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi xử lý yêu cầu.");
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
}


