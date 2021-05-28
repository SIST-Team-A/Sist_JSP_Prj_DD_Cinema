package vo;

public class SeatUpdateVO {
	private String mvTitle, schDate, schStime, seatName, revNo;

	public SeatUpdateVO() {
		super();
	}

	public SeatUpdateVO(String mvTitle, String schDate, String schStime, String seatName, String revNo) {
		super();
		this.mvTitle = mvTitle;
		this.schDate = schDate;
		this.schStime = schStime;
		this.seatName = seatName;
		this.revNo = revNo;
	}

	public String getMvTitle() {
		return mvTitle;
	}

	public void setMvTitle(String mvTitle) {
		this.mvTitle = mvTitle;
	}

	public String getSchDate() {
		return schDate;
	}

	public void setSchDate(String schDate) {
		this.schDate = schDate;
	}

	public String getSchStime() {
		return schStime;
	}

	public void setSchStime(String schStime) {
		this.schStime = schStime;
	}

	public String getSeatName() {
		return seatName;
	}

	public void setSeatName(String seatName) {
		this.seatName = seatName;
	}

	public String getRevNo() {
		return revNo;
	}

	public void setRevNo(String revNo) {
		this.revNo = revNo;
	}
	
}

