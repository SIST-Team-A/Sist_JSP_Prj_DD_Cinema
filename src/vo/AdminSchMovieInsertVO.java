package vo;

public class AdminSchMovieInsertVO {	
	private String mvTitle;
	private String mvOpenDate;
	private String mvCloseDate;
	private String schDate;
	private String schStime;
	private String schEtime;
	
	public AdminSchMovieInsertVO() {
	}
	public AdminSchMovieInsertVO(String mvTitle, String mvOpenDate, String mvCloseDate, String schDate, String schStime,
			String schEtime) {
		this.mvTitle = mvTitle;
		this.mvOpenDate = mvOpenDate;
		this.mvCloseDate = mvCloseDate;
		this.schDate = schDate;
		this.schStime = schStime;
		this.schEtime = schEtime;
	}
	public String getMvTitle() {
		return mvTitle;
	}
	public void setMvTitle(String mvTitle) {
		this.mvTitle = mvTitle;
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
