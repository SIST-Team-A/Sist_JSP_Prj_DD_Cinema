package dao;

public class SchMovieDateVO {
	private String schNo, schDate;

	public SchMovieDateVO() {
		super();
	}

	public SchMovieDateVO(String schNo, String schDate) {
		super();
		this.schNo = schNo;
		this.schDate = schDate;
	}

	public String getSchNo() {
		return schNo;
	}

	public void setSchNo(String schNo) {
		this.schNo = schNo;
	}

	public String getSchDate() {
		return schDate;
	}

	public void setSchDate(String schDate) {
		this.schDate = schDate;
	}
	
	
}
