<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm Phiếu Mượn</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="icon" type="image/png" sizes="32x32" href="https://ued.udn.vn/uploads/about/logo-500.png">
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f4; }
        header { background-color: #2c3e50; color: white; padding: 20px; text-align: center; }
        .container { width: 60%; margin: 30px auto; background-color: white; padding: 20px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #2980b9; color: white; }
        tr:hover { background-color: #f1f1f1; }
        footer { text-align: center; margin-top: 50px; background-color: #2c3e50; color: white; padding: 10px; }
        button.add-btn {
            display: inline-block;
            padding: 10px 20px;
            margin-bottom: 20px;
            background-color: #2ecc71;  /* Màu xanh lá cây */
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        button.add-btn:hover {
            background-color: #27ae60;  /* Màu xanh lá cây đậm khi hover */
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            font-size: 16px;
            display: block;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 8px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
    </style>
</head>
<body>

    <header>
        <h1>Thêm Phiếu Mượn</h1>
    </header>

    <div class="container">
        <h2>Thông tin Phiếu Mượn</h2>
        <form action="AddPhieuServlet" method="POST">
            <div class="form-group">
                <label for="maSV">Mã SV:</label>
                <input type="text" id="maSV" name="maSV" required>
            </div>

            <div class="form-group">
                <label for="idSach">Tên Sách:</label>
                <select id="idSach" name="idSach" required>
                    <%
                        Connection conn = null;
                        Statement stmt = null;
                        ResultSet rs = null;

                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Thuvien_database", "root", "09042004");
                            stmt = conn.createStatement();
                            String sql = "SELECT idSach, nameSach FROM sach";
                            rs = stmt.executeQuery(sql);

                            while (rs.next()) {
                                int idSach = rs.getInt("idSach");
                                String nameSach = rs.getString("nameSach");
                    %>
                                <option value="<%= idSach %>"><%= nameSach %></option>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            try {
                                if (rs != null) rs.close();
                                if (stmt != null) stmt.close();
                                if (conn != null) conn.close();
                            } catch (SQLException se) {
                                se.printStackTrace();
                            }
                        }
                    %>
                </select>
            </div>

            <div class="form-group">
                <label for="ngayMuon">Ngày Mượn:</label>
                <input type="date" id="ngayMuon" name="ngayMuon" required>
            </div>

            <div class="form-group">
                <label for="ngayPhaiTra">Ngày Phải Trả:</label>
                <input type="date" id="ngayPhaiTra" name="ngayPhaiTra" required>
            </div>

            <button type="submit" class="add-btn">Thêm Phiếu Mượn</button>
        </form>
    </div>

    <footer>
        <p>Trường Đại học Sư phạm - ĐHĐN</p>
    </footer>

</body> 
</html>
