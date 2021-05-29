package vo;

import java.util.List;

public class MovieSelectVO {
	private String mvTitle;
	private String mvPoster;
	private String mvGenre;
	private String mvDirector;
	private String mvOpenDate;
	private String mvSt;
	private String mvTrailler;
	private String mvRuntime;
	private List<ActorVO> actList;

	public MovieSelectVO(String mvTitle, String mvPoster, String mvGenre, String mvDirector, String mvOpenDate,
			String mvSt, String mvTrailler, String mvRuntime, List<ActorVO> actList) {
		this.mvTitle = mvTitle;
		this.mvPoster = mvPoster;
		this.mvGenre = mvGenre;
		this.mvDirector = mvDirector;
		this.mvOpenDate = mvOpenDate;
		this.mvSt = mvSt;
		this.mvTrailler = mvTrailler;
		this.mvRuntime = mvRuntime;
		this.actList = actList;
	}

	public String getMvTitle() {
		return mvTitle;
	}

	public void setMvTitle(String mvTitle) {
		this.mvTitle = mvTitle;
	}

	public String getMvPoster() {
		return mvPoster;
	}

	public void setMvPoster(String mvPoster) {
		this.mvPoster = mvPoster;
	}

	public String getMvGenre() {
		return mvGenre;
	}

	public void setMvGenre(String mvGenre) {
		this.mvGenre = mvGenre;
	}

	public String getMvDirector() {
		return mvDirector;
	}

	public void setMvDirector(String mvDirector) {
		this.mvDirector = mvDirector;
	}

	public String getMvOpenDate() {
		return mvOpenDate;
	}

	public void setMvOpenDate(String mvOpenDate) {
		this.mvOpenDate = mvOpenDate;
	}

	public String getMvSt() {
		return mvSt;
	}

	public void setMvSt(String mvSt) {
		this.mvSt = mvSt;
	}

	public String getMvTrailler() {
		return mvTrailler;
	}

	public void setMvTrailler(String mvTrailler) {
		this.mvTrailler = mvTrailler;
	}

	public String getMvRuntime() {
		return mvRuntime;
	}

	public void setMvRuntime(String mvRuntime) {
		this.mvRuntime = mvRuntime;
	}

	public List<ActorVO> getActList() {
		return actList;
	}

	public void setActList(List<ActorVO> actList) {
		this.actList = actList;
	}

}
