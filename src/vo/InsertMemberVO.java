package vo;

public class InsertMemberVO {
	private String memId, memPass, memName,memGender,memBirth,memPhone,memEmail;

	public InsertMemberVO() {
		super();
	}

	public InsertMemberVO(String memId, String memPass, String memName, String memGender, String memBirth,
			String memPhone, String memEmail) {
		super();
		this.memId = memId;
		this.memPass = memPass;
		this.memName = memName;
		this.memGender = memGender;
		this.memBirth = memBirth;
		this.memPhone = memPhone;
		this.memEmail = memEmail;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPss() {
		return memPass;
	}

	public void setMemPss(String memPass) {
		this.memPass = memPass;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemGender() {
		return memGender;
	}

	public void setMemGender(String memGender) {
		this.memGender = memGender;
	}

	public String getMemBirth() {
		return memBirth;
	}

	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth;
	}

	public String getMemPhone() {
		return memPhone;
	}

	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	
	
	
}//class
