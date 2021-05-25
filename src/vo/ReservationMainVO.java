package vo;

public class ReservationMainVO {
	private String mvTitle, revNO;

	public ReservationMainVO() {
		super();
	}

	public ReservationMainVO(String mvTitle, String revNO) {
		super();
		this.mvTitle = mvTitle;
		this.revNO = revNO;
	}

	public String getMvTitle() {
		return mvTitle;
	}

	public void setMvTitle(String mvTitle) {
		this.mvTitle = mvTitle;
	}

	public String getRevNO() {
		return revNO;
	}

	public void setRevNO(String revNO) {
		this.revNO = revNO;
	}
	
}
