<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Thêm Sinh Viên</title>
<link rel="icon" type="image/png" sizes="32x32"
	href="https://ued.udn.vn/uploads/about/logo-500.png">
<style>
/* Cài đặt chung cho body */
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f9;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

/* Cấu trúc container */
.container {
	width: 50%;
	max-width: 600px;
	padding: 30px;
	background-color: white;
	box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	margin: 20px;
}

h2 {
	text-align: center;
	color: #333;
	margin-bottom: 20px;
}

/* Bố cục form */
form {
	display: flex;
	flex-direction: column;
}

/* Cấu trúc của mỗi trường nhập liệu */
label {
	font-size: 14px;
	font-weight: bold;
	color: #333;
	margin-bottom: 8px;
}

input[type="text"], input[type="date"], select {
	padding: 12px;
	margin-bottom: 20px;
	border: 1px solid #ddd;
	border-radius: 6px;
	font-size: 14px;
	width: 100%;
	box-sizing: border-box;
	transition: border 0.3s ease;
}

/* Hiệu ứng khi focus vào ô nhập */
input[type="text"]:focus, input[type="date"]:focus, select:focus {
	border-color: #4CAF50;
	outline: none;
}

/* Cấu trúc nút Submit */
input[type="submit"] {
	background-color: #4CAF50;
	color: white;
	padding: 12px;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	font-size: 16px;
	width: 100%;
	transition: background-color 0.3s ease;
}

/* Hiệu ứng hover cho nút Submit */
input[type="submit"]:hover {
	background-color: #45a049;
}

/* Thông báo lỗi hoặc thành công */
p.message {
	font-size: 16px;
	text-align: center;
	margin-top: 10px;
}

p.success {
	color: green;
}

p.error {
	color: red;
}
</style>
<script>
        // JavaScript để kiểm tra định dạng số điện thoại trước khi gửi form
        function validateForm() {
            const soDienThoai = document.getElementById("SoDienThoai").value;
            const phoneRegex = /^0[1-9][0-9]{8}$/; // Định dạng: bắt đầu bằng 0, tổng cộng 10 chữ số
            if (!phoneRegex.test(soDienThoai)) {
                alert("Số điện thoại không hợp lệ. Vui lòng nhập đúng định dạng (10 chữ số).");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
	<div class="container">
		<h2>Thêm Sinh Viên Mới</h2>
		<form action="AddStudentServlet" method="POST"
			onsubmit="return validateForm()" accept-charset="UTF-8">
			<div>
				<label for="MaSV">Mã Sinh Viên:</label> <input type="text" id="MaSV"
					name="MaSV" required>
			</div>
			<div>
				<label for="HoVaTen">Họ và Tên:</label> <input type="text"
					id="HoVaTen" name="HoVaTen" required>
			</div>
			<div>
				<label for="GioiTinh">Giới Tính:</label> <select id="GioiTinh"
					name="GioiTinh" required>
					<option value="Nam">Nam</option>
					<option value="Nữ">Nữ</option>
				</select>
			</div>
			<div>
				<label for="NgaySinh">Ngày Sinh:</label> <input type="date"
					id="NgaySinh" name="NgaySinh" required>
			</div>
			<div>
				<label for="MaLop">Mã Lớp:</label> <select id="MaLop" name="MaLop"
					required>
					<option value="21CNTTC">21CNTTC</option>
					<option value="22CNTTC">22CNTTC</option>
					<option value="22CNTT1">22CNTT1</option>
					<option value="22CNTT2">22CNTT2</option>
				</select>
			</div>
			<div>
				<label for="SoDienThoai">Số Điện Thoại:</label> <input type="text"
					id="SoDienThoai" name="SoDienThoai" required>
			</div>
			<div>
				<input type="submit" value="Thêm Sinh Viên">
			</div>
		</form>

		<!-- Hiển thị thông báo nếu có -->
		<%
            String message = (String) request.getAttribute("message");
            String messageType = (String) request.getAttribute("messageType"); // Phân loại success/error
            if (message != null) {
        %>
		<p class="message <%= messageType %>"><%= message %></p>
		<% } %>
	</div>
</body>
</html>
