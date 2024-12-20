package controller;

import java.io.IOException;
import java.sql.Connection;
//import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
//import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddStudentServlet")
public class AddStudentServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin từ form
        String maSV = request.getParameter("MaSV");
        String hoVaTen = request.getParameter("HoVaTen");
        String gioiTinh = request.getParameter("GioiTinh");
        if (gioiTinh == null || gioiTinh.isEmpty() || (!gioiTinh.equals("Nam") && !gioiTinh.equals("Nữ"))) {
            gioiTinh = "Nam"; // Hoặc giá trị mặc định hợp lệ, nếu cần
        }

        String ngaySinh = request.getParameter("NgaySinh");
        String maLop = request.getParameter("MaLop");
        String soDienThoai = request.getParameter("SoDienThoai");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Kết nối cơ sở dữ liệu
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Thuvien_database?useUnicode=true&characterEncoding=UTF-8", "root", "09042004");

            // SQL insert
            String sql = "INSERT INTO docgia (MaSV, HoVaTen, GioiTinh, NgaySinh, MaLop, SoDienThoai) VALUES (?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, maSV);
            stmt.setString(2, hoVaTen);
            stmt.setString(3, gioiTinh);  // Kiểm tra xem giá trị có hợp lệ không
            stmt.setString(4, ngaySinh);  // Chuyển định dạng ngày theo yêu cầu của cơ sở dữ liệu
            stmt.setString(5, maLop);
            stmt.setString(6, soDienThoai);

            // Thực thi câu lệnh
            int result = stmt.executeUpdate();
            if (result > 0) {
                response.sendRedirect("InforDocgia.jsp"); // Chuyển hướng đến trang xem sinh viên
            } else {
                request.setAttribute("message", "Đã xảy ra lỗi trong quá trình thêm sinh viên");
                request.getRequestDispatcher("AddStudent.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Đã xảy ra lỗi trong quá trình thêm sinh viên: " + e.getMessage());
            request.getRequestDispatcher("AddStudent.jsp").forward(request, response);
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

