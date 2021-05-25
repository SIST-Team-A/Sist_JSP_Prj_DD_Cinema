package vo;

public class AdminSchMovieUpdateVO {
	private String schNo;
	private String mvNo;
	private String mvOpenDate;
	private String mvCloseDate;
	private String schDate;
	private String schStime;
	private String schEtime;

	public AdminSchMovieUpdateVO() {
	}
	public AdminSchMovieUpdateVO(String schNo, String mvNo, String mvOpenDate, String mvCloseDate, String schDate,
			String schStime, String schEtime) {
		this.schNo = schNo;
		this.mvNo = mvNo;
		this.mvOpenDate = mvOpenDate;
		this.mvCloseDate = mvCloseDate;
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
	public String getMvNo() {
		return mvNo;
	}
	public void setMvNo(String mvNo) {
		this.mvNo = mvNo;
	}
	public String getMvOpenDate() {
		return mvOpenDate;
	}
	public void setMvOpenDate(String mvOpenDate) {
		this.mvOpenDate = mvOpenDate;
	}
	public String getMvCloseDate() {
		return mvCloseDate;
	}
	public void setMvCloseDate(String mvCloseDate) {
		this.mvCloseDate = mvCloseDate;
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
