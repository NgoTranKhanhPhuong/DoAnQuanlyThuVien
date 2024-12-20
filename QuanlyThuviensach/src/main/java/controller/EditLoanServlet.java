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

/**
 * Servlet implementation class EditLoanServlet
 */
@WebServlet("/EditLoanServlet")
public class EditLoanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static final String DB_URL = "jdbc:mysql://localhost:3306/Thuvien_database";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "09042004";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	System.out.println("Api go edit loan");

        // Lấy dữ liệu từ form
        String id = request.getParameter("id");
        String maSV = request.getParameter("maSV");
        String idSach = request.getParameter("idSach");
        String ngayMuon = request.getParameter("ngayMuon");
        String ngayPhaiTra = request.getParameter("ngayPhaiTra");
        String ngayTra = request.getParameter("ngayTra");
        String status = request.getParameter("status");
        
        // Kiểm tra dữ liệu hợp lệ
        if (id == null || id.isEmpty() || maSV == null || maSV.isEmpty() || idSach == null || idSach.isEmpty()
        		|| ngayMuon == null || ngayMuon.isEmpty()|| ngayPhaiTra == null || ngayPhaiTra.isEmpty()
        		) {
            response.getWriter().write("{\"message\":\"Dữ liệu không hợp lệ!\"}");
            return;
        }

        // Todo: kiem tra masv la hop le.

        // Khai báo kết nối và PreparedStatement
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Kết nối cơ sở dữ liệu
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Cập nhật thông tin sách
            String sql = "UPDATE phieumuon SET maSV = ?, idSach = ?, ngayMuon = ?, ngayphaitrasach = ?, ngaytra = ?, status = ? WHERE idPhieumuon = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, maSV);
            stmt.setString(2, idSach);
            stmt.setString(3, ngayMuon);
            stmt.setString(4, ngayPhaiTra);
            stmt.setString(5, ngayTra);
            stmt.setString(6, status);
            stmt.setString(7, id);

            // Thực thi câu lệnh và kiểm tra kết quả
            int rowsAffected = stmt.executeUpdate();

            // Trả về kết quả
            if (rowsAffected > 0) {
                response.getWriter().write("{\"message\":\"Cập nhật thông tin sách thành công.\"}");
            } else {
                response.getWriter().write("{\"message\":\"Không tìm thấy sách cần cập nhật.\"}");
            }

        } catch (Exception e) {
        	System.out.println(e.getMessage());
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
