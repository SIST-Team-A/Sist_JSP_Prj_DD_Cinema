package vo;

import java.util.List;
public class ReservationMemberVO {

		private String mvTitle, mvPoster , schDate, schStime, schEtime, revAdultCnt, revNo;
		private List<SeatRevVO> seatList;
		public ReservationMemberVO() {
			super();
		}
		public ReservationMemberVO(String mvTitle, String mvPoster, String schDate, String schStime, String schEtime, String revAdultCnt,
				String revNo, List<SeatRevVO> seatList) {
			super();
			this.mvTitle = mvTitle;
			this.mvPoster = mvPoster;
			this.schDate = schDate;
			this.schStime = schStime;
			this.schEtime = schEtime;
			this.revAdultCnt = revAdultCnt;
			this.revNo = revNo;
			this.seatList = seatList;
		}
		
		public String getMvPoster() {
			return mvPoster;
		}
		public void setMvPoster(String mvPoster) {
			this.mvPoster = mvPoster;
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
		public String getRevAdultCnt() {
			return revAdultCnt;
		}
		public void setRevAdultCnt(String revAdultCnt) {
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
