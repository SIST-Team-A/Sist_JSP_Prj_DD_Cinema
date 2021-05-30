package vo;

import java.util.List;

public class ReservationMyPageDetVO {
	
	private String mv_title, mv_poster, sch_date, rev_adultcnt;
	private List<SeatRevVO> list;
	
	public ReservationMyPageDetVO() {
		super();
	}

	public ReservationMyPageDetVO(String mv_title, String mv_poster, String sch_date, String rev_adultcnt,
			List<SeatRevVO> list) {
		super();
		this.mv_title = mv_title;
		this.mv_poster = mv_poster;
		this.sch_date = sch_date;
		this.rev_adultcnt = rev_adultcnt;
		this.list = list;
	}

	public String getMv_title() {
		return mv_title;
	}

	public void setMv_title(String mv_title) {
		this.mv_title = mv_title;
	}

	public String getMv_poster() {
		return mv_poster;
	}

	public void setMv_poster(String mv_poster) {
		this.mv_poster = mv_poster;
	}

	public String getSch_date() {
		return sch_date;
	}

	public void setSch_date(String sch_date) {
		this.sch_date = sch_date;
	}

	public String getRev_adultcnt() {
		return rev_adultcnt;
	}

	public void setRev_adultcnt(String rev_adultcnt) {
		this.rev_adultcnt = rev_adultcnt;
	}

	public List<SeatRevVO> getList() {
		return list;
	}

	public void setList(List<SeatRevVO> list) {
		this.list = list;
	}
	
	
}
