package vo;

public class MemberIdFindVO {
	private String memName, memEmail;

	public MemberIdFindVO() {
		super();
	}

	public MemberIdFindVO(String memName, String memEmail) {
		super();
		this.memName = memName;
		this.memEmail = memEmail;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	
	
}//class
