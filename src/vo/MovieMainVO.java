package vo;

public class MovieMainVO {

	private String mvNo;
	private String mvPoster;

	public MovieMainVO() {
	}

	public MovieMainVO(String mvNo, String mvPoster) {
		this.mvNo = mvNo;
		this.mvPoster = mvPoster;
	}

	public String getMvNo() {
		return mvNo;
	}

	public void setMvNo(String mvNo) {
		this.mvNo = mvNo;
	}

	public String getMvPoster() {
		return mvPoster;
	}

	public void setMvPoster(String mvPoster) {
		this.mvPoster = mvPoster;
	}

}
