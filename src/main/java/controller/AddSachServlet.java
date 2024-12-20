package controller;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/AddSachServlet")
public class AddSachServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy dữ liệu từ form
        String nameSach = request.getParameter("nameSach");
        String soluongStr = request.getParameter("soluong");
        String idTheloai = request.getParameter("idTheloai");
        String tacgia = request.getParameter("tacgia");

        // Kiểm tra các tham số có hợp lệ không
        if (nameSach == null || nameSach.isEmpty() || soluongStr == null || soluongStr.isEmpty() || idTheloai == null || idTheloai.isEmpty() || tacgia == null || tacgia.isEmpty()) {
            response.getWriter().write("Vui lòng điền đầy đủ thông tin.");
            return; // Dừng lại nếu có trường dữ liệu bị thiếu
        }

        // Kiểm tra số lượng có phải là số hợp lệ không
        int soluong = 0;
        try {
            soluong = Integer.parseInt(soluongStr);
        } catch (NumberFormatException e) {
            response.getWriter().write("Số lượng phải là một số hợp lệ.");
            return; // Dừng lại nếu không thể chuyển đổi số lượng
        }

        // Kết nối cơ sở dữ liệu
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Kết nối cơ sở dữ liệu
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Thuvien_database", "root", "09042004");

            // lay id cho data moi
            String query = "SELECT MAX(idSach) + 1 AS next_id FROM sach";
			PreparedStatement ps = conn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			int nextId = 1;
			if (rs.next()) {
		        nextId = rs.getInt("next_id");
		    }
			System.out.println(nextId);
			
            // Câu lệnh SQL để thêm sách
            String sql = "INSERT INTO Sach (idSach, nameSach, soluong, idTheloai, tacgia) VALUES (?, ?, ?, ?, ?)";

            // Chuẩn bị câu lệnh SQL
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, nextId);
            stmt.setString(2, nameSach);
            stmt.setInt(3, soluong);
            stmt.setString(4, idTheloai);
            stmt.setString(5, tacgia);

            // Thực thi câu lệnh
            int rowsAffected = stmt.executeUpdate();

            // Kiểm tra xem câu lệnh có ảnh hưởng tới cơ sở dữ liệu không
            if (rowsAffected > 0) {
            	response.sendRedirect("InforSachs.jsp");
                response.getWriter().write("Thêm sách thành công!");
            } else {
                response.getWriter().write("Thêm sách không thành công.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Có lỗi xảy ra: " + e.getMessage());
        } finally {
            // Đóng kết nối và tài nguyên
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
    }
}

