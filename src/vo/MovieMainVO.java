package vo;

public class MovieMainVO {

	private String mvNo;
	private String mvPoster;
	private String mvSoonPoster;
	
	public MovieMainVO() {
		super();
	}
	
	public MovieMainVO(String mvNo, String mvPoster, String mvSoonPoster) {
		super();
		this.mvNo = mvNo;
		this.mvPoster = mvPoster;
		this.mvSoonPoster = mvSoonPoster;
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

	public String getMvSoonPoster() {
		return mvSoonPoster;
	}

	public void setMvSoonPoster(String mvSoonPoster) {
		this.mvSoonPoster = mvSoonPoster;
	}
	
}
