<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Danh Sách Sách</title>
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

td {
	text-align: center;
}

.actions a {
	text-decoration: none;
	padding: 5px 10px;
	color: white;
	border-radius: 5px;
	margin: 0 5px;
}

.actions .edit {
	background-color: #3498db;
}

.actions .delete {
	background-color: #e74c3c;
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

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
</style>
</head>
<body>
	<header>
		<h1>Danh Sách Sách</h1>
	</header>

	<div class="container">
		<h2>Thông Tin Các Cuốn Sách</h2>
		<button class="btn-add" onclick="window.location.href='AddSach.jsp'">Thêm
			Sách</button>
		<table id="Mytable">
			<thead>
				<tr>
					<th onclick="sortTable(0)">Mã Sách</th>
					<th>Tên Sách</th>
					<th>Số Lượng</th>
					<th>Thể Loại</th>
					<th>Tác Giả</th>
					<th>Hành Động</th>
				</tr>
			</thead>
			<tbody id="bookTable">
				<%
				Connection conn = null;
				Statement stmt = null;
				ResultSet rs = null;

				try {
					// Kết nối cơ sở dữ liệu
					Class.forName("com.mysql.cj.jdbc.Driver");
					conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Thuvien_database", "root", "09042004");
					stmt = conn.createStatement();

					// Lấy danh sách sách
					String sql = "SELECT s.idSach, s.nameSach, s.soluong, t.nameTheloai, s.tacgia " + "FROM Sach s "
					+ "JOIN Theloai t ON s.idTheloai = t.idTheloai ";
					rs = stmt.executeQuery(sql);

					// Hiển thị danh sách sách
					while (rs.next()) {
						String idSach = rs.getString("idSach");
						String nameSach = rs.getString("nameSach");
						int soluong = rs.getInt("soluong");
						String nameTheloai = rs.getString("nameTheloai");
						String nameTacgia = rs.getString("tacgia");
				%>
				<tr id="row-<%=idSach%>">
					<td><%=idSach%></td>
					<td><%=nameSach%></td>
					<td><%=soluong%></td>
					<td><%=nameTheloai%></td>
					<td><%=nameTacgia%></td>
					<td class="actions">
						<button class="edit"
							onclick="openEditModal('<%=idSach%>', '<%=nameSach%>', <%=soluong%>, '<%=nameTheloai%>', '<%=nameTacgia%>')">Sửa</button>
						<button class="delete" onclick="deleteBook('<%=idSach%>')">Xóa</button>

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
			<h2>Sửa Thông Tin Sách</h2>
			<form id="editForm">
				<input type="hidden" id="editId"> <label for="editName">Tên
					Sách:</label> <input type="text" id="editName" required><br> <br>
				<label for="editQuantity">Số Lượng:</label> <input type="number"
					id="editQuantity" required><br> <br>
				<button type="button" onclick="saveEdit()">Lưu Thay Đổi</button>
			</form>
		</div>
	</div>

	<footer>
		<p>Trường Đại học Sư phạm - ĐHĐN</p>
	</footer>

	<script>
        function openEditModal(id, name, quantity) {
            document.getElementById("editModal").style.display = "block";
            document.getElementById("editId").value = id;
            document.getElementById("editName").value = name;
            document.getElementById("editQuantity").value = quantity;
        }

        function closeModal() {
            document.getElementById("editModal").style.display = "none";
        }

        function saveEdit() {
            const id = document.getElementById("editId").value;
            const name = document.getElementById("editName").value;
            const quantity = document.getElementById("editQuantity").value;

            // Gửi AJAX cập nhật sách
            $.post("EditBookServlet", { id, name, quantity }, function(response) {
            	alert("Sua thành công!");
                location.reload();
            });
        }

        function deleteBook(id) {
            if (confirm("Bạn có chắc chắn muốn xóa sách này không?")) {
                // Gửi AJAX xóa sách
                $.post("DeleteBookServlet", { id }, function(response) {
                    alert("Xoa thanh cong");
                    location.reload();
                });
            }
        }
        
        function sortTable(columnIndex) {
        	console.log("sort " + columnIndex);
            const table = document.getElementById("Mytable");
            const rows = Array.from(table.rows).slice(1); // Exclude header row
            const isAscending = table.dataset.sortOrder !== "asc";

            rows.sort((rowA, rowB) => {
              const cellA = rowA.cells[columnIndex].textContent.trim();
              const cellB = rowB.cells[columnIndex].textContent.trim();

              return isAscending
                ? cellA.localeCompare(cellB, undefined, { numeric: true })con
                : cellB.localeCompare(cellA, undefined, { numeric: true });
            });

            // Rebuild table with sorted rows
            table.tBodies[0].append(...rows);
            table.dataset.sortOrder = isAscending ? "asc" : "desc";
          }
    </script>
</body>
</html>
