<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Thêm Sách Mới</title>
<link rel="icon" type="image/png" sizes="32x32"
	href="https://ued.udn.vn/uploads/about/logo-500.png">
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f0f8ff;
	margin: 0;
	padding: 0;
}

.container {
	width: 50%;
	margin: 80px auto;
	background-color: #ffffff;
	padding: 40px;
	border-radius: 15px;
	box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.1);
	background-image:
		url('https://www.transparenttextures.com/patterns/diagonal-stripes.png');
	background-size: cover;
	background-position: center;
}

h2 {
	font-size: 28px;
	color: #ff6347;
	margin-bottom: 30px;
	text-transform: uppercase;
	letter-spacing: 1px;
	text-align: center; /* Căn giữa tiêu đề */
}

.form-group {
	width: 100%;
	text-align: left;
}

label {
	font-size: 18px;
	color: #333;
	margin-left: 15px;
	display: block;
}

input, select {
	padding: 12px 15px;
	font-size: 16px;
	border: 1px solid #ddd;
	border-radius: 8px;
	background-color: #fafafa;
	width: calc(100% - 30px);
	margin: 10px 15px;
	transition: border 0.3s ease;
}

input:focus, select:focus {
	border-color: #ff6347;
	outline: none;
	box-shadow: 0px 0px 5px rgba(255, 99, 71, 0.5);
}

button {
	background-color: #ff6347;
	color: white;
	border: none;
	padding: 14px 0;
	font-size: 18px;
	border-radius: 8px;
	cursor: pointer;
	transition: background-color 0.3s ease;
	margin: 20px 15px;
	width: calc(100% - 30px); /* Làm nút bằng chiều rộng form */
}

button:hover {
	background-color: #e55347;
}

.header-image {
	width: 150px; /* Đặt chiều rộng là 150px */
	height: auto; /* Đặt chiều cao tự động tỷ lệ với chiều rộng */
	object-fit: cover;
	border-radius: 15px;
	margin-bottom: 30px;
	display: block; /* Cần để ảnh có thể căn giữa */
	margin-left: auto; /* Căn trái tự động */
	margin-right: auto; /* Căn phải tự động */
}

.footer {
	font-size: 14px;
	color: #888;
	text-align: center; /* Căn giữa footer */
	margin-top: 30px;
}

@media ( max-width : 768px) {
	.container {
		width: 80%;
	}
	h2 {
		font-size: 24px;
	}
	button {
		font-size: 16px;
	}
}
</style>
</head>
<body>
	<div class="container">
		<img
			src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtw2rPrDTyNf6HQptsklxFVO37h6k3bT3IVQ&s"
			alt="Books" class="header-image">
		<h2>Thêm Sách Mới</h2>
		<form action="AddSachServlet" method="post">
			<div class="form-group">
				<label for="maSach">Mã Sách:</label> <input type="text" id="maSach"
					name="maSach" required>
			</div>

			<div class="form-group">
				<label for="nameSach">Tên Sách:</label> <input type="text"
					id="nameSach" name="nameSach" required>
			</div>

			<div class="form-group">
				<label for="tacgia">Tác Giả:</label> <input type="text" id="tacgia"
					name="tacgia" required>
			</div>

			<div class="form-group">
				<label for="idTheloai">Thể Loại:</label> <select id="idTheloai"
					name="idTheloai" required>
					<option value="1">Lập trình</option>
					<option value="2">Thuật toán</option>
					<option value="3">Trí tuệ nhân tạo</option>
					<option value="4">Phát triển phần mềm</option>
					<option value="5">Cơ sở dữ liệu</option>
					<option value="6">Thiết kế phần mềm</option>
					<option value="7">Hệ điều hành</option>
					<option value="8">Mạng máy tính</option>
					<option value="9">Bảo mật</option>
					<option value="10">Dữ liệu lớn</option>
				</select>
			</div>

			<div class="form-group">
				<label for="soluong">Số Lượng:</label> <input type="number"
					id="soluong" name="soluong" min="1" required>
			</div>

			<button type="submit">Thêm Sách</button>
		</form>
		<div class="footer">
			<p>© 2024 Thư Viện Online</p>
		</div>
	</div>
</body>
</html>
