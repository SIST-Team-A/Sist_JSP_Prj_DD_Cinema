package vo;

public class AdminSchMovieUpdateVO {
		private String schNo;
	private String schDate;
	private String schStime;
	private String schEtime;

	public AdminSchMovieUpdateVO() {
	}

	public AdminSchMovieUpdateVO(String schNo, String schDate, String schStime, String schEtime) {
		super();
		this.schNo = schNo;
		this.schDate = schDate;
		this.schStime = schStime;
		this.schEtime = schEtime;
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

	public String getSchStime() {
		return schStime;
	}

	public void setSchStime(String schStime) {
		this.schStime = schStime;
	}

	public String getSchEtime() {
		return schEtime;
	}

	public void setSchEtime(String schEtime) {
		this.schEtime = schEtime;
	}

	
	
	
}
