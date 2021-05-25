package vo;

public class SchSelectVO {
	private String mvNO, mvTitle, schDate, schStime, schEtime;

	public SchSelectVO() {
		super();
	}

	public SchSelectVO(String mvNO, String mvTitle, String schDate, String schStime, String schEtime) {
		super();
		this.mvNO = mvNO;
		this.mvTitle = mvTitle;
		this.schDate = schDate;
		this.schStime = schStime;
		this.schEtime = schEtime;
	}

	public String getMvNO() {
		return mvNO;
	}

	public void setMvNO(String mvNO) {
		this.mvNO = mvNO;
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
