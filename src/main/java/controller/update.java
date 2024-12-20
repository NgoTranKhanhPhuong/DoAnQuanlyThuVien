package controller;

import java.sql.*;
import java.io.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/update")
public class update extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/Thuvien_database";
    private static final String USER = "root";
    private static final String PASSWORD = "Phuong13022004";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String maSV = request.getParameter("maSV");
        String hoVaTen = request.getParameter("hoVaTen");
        String gioiTinh = request.getParameter("gioiTinh");
        String ngaySinhStr = request.getParameter("ngaySinh");
        String maLop = request.getParameter("maLop");
        String soDienThoai = request.getParameter("soDienThoai");

        // Chuyển đổi ngày sinh sang kiểu LocalDate
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate ngaySinh = LocalDate.parse(ngaySinhStr, formatter);

        try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(
                "UPDATE ThanhVien SET HoVaTen = ?, GioiTinh = ?, NgaySinh = ?, MaLop = ?, SoDienThoai = ? WHERE MaSV = ?")) {
            
            // Thiết lập tham số cho câu lệnh SQL
            stmt.setString(1, hoVaTen);
            stmt.setString(2, gioiTinh);
            stmt.setDate(3, Date.valueOf(ngaySinh)); // Chuyển đổi LocalDate thành java.sql.Date
            stmt.setString(4, maLop);
            stmt.setString(5, soDienThoai);
            stmt.setString(6, maSV);

            // Thực thi câu lệnh cập nhật
            int rowsUpdated = stmt.executeUpdate();

            if (rowsUpdated > 0) {
                // Cập nhật thành công, chuyển hướng về trang danh sách
                response.sendRedirect("InforDocgia");
            } else {
                // Nếu không có dòng nào bị cập nhật
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Không tìm thấy sinh viên với mã " + maSV);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi xử lý yêu cầu cập nhật.");
        }
    }
}
