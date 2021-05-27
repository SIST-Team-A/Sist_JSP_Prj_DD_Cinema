package vo;

public class SchMovieDateVO {
	private String schNo,mvNo, schDate;

	public SchMovieDateVO() {
		super();
	}

	public SchMovieDateVO(String schNo, String mvNo, String schDate) {
		super();
		this.schNo = schNo;
		this.mvNo = mvNo;
		this.schDate = schDate;
	}

	public String getSchNo() {
		return schNo;
	}

	public void setSchNo(String mvNo) {
		this.mvNo = schNo;
	}
	public String getMvNo() {
		return mvNo;
	}
	
	public void setMvNo(String mvNo) {
		this.mvNo = mvNo;
	}

	public String getSchDate() {
		return schDate;
	}

	public void setSchDate(String schDate) {
		this.schDate = schDate;
	}
	
	
}