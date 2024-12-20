package model.bean;

public class Tacgia {
	private int idTacgia;
	private String nameTacgia;
	
	public int getIdTacgia() {
		return idTacgia;
	}
	public void setIdTacgia(int idTacgia) {
		this.idTacgia = idTacgia;
	}
	public String getNameTacgia() {
		return nameTacgia;
	}
	public void setNameTacgia(String nameTacgia) {
		this.nameTacgia = nameTacgia;
	}
	public Tacgia(int idTacgia, String nameTacgia) {
		super();
		this.idTacgia = idTacgia;
		this.nameTacgia = nameTacgia;
	}

}
