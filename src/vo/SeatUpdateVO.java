package vo;

public class SeatUpdateVO {
	private String schNo, seatName;

	public SeatUpdateVO() {
		super();
	}

	public SeatUpdateVO(String schNo, String seatName) {
		super();
		this.schNo = schNo;
		this.seatName = seatName;
	}

	public String getSchNo() {
		return schNo;
	}

	public void setSchNo(String schNo) {
		this.schNo = schNo;
	}

	public String getSeatName() {
		return seatName;
	}

	public void setSeatName(String seatName) {
		this.seatName = seatName;
	}
	
	
}//class
