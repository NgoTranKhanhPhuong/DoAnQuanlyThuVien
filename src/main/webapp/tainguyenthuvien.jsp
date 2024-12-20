<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Tài nguyên giáo dục mở Việt Nam</title>
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

footer {
	background-color: #b8860b;
	color: white;
	text-align: center;
	padding: 10px;
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
</style>
</head>
<body>
	<header>
		<h1>Tài nguyên thư viện</h1>
	</header>
	<li><a href="giaodien.jsp" class="btn-home">Trang chủ</a></li>
	<!-- Thêm nút quay trở lại trang chủ -->
	<div class="container">

		<section>
			<h2>GIỚI THIỆU CHƯƠNG TRÌNH TÀI NGUYÊN GIÁO DỤC MỞ VIỆT NAM VOER
				(VIETNAM OPEN EDUCATIONAL RESOURCES)</h2>
			<p>1. Học liệu Mở (OpenCourseWare - OCW)</p>
			<p>Thuật ngữ Học liệu mở (OpenCourseWare - OCW) được Viện Công
				nghệ Massachusetts - MIT (Mỹ) khai sinh vào năm 2002 khi MIT quyết
				định đưa toàn bộ nội dung giảng dạy của mình lên web và cho phép
				người dùng Internet ở mọi nơi trên thế giới truy nhập hoàn toàn miễn
				phí. Hiện nay trang web về học liệu mở của MIT có trên 2100 môn học
				(course) bao gồm bài giảng, lịch học, danh mục tài liệu tham khảo,
				bài tập về nhà, bài thi, bài thí nghiệm để người dùng có thể tham
				khảo cho việc giảng dạy, học tập và nghiên cứu của mình.</p>
			<p>2. Tài nguyên giáo dục Mở (Open Educational Resources – OER)</p>
			<p>Thuật ngữ Tài nguyên giáo dục mở (OER) lần đầu tiên được thông
				qua tại diễn đàn UNESCO năm 2002 về tác động của OCW cho giáo dục
				đại học của các nước đang phát triển dưới sự tài trợ của Quỹ William
				và Flora Hewlett. Tài nguyên giáo dục mở là một khái niệm rộng hơn
				OCW, bao gồm:</p>
			<ul>
				<li>Nội dung học: Các khoá học đầy đủ, các tài liệu học tập,
					các module nội dung, các đối tượng học tập, tuyển tập, tạp chí,…</li>
				<li>Công cụ: Phần mềm hỗ trợ việc tạo lập, phân phối, sử dụng
					và cải thiện nội dung học tập mở bao gồm cả việc tìm kiếm và tổ
					chức nội dung, các hệ thống quản lý nội dung và quá trình học tập
					(CLMS), các công cụ phát triển nội dung, và các cộng đồng học tập
					trực tuyến.</li>
				<li>Các tài nguyên bổ sung khác: Các giấy phép sở hữu trí tuệ
					để thúc đẩy xuất bản các tài liệu mở, các nguyên tắc thiết kế, và
					việc bản địa hoá nội dung.</li>
			</ul>
			<p>Với tiêu chí “Tri thức là của chung của nhân loại và tri thức
				cần phải được chia sẻ”, rất nhiều trường đại học và viện nghiên cứu
				trên thế giới đã tham gia phong trào OCW/OER để chia sẻ nội dung,
				công cụ cũng như phương thức triển khai học liệu mở sao cho đạt được
				hiệu quả cao nhất. Giảng viên, sinh viên và người tự học ở mọi nơi
				trên thế giới, đặc biệt là từ các nước đang phát triển như Việt Nam,
				đều có cơ hội như nhau trong việc tiếp cận các tri thức mới.</p>
			<p>3. Chương trình Tài nguyên giáo dục Mở Việt Nam (Vietnam Open
				Educational Resources – VOER)</p>
			<p>Chương trình Tài nguyên giáo dục Mở Việt Nam (Vietnam Open
				Educational Resources – VOER), hỗ trợ bởi Quỹ Việt Nam (the Vietnam
				Foundation), có mục tiêu xây dựng kho Tài nguyên giáo dục Mở của
				người Việt và cho người Việt, có nội dung phong phú, có thể sử dụng,
				tái sử dụng và truy nhập miễn phí trước hết trong trong môi trường
				giảng dạy, học tập và nghiên cứu sau đó cho toàn xã hội.</p>
			<p>4. Cách thức xây dựng nội dung của VOER</p>
			<p>Cách thức xây dựng nội dung của VOER là sử dụng công cụ phần
				mềm tích hợp Hanoi Spring trong việc đăng tải và chia sẻ nội dung
				lên Internet một cách dễ dàng và mềm dẻo.</p>
			<p>Về cơ bản nội dung trong VOER sẽ được lưu trữ dưới hai định
				dạng: 1) Module: là một chủ đề nhỏ hoặc một phần hoàn chỉnh của chủ
				đề lớn; 2) Collection: là tập hợp các module được sắp xếp theo một
				trình tự nhất định để tạo thành một cuốn sách/giáo trình. Cách tổ
				chức nội dung theo Module và Collection làm cho việc chia sẻ, sử
				dụng và tái sử dụng nội dung mềm dẻo và dễ dàng hơn bao giờ hết. Bất
				kỳ tác giả nào khi đăng ký một tài khoản trên hệ thống đều có thể
				đóng góp nội dung.</p>
			<p>Từ các ý tưởng ban đầu, công cụ soạn thảo module sẽ giúp tác
				giả có thể biên soạn nhanh chóng và dễ dàng nội dung của mình, các
				công cụ này có thể hỗ trợ tạo lập Module theo nhiều phương thức khác
				nhau, với sự tương thích cao với các công nghệ web hiện đại như CSS,
				JavaScript, AJAX, HTML5 và XML.</p>
			<p>
				Thông tin thêm về VOER tại: <a href="https://www.voer.edu.vn/">VOER.edu.vn</a>
			</p>
			<!-- Thêm link VOER vào trang JSP -->
		</section>
		<section>
			<h2>KHO SÁCH ONLINE</h2>
			<p>Thứ tư - 03/07/2024 00:09</p>
			<p>
				Kho sách online: <a
					href="https://sites.google.com/view/kho-sach-online/trang-ch%E1%BB%A7">https://sites.google.com/view/kho-sach-online/trang-ch%E1%BB%A7</a>
			</p>
			<p>Admin đang cập nhật các sách hay từng ngày vì thế bạn hãy để ý
				xem thêm nhé.</p>
			<p>Cảm ơn bạn đã quan tâm đến tủ sách online sưu tập hơn 1000+
				đầu sách tái bản nhiều nhất thế giới hoàn toàn miễn phí.</p>
			<p>Chúc bạn đọc sách vui vẻ!!!</p>
		</section>
	</div>
	<footer> &copy; 2024 Tài nguyên giáo dục mở Việt Nam. All
		rights reserved. </footer>
</body>
</html>
