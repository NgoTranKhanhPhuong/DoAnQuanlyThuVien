package model.bean;

import java.util.Date;

public class Docgia {
    private String maSV;        // Mã sinh viên
    private String hoVaTen;     // Họ và tên
    private String gioiTinh;    // Giới tính
    private Date ngaySinh;      // Ngày sinh
    private String maLop;       // Mã lớp
    private String soDienThoai; // Số điện thoại

    // Constructor không tham số
    public Docgia() {}

    // Constructor có tham số
    public Docgia(String maSV, String hoVaTen, String gioiTinh, Date ngaySinh, String maLop, String soDienThoai) {
        this.maSV = maSV;
        this.hoVaTen = hoVaTen;
        this.gioiTinh = gioiTinh;
        this.ngaySinh = ngaySinh;
        this.maLop = maLop;
        this.soDienThoai = soDienThoai;
    }

    // Getter và Setter
    public String getMaSV() {
        return maSV;
    }

    public void setMaSV(String maSV) {
        this.maSV = maSV;
    }

    public String getHoVaTen() {
        return hoVaTen;
    }

    public void setHoVaTen(String hoVaTen) {
        this.hoVaTen = hoVaTen;
    }

    public String getGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(String gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public Date getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(Date ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public String getMaLop() {
        return maLop;
    }

    public void setMaLop(String maLop) {
        this.maLop = maLop;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }

    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }

    // Phương thức toString để dễ dàng in thông tin
    @Override
    public String toString() {
        return "Docgia{" +
                "maSV='" + maSV + '\'' +
                ", hoVaTen='" + hoVaTen + '\'' +
                ", gioiTinh='" + gioiTinh + '\'' +
                ", ngaySinh=" + ngaySinh +
                ", maLop='" + maLop + '\'' +
                ", soDienThoai='" + soDienThoai + '\'' +
                '}';
    }
}
