package vo;

public class AdminSchMovieMainVO {
	private String schNo;
	private String mvTitle;
	private String schDate;
	private String schStime;
	private String schEtime;
	
	public AdminSchMovieMainVO() {
	}
	public AdminSchMovieMainVO(String schNo, String mvTitle, String schDate, String schStime, String schEtime) {
		this.schNo = schNo;
		this.mvTitle = mvTitle;
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
	public String getMvTitle() {
		return mvTitle;
	}
	public void setMvTitle(String mvTitle) {
		this.mvTitle = mvTitle;
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
