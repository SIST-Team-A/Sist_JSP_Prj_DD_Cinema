package vo;

public class AdminUpdateMemberVO {
	private String memId;
	private String memName;
	private String memBirth;
	private String memGender;
	private String memEmail;
	private String memPhone;
	
	public AdminUpdateMemberVO() {
	}
	public AdminUpdateMemberVO(String memId, String memName, String memBirth, String memGender, String memEmail,
			String memPhone) {
		this.memId = memId;
		this.memName = memName;
		this.memBirth = memBirth;
		this.memGender = memGender;
		this.memEmail = memEmail;
		this.memPhone = memPhone;
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
	public String getMemGender() {
		return memGender;
	}
	public void setMemGender(String memGender) {
		this.memGender = memGender;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getMemPhone() {
		return memPhone;
	}
	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}

}
