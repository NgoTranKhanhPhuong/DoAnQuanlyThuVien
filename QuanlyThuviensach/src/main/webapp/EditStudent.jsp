<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sửa thông tin sinh viên</title>
<link rel="icon" type="image/png" sizes="32x32"
	href="https://ued.udn.vn/uploads/about/logo-500.png">
<style>
/* Reset mặc định */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background: linear-gradient(to bottom right, #e3fdfd, #ffe6fa);
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

.container {
	width: 90%; /* Giảm chiều rộng */
	max-width: 550px; /* Thu nhỏ form */
	background: #ffffff;
	border-radius: 10px; /* Thu nhỏ bo góc */
	padding: 15px 20px; /* Giảm padding */
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
}

h2 {
	text-align: center;
	color: #4a4e69;
	margin-bottom: 15px; /* Giảm khoảng cách tiêu đề */
	font-size: 24px; /* Thu nhỏ font tiêu đề */
	font-weight: bold;
}

.header {
	text-align: center;
	margin-bottom: 15px; /* Giảm khoảng cách header */
}

.header img {
	max-width: 60px; /* Thu nhỏ logo */
	margin-bottom: 5px;
}

.header p {
	font-size: 12px;
	color: #6c757d;
}

form {
	display: grid;
	gap: 10px; /* Giảm khoảng cách giữa các phần tử */
}

label {
	font-size: 13px; /* Thu nhỏ font nhãn */
	font-weight: 500;
	color: #4a4e69;
	margin-bottom: 3px; /* Giảm khoảng cách nhãn */
}

input[type="text"], input[type="date"], select {
	width: 100%;
	padding: 8px 12px; /* Giảm padding input */
	border: 1px solid #ddd;
	border-radius: 6px; /* Thu nhỏ bo góc input */
	font-size: 13px; /* Thu nhỏ font input */
	transition: all 0.3s ease-in-out;
}

input[type="text"]:focus, input[type="date"]:focus, select:focus {
	border-color: #ff6f91;
	box-shadow: 0 0 6px rgba(255, 111, 145, 0.4); /* Giảm bóng */
	outline: none;
}

button {
	width: 100%;
	padding: 10px; /* Giảm padding nút */
	background: linear-gradient(90deg, #ff6f91, #ff9671);
	color: #fff;
	font-size: 14px; /* Thu nhỏ font nút */
	font-weight: bold;
	border: none;
	border-radius: 6px; /* Thu nhỏ bo góc nút */
	cursor: pointer;
	transition: all 0.3s ease-in-out;
}

button:hover {
	background: linear-gradient(90deg, #ff9671, #ff6f91);
	transform: translateY(-1px); /* Giảm hiệu ứng hover */
	box-shadow: 0 4px 12px rgba(255, 111, 145, 0.3);
}

/* Responsive */
@media ( max-width : 480px) {
	h2 {
		font-size: 18px;
	}
	.header img {
		max-width: 50px;
	}
	button {
		padding: 8px;
	}
}
</style>
</head>
<body>
	<div class="container">
		<div class="header">
			<img src="https://ued.udn.vn/uploads/about/logo-500.png" alt="Logo">
		</div>
		<h2>Sửa thông tin sinh viên</h2>
		<form action="UpdateStudentServlet" method="post">
			<input type="hidden" name="maSV"
				value="<%= request.getAttribute("maSV") %>">

			<div>
				<label for="hoVaTen">Họ và Tên:</label> <input type="text"
					id="hoVaTen" name="hoVaTen"
					value="<%= request.getAttribute("hoVaTen") %>" required>
			</div>

			<div>
				<label for="maSV">Mã sinh viên:</label> <input type="text" id="maSV"
					name="maSV" value="<%= request.getAttribute("maSV") %>" required>
			</div>

			<div>
				<label for="gioiTinh">Giới tính:</label> <select id="gioiTinh"
					name="gioiTinh" required>
					<option value="" disabled>--chọn--</option>
					<option value="Nam"
						<%= "Nam".equals(request.getAttribute("gioiTinh")) ? "selected" : "" %>>Nam</option>
					<option value="Nữ"
						<%= "Nữ".equals(request.getAttribute("gioiTinh")) ? "selected" : "" %>>Nữ</option>
				</select>
			</div>

			<div>
				<label for="ngaySinh">Ngày sinh:</label> <input type="date"
					id="ngaySinh" name="ngaySinh"
					value="<%= request.getAttribute("ngaySinh") %>" required>
			</div>

			<div>
				<label for="maLop">Mã lớp:</label> <select id="maLop" name="maLop"
					required>
					<option value="" disabled>--chọn--</option>
					<option value="22CNTTC"
						<%= "22CNTTC".equals(request.getAttribute("maLop")) ? "selected" : "" %>>22CNTTC</option>
					<option value="22CNTT1"
						<%= "22CNTT1".equals(request.getAttribute("maLop")) ? "selected" : "" %>>22CNTT1</option>
					<option value="22CNTT2"
						<%= "22CNTT2".equals(request.getAttribute("maLop")) ? "selected" : "" %>>22CNTT2</option>
					<option value="21CNTTC"
						<%= "21CNTTC".equals(request.getAttribute("maLop")) ? "selected" : "" %>>21CNTTC</option>
				</select>
			</div>

			<div>
				<label for="soDienThoai">Số điện thoại:</label> <input type="text"
					id="soDienThoai" name="soDienThoai"
					value="<%= request.getAttribute("soDienThoai") %>" required>
			</div>

			<button type="submit">Cập nhật</button>
		</form>
	</div>
</body>
</html>