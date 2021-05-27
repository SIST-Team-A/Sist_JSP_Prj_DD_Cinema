package vo;

public class SchMovieDateTimeVO {
	private String mvTitle, schDate, schStime;

	public SchMovieDateTimeVO() {
		super();
	}

	public SchMovieDateTimeVO(String mvTitle, String schDate, String schStime) {
		super();
		this.mvTitle = mvTitle;
		this.schDate = schDate;
		this.schStime = schStime;
	}

	public String getMvTitle() {
		return mvTitle;
	}

	public void setMvTitle(String mvNo) {
		this.mvTitle = mvNo;
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
	
	
}