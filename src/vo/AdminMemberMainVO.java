package vo;

public class AdminMemberMainVO {
	private String memNo;
	private String memId;
	private String memName;
	private String memBirth;
	
	public AdminMemberMainVO() {
	}	
	public AdminMemberMainVO(String memNo, String memId, String memName, String memBirth) {
		this.memNo = memNo;
		this.memId = memId;
		this.memName = memName;
		this.memBirth = memBirth;
	}	
	public String getMemNo() {
		return memNo;
	}	
	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}	
	public String getMemId() {
		return memId;
	}	
	public void setMemId(String memId) {
		this.memId = memId;
	}	
	public String getMemName() {
		return memName;
	}	
	public void setMemName(String memName) {
		this.memName = memName;
	}	
	public String getMemBirth() {
		return memBirth;
	}	
	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth;
	}	
	
}
