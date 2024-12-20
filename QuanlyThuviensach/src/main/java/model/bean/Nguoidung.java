package model.bean;

public class Nguoidung {
	private int idKesach;
	private String username;
	private String password;
	public Nguoidung() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getIdKesach() {
		return idKesach;
	}
	public void setIdKesach(int idKesach) {
		this.idKesach = idKesach;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Nguoidung(int idKesach, String username, String password) {
		super();
		this.idKesach = idKesach;
		this.username = username;
		this.password = password;
	}
	
}
