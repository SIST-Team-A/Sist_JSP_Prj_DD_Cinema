package vo;

public class MovieUpdateInsertVO {
	private String mvNo;
	private String mvPoster;
	private String mvTitle;
	private String mvDirector;
	private String[] actorNamearr;
	private String[] actorRoleArr;
	private String mvSt;
	private String mvRuntime;
	private String mvTrailler;
	private String mvOpenDate;
	private String mvOpenOrNot;
	public MovieUpdateInsertVO() {
		super();
	}
	public MovieUpdateInsertVO(String mvNo, String mvPoster, String mvTitle, String mvDirector, String[] actorNamearr,
			String[] actorRoleArr, String mvSt, String mvRuntime, String mvTrailler, String mvOpenDate,
			String mvOpenOrNot) {
		super();
		this.mvNo = mvNo;
		this.mvPoster = mvPoster;
		this.mvTitle = mvTitle;
		this.mvDirector = mvDirector;
		this.actorNamearr = actorNamearr;
		this.actorRoleArr = actorRoleArr;
		this.mvSt = mvSt;
		this.mvRuntime = mvRuntime;
		this.mvTrailler = mvTrailler;
		this.mvOpenDate = mvOpenDate;
		this.mvOpenOrNot = mvOpenOrNot;
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
	public String[] getActorNamearr() {
		return actorNamearr;
	}
	public void setActorNamearr(String[] actorNamearr) {
		this.actorNamearr = actorNamearr;
	}
	public String[] getActorRoleArr() {
		return actorRoleArr;
	}
	public void setActorRoleArr(String[] actorRoleArr) {
		this.actorRoleArr = actorRoleArr;
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
	public String getMvTrailler() {
		return mvTrailler;
	}
	public void setMvTrailler(String mvTrailler) {
		this.mvTrailler = mvTrailler;
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
	
}
