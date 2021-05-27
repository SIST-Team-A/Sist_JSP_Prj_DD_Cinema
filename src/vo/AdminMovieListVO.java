package vo;

public class AdminMovieListVO {
	private String mvNo, mvTitle, mvOpenDate;

	public AdminMovieListVO() {
		super();
	}

	public AdminMovieListVO(String mvNo, String mvTitle, String mvOpenDate) {
		super();
		this.mvNo = mvNo;
		this.mvTitle = mvTitle;
		this.mvOpenDate = mvOpenDate;
	}

	public String getMvNo() {
		return mvNo;
	}

	public void setMvNo(String mvNo) {
		this.mvNo = mvNo;
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
	
	
}//AdminMovieListVO
