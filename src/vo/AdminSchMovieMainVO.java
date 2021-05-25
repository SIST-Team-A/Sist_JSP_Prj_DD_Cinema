package vo;

public class AdminSchMovieMainVO {
	private String schNo;
	private String mvTitle;
	private String schDate;
	private String schStime;
	private String scheEtime;
	
	public AdminSchMovieMainVO() {
	}
	public AdminSchMovieMainVO(String schNo, String mvTitle, String schDate, String schStime, String scheEtime) {
		this.schNo = schNo;
		this.mvTitle = mvTitle;
		this.schDate = schDate;
		this.schStime = schStime;
		this.scheEtime = scheEtime;
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
	public String getScheEtime() {
		return scheEtime;
	}
	public void setScheEtime(String scheEtime) {
		this.scheEtime = scheEtime;
	}
	
}
