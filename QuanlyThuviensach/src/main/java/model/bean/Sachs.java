package model.bean;

public class Sachs {
    private int idSach;
    private String nameSach;
    private int soluong;
    private int idTheloai;
    private int idTacgia;

    // Constructor
    public Sachs(int idSach, String nameSach, int soluong, int idTheloai, int idTacgia) {
        this.idSach = idSach;
        this.nameSach = nameSach;
        this.soluong = soluong;
        this.idTheloai = idTheloai;
        this.idTacgia = idTacgia;
    }

    // Getter and Setter for idSach
    public int getIdSach() {
        return idSach;
    }

    public void setIdSach(int idSach) {
        this.idSach = idSach;
    }

    // Getter and Setter for nameSach
    public String getNameSach() {
        return nameSach;
    }

    public void setNameSach(String nameSach) {
        this.nameSach = nameSach;
    }

    // Getter and Setter for soluong
    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    // Getter and Setter for idTheloai
    public int getIdTheloai() {
        return idTheloai;
    }

    public void setIdTheloai(int idTheloai) {
        this.idTheloai = idTheloai;
    }

    // Getter and Setter for idTacgia
    public int getIdTacgia() {
        return idTacgia;
    }

    public void setIdTacgia(int idTacgia) {
        this.idTacgia = idTacgia;
    }

    @Override
    public String toString() {
        return "Sachs [idSach=" + idSach + ", nameSach=" + nameSach + ", soluong=" + soluong + ", idTheloai=" + idTheloai
                + ", idTacgia=" + idTacgia + "]";
    }
}
