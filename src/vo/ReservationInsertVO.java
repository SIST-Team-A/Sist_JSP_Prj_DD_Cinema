package kr.co.sist.vo;

public class ReservationInsertVO {
	private String memId, revAdultCnt;

	public ReservationInsertVO() {
		super();
	}

	public ReservationInsertVO(String memId, String revAdultCnt) {
		super();
		this.memId = memId;
		this.revAdultCnt = revAdultCnt;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getRevAdultCnt() {
		return revAdultCnt;
	}

	public void setRevAdultCnt(String revAdultCnt) {
		this.revAdultCnt = revAdultCnt;
	}
	
	
}
