package vo;

public class ReservationInsertVO {
	private String memId;
	private int revAdultCnt;

	public ReservationInsertVO() {
		super();
	}

	public ReservationInsertVO(String memId, int revAdultCnt) {
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

	public int getRevAdultCnt() {
		return revAdultCnt;
	}

	public void setRevAdultCnt(int revAdultCnt) {
		this.revAdultCnt = revAdultCnt;
	}

}
