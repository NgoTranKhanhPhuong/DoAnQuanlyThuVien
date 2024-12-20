package model.bean;

import java.sql.Date;

public class MemberTraMuon {
    private String MaSV;
    private String HoTen;
    private int idSach;
    private String TenSach;
    private String status;
    private Date ngayMuon;
    private Date ngayTraSach;

    // Getters and setters
    public String getMaSV() {
        return MaSV;
    }

    public void setMaSV(String maSV) {
        MaSV = maSV;
    }

    public String getHoTen() {
        return HoTen;
    }

    public void setHoTen(String hoTen) {
        HoTen = hoTen;
    }

    public int getIdSach() {
        return idSach;
    }

    public void setIdSach(int idSach) {
        this.idSach = idSach;
    }

    public String getTenSach() {
        return TenSach;
    }

    public void setTenSach(String tenSach) {
        TenSach = tenSach;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getNgayMuon() {
        return ngayMuon;
    }

    public void setNgayMuon(Date ngayMuon) {
        this.ngayMuon = ngayMuon;
    }

    public Date getNgayTraSach() {
        return ngayTraSach;
    }

    public void setNgayTraSach(Date ngayTraSach) {
        this.ngayTraSach = ngayTraSach;
    }
}
