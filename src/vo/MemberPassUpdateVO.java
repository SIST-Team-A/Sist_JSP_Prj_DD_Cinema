package vo;

public class MemberPassUpdateVO {

	private String memName, memId, memEmail,memNewPass;

	public MemberPassUpdateVO() {
		super();
	}

	public MemberPassUpdateVO(String memName, String memId, String memEmail, String memNewPass) {
		super();
		this.memName = memName;
		this.memId = memId;
		this.memEmail = memEmail;
		this.memNewPass = memNewPass;
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

	public String getMemNewPass() {
		return memNewPass;
	}

	public void setMemNewPass(String memNewPass) {
		this.memNewPass = memNewPass;
	}
	
	
	
}
