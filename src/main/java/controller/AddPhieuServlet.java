package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.xdevapi.Statement;

@WebServlet("/AddPhieuServlet")
public class AddPhieuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String maSV = request.getParameter("maSV");
		String idSach = request.getParameter("idSach");
		String ngayMuon = request.getParameter("ngayMuon");
		String ngayPhaiTra = request.getParameter("ngayPhaiTra");
		System.out.println("API AddPhieuServlet đã được gọi.");

		// Kiểm tra dữ liệu đầu vào
		if (maSV == null || maSV.isEmpty()) {
			request.setAttribute("error", "Mã sinh viên không được để trống.");
			request.getRequestDispatcher("/AddPhieu.jsp").forward(request, response);
			return;
		}

		if (idSach == null || idSach.isEmpty()) {
			request.setAttribute("error", "Mã sách không được để trống.");
			request.getRequestDispatcher("/AddPhieu.jsp").forward(request, response);
			return;
		}

		// Kiểm tra ngày mượn và ngày trả
		if (ngayMuon == null || ngayMuon.isEmpty() || !isValidDate(ngayMuon)) {
			request.setAttribute("error", "Ngày mượn không hợp lệ.");
			request.getRequestDispatcher("/AddPhieu.jsp").forward(request, response);
			return;
		}

		if (ngayPhaiTra == null || ngayPhaiTra.isEmpty() || !isValidDate(ngayPhaiTra)) {
			request.setAttribute("error", "Ngày phải trả không hợp lệ.");
			request.getRequestDispatcher("/AddPhieu.jsp").forward(request, response);
			return;
		}

		// Tạo kết nối đến cơ sở dữ liệu và thực hiện thao tác
		Connection conn = null;
		PreparedStatement ps = null;
		
		

		try {
			// Tải driver JDBC
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/Thuvien_database?useUnicode=true&characterEncoding=UTF-8", "root",
					"09042004");
			
			// Lay Id cho du lieu moi
			String query = "SELECT MAX(idPhieumuon) + 1 AS next_id FROM phieumuon";
			PreparedStatement stmt = conn.prepareStatement(query);
			ResultSet rs = stmt.executeQuery();
			int nextId = 1;
			if (rs.next()) {
		        nextId = rs.getInt("next_id");
		    }
			System.out.println(nextId);

			// Câu lệnh SQL để thêm phiếu mượn
			String sql = "INSERT INTO phieumuon (idPhieumuon, MaSV, idSach, ngaymuon, ngayphaitrasach, status) VALUES (?, ?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, nextId);
			ps.setString(2, maSV);
			ps.setString(3, idSach);
			ps.setString(4, ngayMuon);
			ps.setString(5, ngayPhaiTra);
			ps.setString(6, "mượn");

			// Thực thi câu lệnh SQL
			int result = ps.executeUpdate();

			// Kiểm tra kết quả
			if (result > 0) {
				System.out.println("Thêm phiếu mượn thành công");
				request.setAttribute("successMessage", "Thêm phiếu mượn thành công!");
			} else {
				System.out.println("Có lỗi xảy ra khi thêm phiếu mượn.");
				request.setAttribute("errorMessage", "Có lỗi xảy ra khi thêm phiếu mượn.");
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
			// Xử lý ngoại lệ và thông báo lỗi
			request.setAttribute("errorMessage", "Lỗi kết nối cơ sở dữ liệu: " + e.getMessage());
		} finally {
			// Đảm bảo đóng tài nguyên
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		// Chuyển hướng lại trang AddPhieu.jsp
		request.getRequestDispatcher("/InforMuonTra.jsp").forward(request, response);
	}

	// Hàm kiểm tra ngày tháng hợp lệ
	private boolean isValidDate(String date) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		try {
			format.setLenient(false);
			format.parse(date);
			return true;
		} catch (ParseException e) {
			return false;
		}
	}
}
