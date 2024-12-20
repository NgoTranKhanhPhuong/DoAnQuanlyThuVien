package controller;

import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UpdateStudentServlet")
public class UpdateStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/Thuvien_database";
    private static final String USER = "root";
    private static final String PASSWORD = "09042004";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Api go update student");
        // Set character encoding to UTF-8 for correct handling of special characters
        request.setCharacterEncoding("UTF-8");

        // Lấy dữ liệu từ form
        String maSV = request.getParameter("maSV");
        String hoVaTen = request.getParameter("hoVaTen");
        String gioiTinh = request.getParameter("gioiTinh");
        String ngaySinh = request.getParameter("ngaySinh");
        String maLop = request.getParameter("maLop");
        String soDienThoai = request.getParameter("soDienThoai");

        // Kiểm tra dữ liệu đầu vào
        if (hoVaTen == null || hoVaTen.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Họ và tên không được để trống.");
            return;
        }
        if (gioiTinh == null || (!gioiTinh.equals("Nam") && !gioiTinh.equals("Nữ"))) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Giới tính không hợp lệ.");
            return;
        }
        if (soDienThoai == null || soDienThoai.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Số điện thoại không được để trống.");
            return;
        }

        // Validate phone number (example format: 09xxxxxxxx)
        if (!soDienThoai.matches("^09\\d{8}$")) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Số điện thoại không hợp lệ.");
            return;
        }

        // Kết nối và cập nhật thông tin sinh viên
        try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement("UPDATE docgia SET HoVaTen = ?, GioiTinh = ?, NgaySinh = ?, MaLop = ?, SoDienThoai = ? WHERE MaSV = ?")) {

            // Cập nhật thông tin sinh viên
            stmt.setString(1, hoVaTen);
            stmt.setString(2, gioiTinh);
            stmt.setString(3, ngaySinh);
            stmt.setString(4, maLop);
            stmt.setString(5, soDienThoai);
            stmt.setString(6, maSV);

            // Thực hiện cập nhật
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                // Redirect with a success message
                response.sendRedirect("InforDocgia.jsp?message=Update successful");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Cập nhật không thành công.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi cập nhật thông tin: " + e.getMessage());
        }
    }
    @Override
    public void destroy() {
        super.destroy();
        // Nếu có tài nguyên mở nào khác cần giải phóng, xử lý tại đây
        System.out.println("Servlet UpdateStudentServlet bị dừng.");
    }

}