package vo;

import java.util.List;

public class MovieSelectVO {
	private String mvTitle;
	private String mvPostermvDirector;
	private String mvOpenDate;
	private String mvSt;
	private String mvTrailler;
	private List<ActorVO> actList;

	public MovieSelectVO() {
	}

	public MovieSelectVO(String mvTitle, String mvPostermvDirector, String mvOpenDate, String mvSt, String mvTrailler,
			List<ActorVO> actList) {
		super();
		this.mvTitle = mvTitle;
		this.mvPostermvDirector = mvPostermvDirector;
		this.mvOpenDate = mvOpenDate;
		this.mvSt = mvSt;
		this.mvTrailler = mvTrailler;
		this.actList = actList;
	}

	public String getMvTitle() {
		return mvTitle;
	}

	public void setMvTitle(String mvTitle) {
		this.mvTitle = mvTitle;
	}

	public String getMvPostermvDirector() {
		return mvPostermvDirector;
	}

	public void setMvPostermvDirector(String mvPostermvDirector) {
		this.mvPostermvDirector = mvPostermvDirector;
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

	public List<ActorVO> getActList() {
		return actList;
	}

	public void setActList(List<ActorVO> actList) {
		this.actList = actList;
	}

}
