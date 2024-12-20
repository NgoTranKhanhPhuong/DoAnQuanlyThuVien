<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Giới thiệu Trung tâm Học liệu & Elearning</title>

<link rel="icon" type="image/png" sizes="32x32"
	href="https://ued.udn.vn/uploads/about/logo-500.png">
<style>
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
</style>
</head>
<body>
	<div class="header">
		<header>
			<h1>Giới thiệu về thư viện</h1>
		</header>
		<li><a href="giaodien.jsp" class="btn-home">Trang chủ</a></li>
		<!-- Thêm nút quay trở lại trang chủ -->
		<div class="banner-container">
			<img src="https://lrel.ued.udn.vn/uploads/about/1hl4.jpg"
				alt="Banner">
		</div>



		<section id="intro">
			<h2>Giới thiệu về Trung Tâm</h2>
			<p>Trường Đại học Sư phạm - Đại học Đà Nẵng là một trong 07
				trường sư phạm trọng điểm với trọng trách đào tạo nguồn nhân lực
				chất lượng cao trong đó đào tạo giáo viên là nòng cốt góp phần quan
				trọng để phát triển bền vững giáo dục phổ thông trong giai đoạn hội
				nhập quốc tế hiện nay.</p>
			<p>Trường Đại học Sư phạm - Đại học Đà Nẵng luôn luôn coi trọng
				công việc đổi mới công tác đào tạo, công tác ứng dụng CNTT vào giảng
				dạy và học tập, chính vì vậy, BGH Nhà trường rất quan tâm đến việc
				truyền bá kiến thức khoa học đến người học băng những hành động cụ
				thể như xây dựng kho học liệu, xây dựng dự án cải tạo, nâng cấp thư
				viện, xây dựng hệ thống quản lý đào tao, xây dựng hệ thống học trực
				tuyến...</p>
		</section>

		<section id="infomation">
			<h2>1. TÊN GỌI VÀ ĐỊA ĐIỂM GIAO DỊCH</h2>
			<p>
				<strong>Tên tiếng Việt:</strong> TRUNG TÂM HỌC LIỆU VÀ ELEARNING
				thuộc Trường Đại học Sư phạm – Đại học Đà Nẵng
			</p>
			<p>
				<strong>Tên tiếng Anh:</strong> Da Nang University of Science and
				Education – Learning information resource and E-Learning Center
			</p>
			<p>
				<strong>Tên viết tiếng Anh là:</strong> LR&EL
			</p>
			<p>
				<strong>Trụ sở:</strong> Thư viện, Trường Đại học Sư phạm – Đại học
				Đà Nẵng, số 459 Tôn Đức Thắng, Quận Liên Chiểu, Thành phố Đà Nẵng
			</p>
			<p>
				<strong>Website:</strong> www.lrel.ued.udn.vn
			</p>
		</section>

		<section id="legal">
			<h2>2. VỊ TRÍ PHÁP LÍ</h2>
			<p>Trung tâm Học liệu và Elearning là đơn vị sự nghiệp trực thuộc
				Trường Đại học Sư phạm - Đại học Đà Nẵng trên cơ sở kiện toàn, sắp
				xếp tổ chức lại đội ngũ viên chức của Tổ Thư viện và bộ phận
				Elearning của Phòng Cơ sở vật chất theo hướng thư viện điện tử và
				bài giảng điện tử.</p>
		</section>

		<section id="functions">
			<h2>3. CHỨC NĂNG VÀ NHIỆM VỤ</h2>
			<div>
				<h3>a) Chức năng</h3>
				<p>Trung tâm Học liệu và E-learning có chức năng tham mưu, giúp
					việc và chịu trách nhiệm trước Hiệu trưởng về công tác tổ chức,
					khai thác, lưu trữ và cung cấp thông tin tư liệu trong các lĩnh vực
					khoa học giáo dục, xã hội nhân văn; khoa học tự nhiên, kĩ thuật và
					công nghệ…</p>
			</div>
			<div>
				<h3>b) Nhiệm vụ</h3>
				<ul>
					<li><strong>b.1. Đối với nhiệm vụ nghiên cứu, phát
							triển thư viện điện tử:</strong>
						<ul>
							<li>Hoàn tất việc chuyển đổi từ nguồn tài liệu in sang bộ
								sưu tập số.</li>
							<li>Thực hiện một cách có hiệu quả công tác lưu giữ lâu dài
								đối với bộ sưu tập in thuộc dạng di sản và sẵn sàng cung cấp các
								dịch vụ truy cập đến nguồn tài liệu đặc biệt này.</li>
							<li>Phát triển theo hướng tái cấu trúc không gian thư viện
								để có thể phục vụ một cách linh hoạt việc học tập của sinh viên.</li>
							<li>Tổ chức lại các tiện ích, nguồn tin và các loại hình
								dịch vụ của thư viện theo hướng tích hợp hài hoà vào chuỗi hoạt
								động giảng dạy, học tập và nghiên cứu.</li>
							<li>Chuyển đổi các bộ sưu tập từ việc đặt mua tài liệu, bổ
								sung nguồn tin sang trọng tâm là quản trị nội dung.</li>
						</ul></li>
					<li><strong>b.2. Đối với nhiệm vụ quản trị hệ thống
							học tập trực tuyến:</strong>
						<ul>
							<li>Nghiên cứu, tư vấn và phát triển hệ thống học tập trực
								tuyến trong lĩnh vực giáo dục đào tạo; xây dựng các mô hình bài
								giảng điện tử từng bước tiếp cận với các mô hình tiên tiến trên
								thế giới, phù hợp với tình hình thực tế ở Việt Nam.</li>
							<li>Phát triển ngân hàng bài giảng điện tử và xây dựng học
								liệu số bổ sung cho ngân hàng kiến thức (thư viện số) đáp ứng
								yêu cầu của Trường Đại học Sư phạm – Đại học Đà Nẵng.</li>
							<li>Phối hợp với các đơn vị trong Nhà trường tổ chức bồi
								dưỡng kỹ năng biên soạn bài giảng điện tử mang tính tương tác
								cao.</li>
						</ul></li>
				</ul>
			</div>
		</section>

		<section id="activities">
			<h2>4. TỔ CHỨC HOẠT ĐỘNG</h2>
			<div>
				<h3>A- Bộ phận học liệu</h3>
				<ul>
					<li>Tổ chức đào tạo xây dựng ngân hàng kiến thức, ngân hàng
						bài giảng, xây dựng kho tư liệu trên nền tảng ứng dụng CNTT.</li>
					<li>Tổ chức bổ sung nguồn tài liệu nội sinh hiện có của các
						thư viện; số hóa tài liệu nội sinh: scan, xử lý file scan, chuyển
						dạng Flipping book; biên mục nguồn tài liệu nội sinh; cập nhật dữ
						liệu biên mục tài liệu nội sinh vào Thư viện số.</li>
					<li>Xây dựng dự án thiết bị, phần mềm phục vụ phòng sản xuất
						học liệu, thư viện số và thư viện truyền thống; trước hết là dự án
						ĐẦU TƯ NÂNG CẤP THƯ VIỆN TRƯỜNG ĐẠI HỌC SƯ PHẠM – ĐẠI HỌC ĐÀ NẴNG
						THÀNH MỘT THƯ VIỆN ĐẠI HỌC HIỆN ĐẠI ĐÁP ỨNG NHIỆM VỤ ĐỔI MỚI CĂN
						BẢN, TOÀN DIỆN GIÁO DỤC VÀ ĐÀO TẠO của chương trình ETEP.</li>
				</ul>
			</div>
			<div>
				<h3>B. Bộ phận quản trị mạng của Trung tâm học liệu & Elearning</h3>
				<ul>
					<li>Tiếp tục củng cố hệ thống học tập trực tuyến theo hướng
						hiện đại, đơn giản mà hiệu quả.</li>
					<li>Phối hợp với các đơn vị trong Nhà trường để quản trị hệ
						thống học liệu trực tuyến một cách thống nhất.</li>
					<li>Tham mưu Hiệu trưởng, Trưởng phòng Cơ sở vật chất trong
						công tác tổ chức, quản trị hệ thống học liệu trực tuyến.</li>
				</ul>
			</div>
		</section>

		<footer>
			<p>© 2024 Trung tâm Học liệu & Elearning. All Rights Reserved.</p>
		</footer>
	</div>
	<!-- Thêm Leaflet JavaScript -->
	<script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
</body>
</html>
