package connect;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ConnectSach")
public class ConnectSach extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DB_URL = "jdbc:mysql://localhost:3306/Thuvien_database";
    private static final String USER = "root";
    private static final String PASSWORD = "09042004";

    // Phương thức GET để hiển thị danh sách sách và form thêm sách
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Thử tải driver MySQL
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                out.println("<h2>Lỗi: Không tìm thấy driver MySQL!</h2>");
                return;
            }

            // Kết nối cơ sở dữ liệu
            try (Connection connection = DriverManager.getConnection(DB_URL, USER, PASSWORD)) {
                out.println("<h2>Kết nối cơ sở dữ liệu thành công!</h2>");

                String query = "SELECT * FROM sach"; // Truy vấn dữ liệu từ bảng Sach
                PreparedStatement statement = connection.prepareStatement(query);
                ResultSet resultSet = statement.executeQuery();

                // Thêm CSS cơ bản cho bảng
                out.println("<html><head>");
                out.println("<style>");
                out.println("table {border-collapse: collapse; width: 100%;}");
                out.println("th, td {border: 1px solid black; padding: 8px; text-align: left;}");
                out.println("th {background-color: #f2f2f2;}");
                out.println("</style>");
                out.println("</head><body>");

                out.println("<h1>Danh sách sách</h1>");
                out.println("<table>");
                out.println("<tr><th>Mã Sách</th><th>Tên Sách</th><th>Số Lượng</th><th>Thể Loại</th><th>Tác Giả</th></tr>");

                while (resultSet.next()) {
                    out.println("<tr>");
                    out.println("<td>" + resultSet.getString("idSach") + "</td>");
                    out.println("<td>" + resultSet.getString("nameSach") + "</td>");
                    out.println("<td>" + resultSet.getInt("soluong") + "</td>");
                    out.println("<td>" + resultSet.getString("idTheloai") + "</td>");
                    out.println("<td>" + resultSet.getString("idTacgia") + "</td>");
                    out.println("</tr>");
                }

                out.println("</table>");
                out.println("<h2>Thêm sách mới</h2>");
                out.println("<form action='ConnectSach' method='POST'>");
                out.println("Mã Sách: <input type='text' name='idSach'><br>");
                out.println("Tên Sách: <input type='text' name='nameSach'><br>");
                out.println("Số Lượng: <input type='number' name='soluong'><br>");
                out.println("Thể Loại (ID): <input type='text' name='idTheloai'><br>");
                out.println("Tác Giả (ID): <input type='text' name='idTacgia'><br>");
                out.println("<input type='submit' value='Thêm'>");
                out.println("</form>");

                out.println("</body></html>");

                resultSet.close();
                statement.close();
            } catch (Exception e) {
                out.println("<h2>Lỗi kết nối cơ sở dữ liệu: " + e.getMessage() + "</h2>");
            }
        } catch (Exception e) {
            throw new ServletException("Lỗi: " + e.getMessage());
        }
    }

    // Phương thức POST để thêm sách mới vào cơ sở dữ liệu
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Lấy dữ liệu từ form
            String idSach = request.getParameter("idSach");
            String nameSach = request.getParameter("nameSach");
            int soluong = Integer.parseInt(request.getParameter("soluong"));
            String idTheloai = request.getParameter("idTheloai");
            String idTacgia = request.getParameter("idTacgia");

            // Kết nối cơ sở dữ liệu
            try (Connection connection = DriverManager.getConnection(DB_URL, USER, PASSWORD)) {
                // Câu lệnh SQL để thêm sách mới vào cơ sở dữ liệu
                String query = "INSERT INTO Sach (idSach, nameSach, soluong, idTheloai, idTacgia) VALUES (?, ?, ?, ?, ?)";
                PreparedStatement statement = connection.prepareStatement(query);
                statement.setString(1, idSach);
                statement.setString(2, nameSach);
                statement.setInt(3, soluong);
                statement.setString(4, idTheloai);
                statement.setString(5, idTacgia);
                int result = statement.executeUpdate();

                if (result > 0) {
                    out.println("<h2>Thêm sách thành công!</h2>");
                } else {
                    out.println("<h2>Thêm sách thất bại!</h2>");
                }

                statement.close();
            } catch (Exception e) {
                out.println("<h2>Lỗi kết nối cơ sở dữ liệu: " + e.getMessage() + "</h2>");
            }
        } catch (Exception e) {
            throw new ServletException("Lỗi: " + e.getMessage());
        }
    }

    // Các getter để lấy thông tin kết nối
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
