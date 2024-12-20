package model.bo;

public class DocgiaBO {

    public void deleteDocGia(String maSV) {
        // Kiểm tra xem có bản ghi trong bảng phieumuon nào có MaSV này không
        boolean canDelete = checkForeignKeyInPhieuMuon(maSV);

        if (canDelete) {
            try {
				return;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} // Nếu có thể xóa, gọi phương thức xóa từ DocGiaDao
        } else {
            // Nếu không thể xóa do có ràng buộc khóa ngoại, trả về false
            return;
        }
    }

    private boolean checkForeignKeyInPhieuMuon(String maSV) {
        // Tạo logic kiểm tra trong bảng phieumuon xem có tham chiếu đến MaSV này không
        // Nếu có, trả về false, ngược lại trả về true.
        // Trong ví dụ này, bạn có thể thực hiện câu lệnh SELECT để kiểm tra
        // Hoặc, bạn có thể viết một phương thức trong DocGiaDao để thực hiện câu lệnh SELECT
        return true; // Giả sử có thể xóa, thực tế cần có logic kiểm tra trong bảng phieumuon
    }
}

