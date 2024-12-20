package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditStudentServlet")
public class EditStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/Thuvien_database?useUnicode=true&characterEncoding=UTF-8";
    private static final String USER = "root";
    private static final String PASSWORD = "09042004";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String maSV = request.getParameter("maSV");

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Kết nối đến cơ sở dữ liệu
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);

            // Lấy thông tin sinh viên từ cơ sở dữ liệu
            String sql = "SELECT * FROM docgia WHERE MaSV = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, maSV);
            rs = stmt.executeQuery();

            if (rs.next()) {
                // Truyền thông tin sinh viên vào request
                request.setAttribute("maSV", rs.getString("MaSV"));
                request.setAttribute("hoVaTen", rs.getString("HoVaTen"));
                request.setAttribute("gioiTinh", rs.getString("GioiTinh"));
                request.setAttribute("ngaySinh", rs.getDate("NgaySinh"));
                request.setAttribute("maLop", rs.getString("MaLop"));
                request.setAttribute("soDienThoai", rs.getString("SoDienThoai"));

                // Chuyển hướng đến trang sửa thông tin sinh viên
                request.getRequestDispatcher("EditStudent.jsp").forward(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Không tìm thấy sinh viên với mã này.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi khi lấy thông tin sinh viên.");
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
