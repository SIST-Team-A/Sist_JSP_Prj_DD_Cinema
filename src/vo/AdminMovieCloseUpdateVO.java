package vo;

public class AdminMovieCloseUpdateVO {
	private String mvTitle, mvOpendDate, mvCloseDate;

	public AdminMovieCloseUpdateVO() {
		super();
	}

	public AdminMovieCloseUpdateVO(String mvTitle, String mvOpendDate, String mvCloseDate) {
		super();
		this.mvTitle = mvTitle;
		this.mvOpendDate = mvOpendDate;
		this.mvCloseDate = mvCloseDate;
	}

	public String getMvTitle() {
		return mvTitle;
	}

	public void setMvTitle(String mvTitle) {
		this.mvTitle = mvTitle;
	}

	public String getMvOpendDate() {
		return mvOpendDate;
	}

	public void setMvOpendDate(String mvOpendDate) {
		this.mvOpendDate = mvOpendDate;
	}

	public String getMvCloseDate() {
		return mvCloseDate;
	}

	public void setMvCloseDate(String mvCloseDate) {
		this.mvCloseDate = mvCloseDate;
	}

	
	
}
