package vo;

public class SeatVO {
	private String seatName,seatTf;

	public SeatVO() {
		super();
	}

	public SeatVO(String seatName, String seatTf) {
		super();
		this.seatName = seatName;
		this.seatTf = seatTf;
	}

	public String getSeatName() {
		return seatName;
	}

	public void setSeatName(String seatName) {
		this.seatName = seatName;
	}

	public String getSeatTf() {
		return seatTf;
	}

	public void setSeatTf(String seatTf) {
		this.seatTf = seatTf;
	}
	
	
}
