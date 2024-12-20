<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Thông tin mượn trả sách</title>
</head>
<body>

	<h1>Danh sách mượn trả sách</h1>

	<table border="1">
		<thead>
			<tr>
				<th>Mã sinh viên</th>
				<th>Họ tên</th>
				<th>Tên sách</th>
				<th>Trạng thái</th>
				<th>Ngày mượn</th>
				<th>Ngày trả sách</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="member" items="${members}">
				<tr>
					<td>${member.MaSV}</td>
					<td>${member.HoTen}</td>
					<td>${member.TenSach}</td>
					<td>${member.status}</td>
					<td>${member.ngayMuon}</td>
					<td>${member.ngayTraSach}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>
