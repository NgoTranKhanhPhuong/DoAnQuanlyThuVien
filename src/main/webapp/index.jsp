<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý Thư viện</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="icon" type="image/png" sizes="32x32" href="https://ued.udn.vn/uploads/about/logo-500.png">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            color: #333;
        }

        header {
            background-image: linear-gradient(to bottom, rgba(44, 62, 80, 0.9), rgba(44, 62, 80, 0.7)), url('https://images.unsplash.com/photo-1524995997946-a1c2e315a42f');
            background-size: cover;
            background-position: center;
            padding: 60px 20px;
            text-align: center;
            color: white;
        }

        header h1 {
            font-size: 42px;
            margin: 0;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        header p {
            font-size: 18px;
            margin-top: 10px;
        }

        .menu {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 20px;
            margin: 40px auto;
            max-width: 1200px;
            padding: 0 20px;
        }

        .menu-item {
            width: 300px;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            background-color: white;
        }

        .menu-item img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .menu-item h3 {
            font-size: 20px;
            color: #2c3e50;
            text-align: center;
            margin: 15px 0;
        }

        .menu-item a {
            display: block;
            text-decoration: none;
            text-align: center;
            background-color: #2980b9;
            color: white;
            padding: 10px 0;
            font-size: 16px;
            font-weight: bold;
            border-radius: 0 0 10px 10px;
            transition: background-color 0.3s ease;
        }

        .menu-item a:hover {
            background-color: #3498db;
        }

        .menu-item:hover {
            transform: translateY(-10px);
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.3);
        }

        footer {
            background-color: #2c3e50;
            color: white;
            padding: 20px;
            text-align: center;
            margin-top: 40px;
        }

        footer p {
            margin: 0;
        }
    </style>
</head>
<body>
    <header>
        <h1>Quản lý Thư viện</h1>
        <p>Hệ thống quản lý hiện đại và tiện lợi cho thư viện của bạn</p>
    </header>

    <div class="menu">
        <!-- Quản lý độc giả -->
        <div class="menu-item">
            <img src="https://eduz.vn/datafiles/8/2023-06/81810951-27985594-Doc-sach.jpg" alt="Độc giả">
            <h3>Quản lý độc giả</h3>
            <a href="InforDocgia.jsp">Truy cập</a>
        </div>

        <!-- Quản lý sách -->
        <div class="menu-item">
            <img src="https://images.unsplash.com/photo-1512820790803-83ca734da794" alt="Sách">
            <h3>Quản lý sách</h3>
            <a href="InforSachs.jsp">Truy cập</a>
        </div>

        <!-- Quản lý mượn sách -->
        <div class="menu-item">
            <img src="https://adminweb.thuvien.edu.vn/UploadFolderNew/UBNDLongBien/Image/qi/administrator/thu-vien-dien-tu-la-gi.jpg" alt="Mượn sách">
            <h3>Quản lý mượn sách</h3>
            <a href="InforMuonTra.jsp">Truy cập</a>
        </div>
    </div>

    <footer>
        <p>© 2024 - Quản lý Thư viện. Mọi quyền được bảo lưu.</p>
    </footer>
</body>
</html>
