package vo;

public class ActorVO {
	private String actName;
	private String actMainOrSub;

	public ActorVO() {
	}

	public ActorVO(String actName, String actMainOrSub) {
		this.actName = actName;
		this.actMainOrSub = actMainOrSub;
	}

	public String getActName() {
		return actName;
	}

	public void setActName(String actName) {
		this.actName = actName;
	}

	public String getActMainOrSub() {
		return actMainOrSub;
	}

	public void setActMainOrSub(String actMainOrSub) {
		this.actMainOrSub = actMainOrSub;
	}

	@Override
	public String toString() {
		return actName;
	}

}
