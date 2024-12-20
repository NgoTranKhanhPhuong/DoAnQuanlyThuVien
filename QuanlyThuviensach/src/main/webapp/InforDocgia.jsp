<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat"%>
<%
    response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Xem thông tin thành viên</title>
<link rel="icon" type="image/png" sizes="32x32"
	href="https://ued.udn.vn/uploads/about/logo-500.png">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
}

header {
	background-color: #2c3e50;
	color: white;
	padding: 20px;
	text-align: center;
}

.container {
	width: 80%;
	margin: 30px auto;
	background-color: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	padding: 12px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #2980b9;
	color: white;
}

tr:hover {
	background-color: #f1f1f1;
}

footer {
	text-align: center;
	margin-top: 50px;
	background-color: #2c3e50;
	color: white;
	padding: 10px;
}

button {
	display: inline-block;
	padding: 5px 10px;
	margin: 5px;
	background-color: #2980b9;
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button:hover {
	background-color: #3498db;
}

td {
	text-align: center;
}

.btn-add {
	background-color: #2ecc71;
	color: white;
}

.btn-add:hover {
	background-color: #27ae60;
}
</style>
<script>
        function toggleTable() {
            var table = document.getElementById("studentTable");
            if (table.style.display === "none") {
                table.style.display = "table";
            } else {
                table.style.display = "none";
            }
        }
    </script>
</head>
<body>

	<header>
		<h1>Chào mừng đến trang Xem thông tin thành viên</h1>
	</header>

	<div class="container">
		<h2>Danh sách thành viên</h2>
		<button class="btn-add"
			onclick="window.location.href='AddStudent.jsp'">Thêm Thành
			Viên</button>
		<button onclick="toggleTable()">Xem thông tin</button>

		<table id="studentTable">
			<thead>
				<tr>
					<th>Mã SV</th>
					<th>Họ và Tên</th>
					<th>Giới Tính</th>
					<th>Ngày Sinh</th>
					<th>Mã Lớp</th>
					<th>Số Điện Thoại</th>
					<th>Hành Động</th>
				</tr>
			</thead>
			<tbody>
				<%
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Thuvien_database", "root", "09042004");
                        stmt = conn.createStatement();
                        String sql = "SELECT * FROM docgia";
                        rs = stmt.executeQuery(sql);
                        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                        while (rs.next()) {
                            String maSV = rs.getString("MaSV");
                            String hoVaTen = rs.getString("HoVaTen");
                            String gioiTinh = rs.getString("GioiTinh");
                            java.sql.Date ngaySinh = rs.getDate("NgaySinh");
                            String maLop = rs.getString("MaLop");
                            String soDienThoai = rs.getString("SoDienThoai");
                %>
				<tr>
					<td><%= maSV %></td>
					<td><%= hoVaTen %></td>
					<td><%= gioiTinh %></td>
					<td><%= sdf.format(ngaySinh) %></td>
					<td><%= maLop %></td>
					<td><%= soDienThoai %></td>
					<td>
						<button
							onclick="window.location.href='EditStudentServlet?maSV=<%= maSV %>'">Sửa</button>
						<button
							onclick="if(confirm('Bạn có chắc chắn muốn xóa không?')) window.location.href='DeleteStudentServlet?maSV=<%= maSV %>'">Xóa</button>
					</td>
				</tr>
				<%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException se) {
                            se.printStackTrace();
                        }
                    }
                %>
			</tbody>
		</table>
	</div>

	<footer>
		<p>Trường Đại học Sư phạm - ĐHĐN</p>
	</footer>

</body>
</html>