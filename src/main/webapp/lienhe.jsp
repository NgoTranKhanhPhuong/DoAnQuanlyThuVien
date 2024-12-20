<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Liên Hệ</title>
<link rel="icon" type="image/png" sizes="32x32"
	href="https://ued.udn.vn/uploads/about/logo-500.png">

<style>
/* CSS */
body {
	font-family: Arial, sans-serif;
	line-height: 1.6;
	background-color: #f4f4f4;
	color: #333;
}

.container {
	width: 80%;
	margin: 0 auto;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

header {
	text-align: center;
	padding: 10px 0;
	background-color: #b8860b;
	color: white;
	border-bottom: 4px solid #b8860b; /* Thanh vàng dưới tiêu đề */
}

section {
	margin-bottom: 20px;
}

section h2 {
	color: #b8860b;
	margin-bottom: 10px;
	border-bottom: 2px solid #b8860b; /* Khung vàng cho tiêu đề h2 */
	padding-bottom: 5px; /* Khoảng cách bên dưới khung vàng */
}

section p {
	margin-bottom: 10px;
}

section ul {
	padding-left: 20px;
}

section ul li {
	list-style: disc inside;
}

.banner {
	background-color: #fffacd;
}

footer {
	background-color: #b8860b;
	color: white;
	text-align: center;
	padding: 10px;
}

.login-box {
	background-color: #b8860b;
}

.guestBlock {
	background-color: #f9f9f9;
}

.article {
	background-color: #ffffff;
}

.article h3 {
	color: #b8860b;
}

.article a {
	color: #b8860b;
}

.article a:hover {
	color: #8b6508;
}

.btn-home {
	display: inline-block;
	padding: 8px 12px;
	color: #b8860b; /* Màu chữ */
	text-decoration: none; /* Xóa gạch chân */
	border-radius: 4px; /* Bo tròn góc */
	text-align: center; /* Canh giữa */
	transition: background-color 0.3s; /* Hiệu ứng chuyển tiếp */
}

.btn-home:hover {
	background-color: #b8860b; /* Màu nền khi hover */
}

.banner-container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 400px; /* Chiều cao của container banner */
}

.banner-container img {
	max-width: 100%; /* Đảm bảo ảnh phù hợp với container */
	height: auto; /* Đảm bảo tỷ lệ ảnh được giữ nguyên */
}

/* CSS cho bản đồ */
#map {
	height: 400px;
	width: 100%;
	margin-bottom: -400px; /* Thêm khoảng cách dưới map */
}
</style>
</head>
<body>
	<header>
		<h1>Liên Hệ Với Chúng Tôi</h1>
	</header>
	<li><a href="giaodien.jsp" class="btn-home">Trang chủ</a></li>
	<!-- Thêm nút quay trở lại trang chủ -->
	<div class="container">
		<section>
			<p>Để không ngừng nâng cao chất lượng phục vụ và đáp ứng tốt hơn
				nữa các yêu cầu của bạn đọc, chúng tôi mong muốn nhận được các thông
				tin phản hồi. Nếu bạn có bất kỳ thắc mắc hoặc đóng góp nào, xin vui
				lòng liên hệ với chúng tôi theo thông tin dưới đây. Chúng tôi sẽ
				phản hồi lại bạn trong thời gian sớm nhất.</p>

			<h2>Bộ phận học liệu</h2>
			<p>Bộ phận tiếp nhận và giải quyết các yêu cầu, đề nghị, ý kiến
				liên quan đến hoạt động chính của thư viện số, thư viện truyền
				thống.</p>
			<p>
				Điện thoại: <a href="tel:+84905992049">0905992049</a>
			</p>
			<p>
				Email: <a href="mailto:hnmthi@ued.udn.vn">hnmthi@ued.udn.vn</a>, <a
					href="mailto:ntkhanh@ued.udn.vn">ntkhanh@ued.udn.vn</a>, <a
					href="mailto:ntkoanh_tv@ued.udn.vn">ntkoanh_tv@ued.udn.vn</a>, <a
					href="mailto:tttsuong@ued.udn.vn">tttsuong@ued.udn.vn</a>
			</p>
		</section>

		<!-- Bản đồ vị trí -->
		<section>
			<h2>Bản đồ vị trí</h2>
			<div id="map"></div>
			<iframe
				src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3834.0740370773783!2d108.15654907395006!3d16.061647384616702!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31421924682e8689%3A0x48eb0bdbeec05215!2zVHLGsOG7nW5nIMSQ4bqhaSBI4buNYyBTxrAgUGjhuqFtIC0gxJDhuqFpIGjhu41jIMSQw6AgTuG6tW5n!5e0!3m2!1svi!2s!4v1734697624128!5m2!1svi!2s"
				width="600" height="450" style="border: 0;" allowfullscreen
				loading="lazy" referrerpolicy="no-referrer-when-downgrade" async
				defer></iframe>
		</section>
</body>
</html>
