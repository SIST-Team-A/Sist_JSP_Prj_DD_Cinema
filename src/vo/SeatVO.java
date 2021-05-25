package vo;

public class SeatVO {
	private String seatName, seatTOrF;

	public SeatVO() {
		super();
	}

	public SeatVO(String seatName, String seatTOrF) {
		super();
		this.seatName = seatName;
		this.seatTOrF = seatTOrF;
	}

	public String getSeatName() {
		return seatName;
	}

	public void setSeatName(String seatName) {
		this.seatName = seatName;
	}

	public String getSeatTOrF() {
		return seatTOrF;
	}

	public void setSeatTOrF(String seatTOrF) {
		this.seatTOrF = seatTOrF;
	}
	
	
}//class
