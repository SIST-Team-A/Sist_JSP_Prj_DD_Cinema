package vo;

public class ReservationMainVO {
	private String mvTitle, revNo;

	public ReservationMainVO() {
		super();
	}

	public ReservationMainVO(String mvTitle, String revNo) {
		super();
		this.mvTitle = mvTitle;
		this.revNo = revNo;
	}

	public String getMvTitle() {
		return mvTitle;
	}

	public void setMvTitle(String mvTitle) {
		this.mvTitle = mvTitle;
	}

	public String getRevNo() {
		return revNo;
	}

	public void setRevNo(String revNo) {
		this.revNo = revNo;
	}

	
}
