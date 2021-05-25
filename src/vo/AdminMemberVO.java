package vo;

public class AdminMemberVO {
	private String memNo;
	private String memId;
	private String memName;
	private String memBirth;
	private String memGender;
	private String memEmail;
	private String memPhone;
	private String memRegdate;
	
	public AdminMemberVO() {
		
	}
	public AdminMemberVO(String memNo, String memId, String memName, String memBirth, String memGender, String memEmail,
			String memPhone, String memRegdate) {
		this.memNo = memNo;
		this.memId = memId;
		this.memName = memName;
		this.memBirth = memBirth;
		this.memGender = memGender;
		this.memEmail = memEmail;
		this.memPhone = memPhone;
		this.memRegdate = memRegdate;
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
	public String getMemRegdate() {
		return memRegdate;
	}
	public void setMemRegdate(String memRegdate) {
		this.memRegdate = memRegdate;
	}
	
}
