package vo;

public class MemberLoginVO {
	private String memId, memPass;

	public MemberLoginVO() {
		super();
	}

	public MemberLoginVO(String memId, String memPass) {
		super();
		this.memId = memId;
		this.memPass = memPass;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPass() {
		return memPass;
	}

	public void setMemPass(String memPass) {
		this.memPass = memPass;
	}
	
	
	
	
	
}//class
