package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteBookServlet
 */
@WebServlet("/DeleteBookServlet")
public class DeleteBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/Thuvien_database";
    private static final String USER = "root";
    private static final String PASSWORD = "09042004";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	System.out.println("api go delete book");
        String id = request.getParameter("id");

        Connection conn = null;
        PreparedStatement stmt = null;

        if (id == null || id.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Mã sach khong hop le");
            return;
        }

        try {
            // Kết nối cơ sở dữ liệu
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);

            // SQL xóa sinh viên theo MaSV
            String sql = "DELETE FROM sach WHERE idSach = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, id);

            // Thực thi câu lệnh xóa
            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                // Nếu xóa thành công, chuyển hướng đến trang danh sách sinh viên
                response.sendRedirect("InforSachs.jsp");  // Trang hiển thị danh sách sinh viên
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
