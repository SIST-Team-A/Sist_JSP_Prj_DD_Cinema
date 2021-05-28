package vo;

import java.util.List;

public class ReservationVO {
	private String mvTitle, schDate, schStime, schEtime;
	private int revAdultCnt;
	private String revNo;
	private List<SeatRevVO> seatList;
	
	public ReservationVO() {
		super();
	}

	public ReservationVO(String mvTitle, String schDate, String schStime, String schEtime, int revAdultCnt,
			String revNo, List<SeatRevVO> seatList) {
		super();
		this.mvTitle = mvTitle;
		this.schDate = schDate;
		this.schStime = schStime;
		this.schEtime = schEtime;
		this.revAdultCnt = revAdultCnt;
		this.revNo = revNo;
		this.seatList = seatList;
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

	public String getSchEtime() {
		return schEtime;
	}

	public void setSchEtime(String schEtime) {
		this.schEtime = schEtime;
	}

	public int getRevAdultCnt() {
		return revAdultCnt;
	}

	public void setRevAdultCnt(int revAdultCnt) {
		this.revAdultCnt = revAdultCnt;
	}

	public String getRevNo() {
		return revNo;
	}

	public void setRevNo(String revNo) {
		this.revNo = revNo;
	}

	public List<SeatRevVO> getSeatList() {
		return seatList;
	}

	public void setSeatList(List<SeatRevVO> seatList) {
		this.seatList = seatList;
	}
	
	
	
}
