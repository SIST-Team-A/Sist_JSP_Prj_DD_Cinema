package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.ReservationDAO;
import vo.ReservationInsertVO;
import vo.ReservationMainVO;
import vo.ReservationMyPageDetVO;
import vo.ReservationVO;
import vo.SeatRevVO;

public class ReservationDAO {
	private static ReservationDAO rDAO;
	
 	public ReservationDAO() {
		
	}//ReservationDAO
	
	
	
	public static ReservationDAO getInstance() {
		if(rDAO == null) {
			rDAO = new ReservationDAO();
			
		}//end if
		
		return rDAO;
	}//getInstance
	
	/**
	 * 좌석검색
	 * @param revNo
	 * @param mvTitle
	 * @param schDate
	 * @param schStime
	 * @return
	 * @throws SQLException
	 */
	public List<SeatRevVO> selectSeat(String revNo, String mvTitle, String schDate, String schStime) throws SQLException{
		List<SeatRevVO> srList = new ArrayList<SeatRevVO>();
		SeatRevVO srVO = null;
		DbConnection dc = DbConnection.getInstance();
		Connection con  =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dc.getConn();
			
			String selectQuery = "select seat_name from seat where rev_no = ? and sch_no in  (select sch_no from sch_movie where  mv_no in (select mv_no from movie where mv_title = ?) and sch_date = ? and sch_stime = ?)";
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setString(1, revNo);
			pstmt.setString(2, mvTitle);
			pstmt.setString(3, schDate);
			pstmt.setString(4, schStime);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				srVO = new SeatRevVO(rs.getString("seat_name"));
				srList.add(srVO);
			}
		}finally {
			dc.dbClose(con, pstmt, rs);
		}//end try ~finally

		return srList;
	}
	
	/**
	 * 예매 조회
	 * @param revNo
	 * @param mvTitle
	 * @param schDate
	 * @param schStime
	 * @return
	 * @throws SQLException
	 */
	public ReservationVO selectReservation(String revNo, String mvTitle, String schDate, String schStime) throws SQLException{
		ReservationVO rVO = null;
		DbConnection dc = DbConnection.getInstance();
		Connection con  =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dc.getConn();
			
			String selectQuery = " select distinct m.mv_title, sm.sch_date, sm.sch_stime, sm.sch_etime, r.rev_adultcnt, r.rev_no from movie m, sch_movie sm, seat s, reservation r where (m.mv_no = sm.mv_no) and (sm.sch_no = s.sch_no) and (s.rev_no = r.rev_no) and s.rev_no = ? and ( s.sch_no in (select sch_no from sch_movie where  mv_no in (select mv_no from movie where mv_title = ?) and sch_date = ? and sch_stime = ?))";
			pstmt = con.prepareStatement(selectQuery);
			
			pstmt.setString(1, revNo);
			pstmt.setString(2, mvTitle);
			pstmt.setString(3, schDate);
			pstmt.setString(4, schStime);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				rVO = new ReservationVO(rs.getString("mv_Title"), rs.getString("sch_Date"),
						rs.getString("sch_Stime"),rs.getString("sch_Etime"),rs.getInt("rev_AdultCnt"),rs.getString("rev_No"),selectSeat(revNo,mvTitle,schDate,schStime));
			}
		}finally {
			dc.dbClose(con, pstmt, rs);
		}//end try ~finally
		
		return rVO;
	}//selectReservation
	
	/**
	 * 예매하기
	 * @param riVO
	 * @return
	 * @throws SQLException
	 */
	public boolean insertReservation(ReservationInsertVO riVO) throws SQLException{
		boolean flag = true;
		
		int cnt = 0;
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
		//1. Connection 얻기
			con = dc.getConn();

			String insertQuery = "insert into reservation values(concat('r_',lpad(seq_rev.nextval,8,0)), ?, ?,sysdate)";

			pstmt = con.prepareStatement(insertQuery);
		//3. 바인드 변수에 값 할당.
			pstmt.setString(1, riVO.getMemId());
			pstmt.setInt(2, riVO.getRevAdultCnt());
		//4. 쿼리문 수행 후 결과 얻기
			cnt = pstmt.executeUpdate();
			if(cnt == 1) {
				flag = true;
			}
			
		}finally {
		//5. 연결 끊기.
			dc.dbClose(con, pstmt, null);
		}//end try~ finally
		
		return flag;
	}//insertReservation
	
	/**
	 * 추가된 예매정보 가져오기
	 * @return
	 * @throws SQLException
	 */
	public String selectRevNO() throws SQLException{
		String result = null;
		
		DbConnection dc = DbConnection.getInstance();
		Connection con  =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dc.getConn();
			
			String selectQuery = "select concat('r_',lpad(seq_rev.currval,8,0)) from dual" ;
			pstmt = con.prepareStatement(selectQuery);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				result = rs.getString(1);
			}
		}finally {
			dc.dbClose(con, pstmt, rs);
		}//end try ~finally
		return result;
	}
	
	 public List<SeatRevVO> selectRevSeat(String revVO) throws SQLException {
	      List<SeatRevVO> list = new ArrayList<SeatRevVO>();
	      SeatRevVO srVO = null;
	      DbConnection dc = DbConnection.getInstance();
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;

	      try {
	         con = dc.getConn();

	         String selectQuery = "select seat_name from seat where rev_no='"+revVO+"'";
	         pstmt = con.prepareStatement(selectQuery);
	         rs = pstmt.executeQuery();
	         while (rs.next()) {
	            srVO = new SeatRevVO(rs.getString("seat_name"));
	            list.add(srVO);
	         }
	      } finally {
	         dc.dbClose(con, pstmt, rs);
	      } // end try ~finally

	      return list;
	 }
	
	 public ReservationMyPageDetVO selectReservationMyDetail(String revNo) throws SQLException{
		 	
		 	ReservationMyPageDetVO rmpdVO = null;
		 	
			DbConnection dc = DbConnection.getInstance();
			Connection con  =null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				con = dc.getConn();
				
				String selectQuery = "select distinct m.mv_title, m.mv_poster,sm.sch_date, r.rev_adultcnt,s.seat_name from movie m, sch_movie sm, reservation r, seat s where (m.mv_no = sm.mv_no) and (s.rev_no = r.rev_no) and (s.sch_no = sm.sch_no) and r.rev_no = ? ";
				pstmt = con.prepareStatement(selectQuery);
				
				pstmt.setString(1, revNo);
				
				rs = pstmt.executeQuery();
				while(rs.next()) {
					rmpdVO = new ReservationMyPageDetVO(rs.getString("mv_Title"), rs.getString("mv_poster"),
							rs.getString("sch_date"),rs.getString("rev_adultcnt"),selectRevSeat(revNo));
				}
			}finally {
				dc.dbClose(con, pstmt, rs);
			}//end try ~finally
			
			return rmpdVO;
		}//selectReservation
	
	 public int delectReservation(String revNo) throws SQLException{
			int cnt =0;
			
			Connection con = null;
			PreparedStatement pstmt=null;
			
			DbConnection dc = DbConnection.getInstance();
			
			try {
				con=dc.getConn();
				
				String deletMember = "DELETE FROM RESERVATION WHERE REV_NO = '"+revNo+"'";
				
				pstmt = con.prepareStatement(deletMember);
				cnt = pstmt.executeUpdate();
				
				
			} finally {
				dc.dbClose(con, pstmt, null); 
			}//end finally
			return cnt;
		}
	 
	 public List< ReservationMainVO>  selectReservation(String id) throws SQLException{
	      List< ReservationMainVO> rmList = new ArrayList<ReservationMainVO>(); 
	      ReservationMainVO rmVO = null;
	      
	      DbConnection dc = DbConnection.getInstance();
	      Connection con  =null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         con = dc.getConn();
	         
	         String selectQuery = "select distinct m.mv_title,  r.rev_no from movie m, sch_movie sm,   reservation r, seat s  where m.mv_no = sm.mv_no    and s.rev_no = r.rev_no    and s.sch_no = sm.sch_no    and r.mem_id = '"+ id +"'";
	         
	         pstmt = con.prepareStatement(selectQuery);
	         rs = pstmt.executeQuery();
	         while(rs.next()) {
	            rmVO = new ReservationMainVO(rs.getString("mv_Title"), rs.getString("rev_No"));
	            rmList.add(rmVO);
	         }
	      }finally {
	         dc.dbClose(con, pstmt, rs);
	      }//end try ~finally
	      return rmList;
	   }
	 
}//class