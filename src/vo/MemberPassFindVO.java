package vo;

public class MemberPassFindVO {
	private String memName, memId, memEmail;

	public MemberPassFindVO() {
		super();
	}

	public MemberPassFindVO(String memName, String memId, String memEmail) {
		super();
		this.memName = memName;
		this.memId = memId;
		this.memEmail = memEmail;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	
	
}//class
