package model.bean;

public class Ves {
	private Integer idVes;
	private Docgia Docgia;
	private Sachs Sachs;
	private String status;
	private String rentDay;
	private String returnDay;
	private String imperativeReturnDay;
	public Ves() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getIdVes() {
		return idVes;
	}
	public void setIdVes(Integer idVes) {
		this.idVes = idVes;
	}
	public Docgia getDocgia() {
		return Docgia;
	}
	public void setDocgia(Docgia docgia) {
		Docgia = docgia;
	}
	public Sachs getSachs() {
		return Sachs;
	}
	public void setSachs(Sachs sachs) {
		Sachs = sachs;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRentDay() {
		return rentDay;
	}
	public void setRentDay(String rentDay) {
		this.rentDay = rentDay;
	}
	public String getReturnDay() {
		return returnDay;
	}
	public void setReturnDay(String returnDay) {
		this.returnDay = returnDay;
	}
	public String getImperativeReturnDay() {
		return imperativeReturnDay;
	}
	public void setImperativeReturnDay(String imperativeReturnDay) {
		this.imperativeReturnDay = imperativeReturnDay;
	}
	public Ves(Integer idVes, model.bean.Docgia docgia, model.bean.Sachs sachs, String status, String rentDay,
			String returnDay, String imperativeReturnDay) {
		super();
		this.idVes = idVes;
		Docgia = docgia;
		Sachs = sachs;
		this.status = status;
		this.rentDay = rentDay;
		this.returnDay = returnDay;
		this.imperativeReturnDay = imperativeReturnDay;
	}
	
	
}
