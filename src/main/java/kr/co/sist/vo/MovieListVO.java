package kr.co.sist.vo;

public class MovieListVO {
	private String mvNo, mvTitle;

	public MovieListVO() {
		super();
	}

	public MovieListVO( String mvTitle,String mvNo) {
		super();
		this.mvNo = mvNo;
		this.mvTitle = mvTitle;
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
	
	
}
