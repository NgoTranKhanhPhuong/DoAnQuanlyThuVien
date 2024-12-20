package connect;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectData {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/Thuvien_database";
    private static final String USER = "root";
    private static final String PASSWORD = "09042004";

    // Phương thức kết nối với cơ sở dữ liệu
    public static Connection getConnection() {
        Connection conn = null;
        try {
            // Tải driver MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Tạo kết nối với cơ sở dữ liệu
            conn = DriverManager.getConnection(DB_URL, USER, PASSWORD);
        } catch (Exception e) {
            System.err.println("Lỗi khi kết nối cơ sở dữ liệu: " + e.getMessage());
            e.printStackTrace();
        }
        return conn;
    }

    // Getter cho thông tin cơ sở dữ liệu (nếu cần dùng)
    public static String getDbUrl() {
        return DB_URL;
    }

    public static String getUser() {
        return USER;
    }

    public static String getPassword() {
        return PASSWORD;
    }
}
