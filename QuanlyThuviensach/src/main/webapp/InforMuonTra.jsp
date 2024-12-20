<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Xem thông tin mượn trả sách</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="icon" type="image/png" sizes="32x32"
	href="https://ued.udn.vn/uploads/about/logo-500.png">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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

button.add-btn {
	display: inline-block;
	padding: 10px 20px;
	margin-bottom: 20px;
	background-color: #2ecc71; /* Màu xanh lá cây */
	color: white;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button.add-btn:hover {
	background-color: #27ae60; /* Màu xanh lá cây đậm khi hover */
}

td {
	text-align: center;
}

.btn-edit, .btn-delete {
	background-color: #3498db; /* Màu xanh dương */
	color: white;
	border: none;
	border-radius: 4px;
	padding: 5px 10px;
	cursor: pointer;
}

.btn-edit:hover, .btn-delete:hover {
	background-color: #2980b9; /* Màu xanh dương đậm khi hover */
}

.success-message, .error-message {
	padding: 10px;
	margin-bottom: 20px;
	text-align: center;
}

.success-message {
	background-color: #2ecc71;
	color: white;
}

.error-message {
	background-color: #e74c3c;
	color: white;
}

.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.5);
}

.modal-content {
	background-color: white;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 50%;
	border-radius: 8px;
}
</style>
</head>
<body>

	<header>
		<h1>Chào mừng đến trang Xem thông tin mượn trả sách</h1>
	</header>

	<div class="container">
		<!-- Hiển thị thông báo nếu có -->
		<%
		String successMessage = (String) request.getAttribute("successMessage");
		String errorMessage = (String) request.getAttribute("errorMessage");
		%>
		<%
		if (successMessage != null) {
		%>
		<div class="success-message"><%=successMessage%></div>
		<%
		} else if (errorMessage != null) {
		%>
		<div class="error-message"><%=errorMessage%></div>
		<%
		}
		%>

		<h2>Danh sách thông tin mượn trả sách</h2>

		<!-- Nút Thêm Phiếu Mượn -->
		<button class="add-btn" onclick="window.location.href='AddPhieu.jsp'">Thêm
			Phiếu Mượn</button>

		<table id="studentTable">
			<thead>
				<tr>
					<th>Mã SV</th>
					<th>Tên Độc Giả</th>
					<th>Tên Sách</th>
					<th>Ngày Mượn</th>
					<th>Ngày Trả</th>
					<th>Ngày Phải Trả</th>
					<th>Tình Trạng</th>
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
					String sql = "SELECT pm.idPhieumuon, pm.MaSV, dg.HoVaTen AS namedocgia, s.idSach, s.nameSach, pm.status, pm.ngaymuon, pm.ngaytra, pm.ngayphaitrasach "
					+ "FROM phieumuon pm " + "JOIN docgia dg ON pm.MaSV = dg.MaSV " + "JOIN sach s ON pm.idSach = s.idSach;";
					rs = stmt.executeQuery(sql);

					SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
					while (rs.next()) {
						String id = rs.getString("idPhieumuon");
						String idSach = rs.getString("idSach");
						String maSV = rs.getString("MaSV");
						String namedocgia = rs.getString("namedocgia");
						String nameSach = rs.getString("nameSach");
						java.sql.Date ngayMuon = rs.getDate("ngaymuon");
						java.sql.Date ngayTraSach = rs.getDate("ngaytra");
						java.sql.Date ngayPhaiTra = rs.getDate("ngayphaitrasach");
						String status = rs.getString("status");
				%>
				<tr>
					<td><%=maSV%></td>
					<td><%=namedocgia%></td>
					<td><%=nameSach%></td>
					<td><%=sdf.format(ngayMuon)%></td>
					<td><%=(ngayTraSach != null) ? sdf.format(ngayTraSach) : "Chưa trả"%></td>
					<td><%=(ngayPhaiTra != null) ? sdf.format(ngayPhaiTra) : "Chưa xác định"%></td>
					<td><%=status%></td>
					<td>
						<button class="btn-edit"
							onclick="openEditModal('<%=id%>', '<%=maSV%>', <%=idSach%>, '<%=ngayMuon%>', '<%=ngayPhaiTra%>', '<%=ngayTraSach%>', '<%=status%>')">Sửa</button>
						<button class="btn-delete"
							onclick="if(confirm('Bạn có chắc chắn muốn xóa không?')) window.location.href='DeleteLoanServlet?id=<%=id%>'">Xóa</button>
					</td>
				</tr>
				<%
				}
				} catch (Exception e) {
				e.printStackTrace();
				} finally {
				try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
				} catch (SQLException se) {
				se.printStackTrace();
				}
				}
				%>
			</tbody>
		</table>
	</div>

	<div id="editModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal()">&times;</span>
			<h2>Sửa Thông Tin Phiếu Mượn</h2>
			<form id="editForm">
				<input type="hidden" id="editId"> <label for="maSV">Mã
					sinh viên:</label> <input type="text" id="maSV" required><br>
				<br> <label for="idSach">Tên Sách:</label> <select id="idSach"
					name="idSach" required>
					<%
					try {
						Class.forName("com.mysql.cj.jdbc.Driver");
						conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Thuvien_database", "root", "09042004");
						stmt = conn.createStatement();
						String sql = "SELECT idSach, nameSach FROM sach";
						rs = stmt.executeQuery(sql);

						while (rs.next()) {
							int idSach = rs.getInt("idSach");
							String nameSach = rs.getString("nameSach");
					%>
					<option value="<%=idSach%>"><%=nameSach%></option>
					<%
					}
					} catch (Exception e) {
					e.printStackTrace();
					} finally {
					try {
					if (rs != null)
						rs.close();
					if (stmt != null)
						stmt.close();
					if (conn != null)
						conn.close();
					} catch (SQLException se) {
					se.printStackTrace();
					}
					}
					%>
				</select><br> <br> <label for="ngayMuon">Ngày Mượn:</label> <input
					type="date" id="ngayMuon" name="ngayMuon" required> <br>
				<br> <label for="ngayPhaiTra">Ngày Phải Trả:</label> <input
					type="date" id="ngayPhaiTra" name="ngayPhaiTra" required><br>
				<br> <label for="ngayTraSach">Ngày Trả:</label> <input
					type="date" id="ngayTraSach" name="ngayTraSach" required><br>
				<br> <label for="status">status:</label> <select id="status"
					name="idSach" required>
					<option value="mượn">Muon</option>
					<option value="đã trả">Da tra</option>
				</select><br> <br>
				<button type="submit">Lưu Thay Đổi</button>
			</form>
		</div>
	</div>

	<footer>
		<p>Trường Đại học Sư phạm - ĐHĐN</p>
	</footer>
	<script>
		document.getElementById('editForm').onsubmit = function(event) {
		 	event.preventDefault();
		 	if (this.checkValidity()) {
			 	saveEdit();
		 	}
		}
	
        function openEditModal(id, maSV, idSach, ngayMuon, ngayPhaiTra, ngayTraSach, status ) {
            document.getElementById("editModal").style.display = "block";
            document.getElementById("editId").value = id;
            document.getElementById("maSV").value = maSV;
            document.getElementById("idSach").value = idSach;
            document.getElementById("ngayMuon").value = ngayMuon;
            document.getElementById("ngayPhaiTra").value = ngayPhaiTra;
            document.getElementById("ngayTraSach").value = ngayTraSach;
            document.getElementById("status").value = status;
        }

        function closeModal() {
            document.getElementById("editModal").style.display = "none";
        }

        function saveEdit() {
            const id = document.getElementById("editId").value;
            const maSV = document.getElementById("maSV").value;
            const idSach = document.getElementById("idSach").value;
            const ngayMuon = document.getElementById("ngayMuon").value;
            const ngayPhaiTra = document.getElementById("ngayPhaiTra").value;
            const ngayTra = document.getElementById("ngayTraSach").value;
            const status = document.getElementById("status").value;

            // Gửi AJAX cập nhật sách
            $.post("EditLoanServlet", { id, maSV, idSach, ngayMuon, ngayPhaiTra, ngayTra, status }, function(response) {
            	 alert("Sua thành công!");
                location.reload();
            });
        }
    </script>
</body>
</html>
