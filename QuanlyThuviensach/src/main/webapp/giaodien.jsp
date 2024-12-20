<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thư viện - Giao diện mới</title>
    <link rel="icon" type="image/png" sizes="32x32" href="https://ued.udn.vn/uploads/about/logo-500.png">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        header {
            background-color: #b8860b;
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        header .logo {
            display: flex;
            align-items: center;
        }
        header .logo img {
            height: 50px;
            margin-right: 10px;
        }
        header .menu {
            display: flex;
        }
        header .menu ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
        }
        header .menu ul li {
            margin: 0 15px;
        }
        header .menu ul li a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }
        .menu-button {
            display: flex;
            align-items: center;
            background-color: transparent;
            border: none;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }
        .menu-button i {
            margin-right: 8px;
            font-size: 20px;
        }
        .banner {
            background-color: #fffacd;
            padding: 20px;
            text-align: center;
        }
        .banner img {
            max-width: 100%;
            height: auto;
        }

        /* Style for the login box */
        .login-box {
            background-color: white;
            border: 1px solid #ddd;
            padding: 20px;
            width: 300px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            position: absolute;
            top: 80px;
            right: 20px;
            display: none;
             z-index: 10;
        }

        .login-box h3 {
            margin-bottom: 15px;
            font-size: 18px;
            color: #333;
        }

        .login-box input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .login-box button {
            width: 100%;
            padding: 10px;
            background-color: #b8860b;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
        }

        footer {
            background-color: #b8860b;
            color: white;
            padding: 10px 20px;
            text-align: center;
        }

        .guestBlock {
            margin-top: 20px;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .guestBlock .form-group {
            margin-bottom: 15px;
        }

        .guestBlock .form-control {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border-radius: 5px;
        }

        .guestBlock .form-control:focus {
            border-color: #b8860b;
        }

        .guestBlock .btn {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            background-color: #b8860b;
            color: white;
        }

        /* Hide or show elements */
        .hidden {
            display: none;
        }

        .show {
            display: block;
            transition: all 0.5s ease-in-out;
        }

        /* Position for login/register form */
        .login-register-area {
            display: flex;
            flex-direction: row;
            justify-content: flex-end;
            margin-top: 20px;
        }

        .login-register-area a {
            color: #b8860b;
            margin-left: 15px;
            font-weight: bold;
        }
        
        
		        /* Section bài báo */
		.article-section {
		    padding: 30px;
		    background-color: #ffffff;
		    margin: 20px auto;
		    border-radius: 10px;
		    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
		    max-width: 1200px;
		}
		
		.article-section h2 {
		    text-align: center;
		    margin-bottom: 30px;
		    color: #b8860b;
		    font-size: 28px;
		    font-weight: bold;
		    text-transform: uppercase;
		    letter-spacing: 1px;
		}
		
		.articles {
		    display: flex;
		    flex-wrap: wrap;
		    gap: 20px;
		    justify-content: center;
		}
		
		.article {
		    flex: 1 1 calc(33.333% - 20px);
		    background-color: #f9f9f9;
		    border: 1px solid #ddd;
		    border-radius: 10px;
		    overflow: hidden;
		    text-align: center;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		    transition: transform 0.3s ease, box-shadow 0.3s ease;
		    position: relative;
		}
		
		.article:hover {
		    transform: translateY(-5px);
		    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
		}
		
		.article img {
		    width: 100%;
		    height: auto;
		    display: block;
		    border-bottom: 1px solid #ddd;
		}
		
		.article h3 {
		    font-size: 20px;
		    margin: 15px 0 10px;
		    color: #333;
		    font-weight: bold;
		}
		
		.article h3 a {
		    text-decoration: none;
		    color: #b8860b;
		    transition: color 0.3s ease;
		}
		
		.article h3 a:hover {
		    color: #8b6508;
		}
		
		.article p {
		    font-size: 14px;
		    color: #666;
		    padding: 0 15px 15px;
		    line-height: 1.6;
		}
		
		.article .read-more {
		    display: inline-block;
		    margin: 10px 0 15px;
		    padding: 8px 20px;
		    background-color: #b8860b;
		    color: white;
		    font-size: 14px;
		    font-weight: bold;
		    text-transform: uppercase;
		    border-radius: 5px;
		    text-decoration: none;
		    transition: background-color 0.3s ease;
		}
		
		.article .read-more:hover {
		    background-color: #8b6508;
		}
        .slick-slider {
            position: relative;
            width: 80%;
            margin: auto;
        }
        .slick-slide img {
            width: 100%;
            height: auto;
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">
            <img src="https://ued.udn.vn/uploads/about/logo-500.png" alt="Logo">
            <span>TRƯỜNG ĐẠI HỌC SƯ PHẠM - ĐHĐN</span>
        </div>
        <nav class="menu">
            <ul>
                <li><a href="gioithieu.jsp">Giới Thiệu</a></li>
                <li><a href="lienhe.jsp">Liên Hệ</a></li>
                <li><a href="tainguyenthuvien.jsp">Tài nguyên thư viện</a></li>
               
                <li><button class="menu-button"><i class="fas fa-user"></i></button></li>
                <li><a href="javascript:void(0);" onclick="toggleLoginRegisterForm();"><i class="fas fa-user-circle"></i> Đăng nhập / Đăng ký</a></li>
            </ul>
        </nav>    
    </header>
    <div class="banner">
        <img src="https://lrel.ued.udn.vn/uploads/text-tt2.png" alt="Banner">
    </div>

    <!-- Login and Registration Form -->
    <div class="login-box" id="login-box">
        <div class="guestBlock">
            <h3>
                <a href="#" onclick="switchTab(this);" class="guest-sign pointer current" data-switch=".log-area, .reg-area">Đăng nhập</a> 
                <a href="#" onclick="switchTab(this);" class="guest-reg pointer" data-switch=".reg-area, .log-area">Đăng ký</a>
            </h3>
            <div class="log-area">
                <form action="/vi/users/login/" method="post" onsubmit="return login_validForm(this);" autocomplete="off" novalidate="true">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Tên đăng nhập hoặc email" name="nv_login" required>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="Mật khẩu" name="nv_password" required>
                    </div>
                    <button type="submit" class="btn">Đăng nhập</button>
                </form>
            </div>
            <div class="reg-area hidden">
                <form action="/vi/users/register/" method="post" onsubmit="return reg_validForm(this);" autocomplete="off" novalidate="true">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Họ và tên đệm" name="last_name" required>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Tên" name="first_name" required>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Tên đăng nhập" name="username" required>
                    </div>
                    <div class="form-group">
                        <input type="email" class="form-control" placeholder="Email" name="email" required>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="Mật khẩu" name="password" required>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" placeholder="Lặp lại mật khẩu" name="re_password" required>
                    </div>
                    <button type="submit" class="btn">Đăng ký</button>
                </form>
            </div>
        </div>
    </div>
    <div class="article-section">
    <h2>Bài báo liên quan</h2>
    
    <div class="articles">
        <div class="article">
            <img src="https://ued.udn.vn/uploads/news/2024_12/dtgoc-sach-ba-lan-02_1.jpg" alt="Hình ảnh bài báo 1">
            <h3><a href="#">Trường Đại học Sư phạm – ĐHĐN tiếp nhận “Góc sách Ba Lan” do Đại sứ quán Cộng hòa Ba Lan trao tặng</a></h3>
            <p>Chiều ngày 05/12, tại TT Học liệu & CNTT, Trường Đại học Sư phạm - Đại học Đà Nẵng (ĐHĐN) đã diễn ra lễ tiếp nhận “Góc sách Ba Lan” với hơn 500 cuốn sách và nhiều quà tặng lưu niệm do Đại sứ quán Cộng...

Nhiều hoạt động kỷ niệm 42 năm Ngày Nhà giáo Việt Nam
KHAI MẠC “NGÀY SÁCH VIỆT NAM” TẠI TRƯỜNG ĐẠI HỌC SƯ PHẠM - ĐẠI HỌC ĐÀ NẴNG
Đà Nẵng khai mạc “Ngày sách Việt Nam”</p>
            <a href="#" class="read-more">Đọc thêm</a>
        </div>
        <div class="article">
            <img src="https://lrel.ued.udn.vn/uploads/news/2024_11/z6045793079212_e177ac8318cebf0d6affbeeeead2d4d4.jpg" alt="Hình ảnh bài báo 2">
            <h3><a href="#">Ngày sách chào mừng Kỷ niệm 42 năm Ngày Nhà giáo Việt Nam (20/11/1982 - 20/11/2024)</a></h3>
            <p>Tối ngày 18/11/2024, Thư viện Khoa học Tổng hợp Đà Nẵng phối hợp với trường Đại học Sư Phạm - Đại học Đà Nẵng tổ chức “Ngày sách Việt Nam” với chủ đề “Văn hóa đọc học đường” tại khuôn viên trường Đại học Sư phạm - Đại học Đà Nẵng</p>
            <a href="#" class="read-more">Đọc thêm</a>
        </div>
        <div class="article">
            <img src="https://ued.udn.vn/uploads/news/2024_11/img_0721_2.jpg" alt="Hình ảnh bài báo 3">
            <h3><a href="#">KHAI MẠC “NGÀY SÁCH VIỆT NAM” TẠI TRƯỜNG ĐẠI HỌC SƯ PHẠM - ĐẠI HỌC ĐÀ NẴNG</a></h3>
            <p>Tối ngày 18/11, chương trình khai mạc “Ngày Sách Việt Nam” với chủ đề “Văn hóa đọc học đường” đã diễn ra thuận lợi. Chương trình nhằm hưởng ứng ngày Sách và văn hóa đọc Việt Nam (21/4) lần thứ 3 năm 2024, đồng thời lan tỏa giá trị của sách và văn hóa đọc trong môi trường học đường hiện nay.</p>
            <a href="bao1.jsp" class="read-more">Đọc thêm</a>
        </div>
    </div>
</div>
    

    <footer>
        <p>Trường Đại học Sư phạm - ĐHĐN</p>
    </footer>

    <script>
        // Hàm kiểm tra thông tin đăng nhập
        function login_validForm(form) {
            var email = form.nv_login.value;
            var password = form.nv_password.value;
            
            // Kiểm tra thông tin đăng nhập, ví dụ email = "admin" và mật khẩu = "123"
            if (email === "admin" && password === "123") {
                // Nếu đúng, chuyển hướng đến trang "thêm, xóa, sửa"
                window.location.href = "http://localhost:8080/QuanlySach/index.jsp"; // Đổi URL này theo trang của bạn
                return false; // Ngừng hành động submit form
            } else {
                alert("Thông tin đăng nhập không chính xác.");
                return false;
            }
        }

        function toggleLoginRegisterForm() {
            var loginBox = document.getElementById("login-box");
            if (loginBox.style.display === "none" || loginBox.style.display === "") {
                loginBox.style.display = "block";
            } else {
                loginBox.style.display = "none";
            }
        }

        function switchTab(element) {
            var currentTab = element.classList.contains('guest-sign') ? '.log-area' : '.reg-area';
            var otherTab = currentTab === '.log-area' ? '.reg-area' : '.log-area';
            document.querySelector(currentTab).classList.remove('hidden');
            document.querySelector(otherTab).classList.add('hidden');
        }
    </script>
    
</body>
</html>