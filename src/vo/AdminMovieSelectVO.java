package vo;

import java.util.List;

public class AdminMovieSelectVO {

	private String mvNo;
	private String mvPoster;
	private String mvPosterSoon;
	private String mvTitle;
	private String mvDirector;
	private List<ActorVO> actorList;
	private String mvSt;
	private String mvRuntime;
	private String mvTrailer;
	private String mvOpenDate;
	private String mvOpenOrNot;
	private String mvGenre;
	private String mvCloseDate;
	private String mvRegdate;
	public AdminMovieSelectVO() {
		super();
	}
	public AdminMovieSelectVO(String mvNo, String mvPoster, String mvPosterSoon, String mvTitle, String mvDirector,
			List<ActorVO> actorList, String mvSt, String mvRuntime, String mvTrailer, String mvOpenDate,
			String mvOpenOrNot, String mvGenre, String mvCloseDate, String mvRegdate) {
		super();
		this.mvNo = mvNo;
		this.mvPoster = mvPoster;
		this.mvPosterSoon = mvPosterSoon;
		this.mvTitle = mvTitle;
		this.mvDirector = mvDirector;
		this.actorList = actorList;
		this.mvSt = mvSt;
		this.mvRuntime = mvRuntime;
		this.mvTrailer = mvTrailer;
		this.mvOpenDate = mvOpenDate;
		this.mvOpenOrNot = mvOpenOrNot;
		this.mvGenre = mvGenre;
		this.mvCloseDate = mvCloseDate;
		this.mvRegdate = mvRegdate;
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
	public String getMvPosterSoon() {
		return mvPosterSoon;
	}
	public void setMvPosterSoon(String mvPosterSoon) {
		this.mvPosterSoon = mvPosterSoon;
	}
	public String getMvTitle() {
		return mvTitle;
	}
	public void setMvTitle(String mvTitle) {
		this.mvTitle = mvTitle;
	}
	public String getMvDirector() {
		return mvDirector;
	}
	public void setMvDirector(String mvDirector) {
		this.mvDirector = mvDirector;
	}
	public List<ActorVO> getActorList() {
		return actorList;
	}
	public void setActorList(List<ActorVO> actorList) {
		this.actorList = actorList;
	}
	public String getMvSt() {
		return mvSt;
	}
	public void setMvSt(String mvSt) {
		this.mvSt = mvSt;
	}
	public String getMvRuntime() {
		return mvRuntime;
	}
	public void setMvRuntime(String mvRuntime) {
		this.mvRuntime = mvRuntime;
	}
	public String getMvTrailer() {
		return mvTrailer;
	}
	public void setMvTrailer(String mvTrailer) {
		this.mvTrailer = mvTrailer;
	}
	public String getMvOpenDate() {
		return mvOpenDate;
	}
	public void setMvOpenDate(String mvOpenDate) {
		this.mvOpenDate = mvOpenDate;
	}
	public String getMvOpenOrNot() {
		return mvOpenOrNot;
	}
	public void setMvOpenOrNot(String mvOpenOrNot) {
		this.mvOpenOrNot = mvOpenOrNot;
	}
	public String getMvGenre() {
		return mvGenre;
	}
	public void setMvGenre(String mvGenre) {
		this.mvGenre = mvGenre;
	}
	public String getMvCloseDate() {
		return mvCloseDate;
	}
	public void setMvCloseDate(String mvCloseDate) {
		this.mvCloseDate = mvCloseDate;
	}
	public String getMvRegdate() {
		return mvRegdate;
	}
	public void setMvRegdate(String mvRegdate) {
		this.mvRegdate = mvRegdate;
	}
	
	
	
}