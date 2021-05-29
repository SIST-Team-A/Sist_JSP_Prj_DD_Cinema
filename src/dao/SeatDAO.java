package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.SeatDAO;
import vo.SeatUpdateVO;
import vo.AddSeatVO;
import vo.SeatVO;

public class SeatDAO {
	private static SeatDAO sDAO;
	public SeatDAO() {
		
	}//SeatDAO
	public static SeatDAO getInstance() {
		if(sDAO == null) {
			sDAO = new SeatDAO();
			
		}//end if
		
		return sDAO;
	}//getInstance
	
	/**
	 * 
	 * seat.jsp 파일이랑 연동, 좌석에서 seat_tf가 F인 좌석을 찾음
	 * reservation.jsp에서 선택한 영화,날짜,시간을 선택해서 스케쥴에 있나확인
	 * @param movie 선택한 영화
	 * @param date 선택한 날짜
	 * @param time 선택한 시간
	 * @return
	 * @throws SQLException
	 */
	public List<SeatVO> seatAvailability(String movie, String date, String time) throws SQLException{
		List<SeatVO> slist= new ArrayList<SeatVO>();
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
		//1. Connection 얻기
			con = dc.getConn();
		//2. 쿼리문 생성객체 얻기
			
			String selectQuery = "select s.seat_name, s.seat_tf from seat s, movie m, sch_movie sm where (s.sch_no = sm.sch_no and sm.mv_no = m.mv_no) and m.mv_title ='"+movie+"'and sm.sch_date ='"+date+"' and sm.sch_stime='"+time+"' and s.seat_tf='T'";
			pstmt = con.prepareStatement(selectQuery);
			
		//3. 바인드 변수에 값 할당.
		//4. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();
			
			while(rs.next()) { 
				slist.add(new SeatVO(rs.getString("seat_name"), rs.getString("seat_tf")));
			}//end while

			
		}finally {
		//5. 연결 끊기.
			dc.dbClose(con, pstmt, rs);
		}//end try~ finally
		return slist;
	}//seatAvailability
	
	
	public int insertAddSeat(AddSeatVO asVO, String i) throws SQLException{
		int cnt = 0;
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
		//1. Connection 얻기
			con = dc.getConn();

			String insertQuery = " insert into seat values(concat('s_',lpad(seq_seat.nextval,8,0)), (select sch_no from sch_movie where  sch_date = ? and sch_stime = ? and sch_etime = ? and mv_no in (select mv_no from movie where mv_title = ? and  mv_opendate= ? ) ), NULL,concat('A-',?), 'F')";

			pstmt = con.prepareStatement(insertQuery);
		//3. 바인드 변수에 값 할당.
			pstmt.setString(1, asVO.getSchDate());
			pstmt.setString(2, asVO.getSchStime());
			pstmt.setString(3, asVO.getSchEtime());
			pstmt.setString(4, asVO.getMvTitle());
			pstmt.setString(5, asVO.getMvOpenDate());
			pstmt.setString(6, i);
		//4. 쿼리문 수행 후 결과 얻기
			cnt = pstmt.executeUpdate();
		}finally {
		//5. 연결 끊기.
			dc.dbClose(con, pstmt, null);
		}//end try~ finally
		return cnt;
	}//insertAddSeat
	
	public boolean updateSeat(SeatUpdateVO suVO) throws SQLException{
		boolean flag = false;
		int cnt = 0;
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			//1. Connection 얻기
				con = dc.getConn();
			//2. 쿼리문 생성객체 얻기
				
				String updateQuery = "update seat set rev_no= ?, seat_tf = 'T' where  sch_no in  (select sch_no from sch_movie where  mv_no in (select mv_no from movie where mv_title = ?) and sch_date = ? and sch_stime = ?) and seat_name = ?";
				pstmt = con.prepareStatement(updateQuery);
			//3. 바인드 변수에 값 할당.
				pstmt.setString(1, suVO.getRevNo());
				pstmt.setString(2, suVO.getMvTitle());
				pstmt.setString(3, suVO.getSchDate());
				pstmt.setString(4, suVO.getSchStime());
				pstmt.setString(5, suVO.getSeatName());
			//4. 쿼리문 수행 후 결과 얻기
				cnt =  pstmt.executeUpdate();
				
				if(cnt == 1) {
					flag = true;
				}
				
			}finally {
			//5. 연결 끊기.
				dc.dbClose(con, pstmt, null);
			}//end try~ finally
		
		return flag;
	}
	
	public boolean deleteSeat(String SchNo) throws SQLException{
		boolean flag = false;
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			//1. Connection 얻기
				con = dc.getConn();
			//2. 쿼리문 생성객체 얻기
				
				String deleteQuery = "delete from seat where sch_no = ?";
				pstmt = con.prepareStatement(deleteQuery);
			//3. 바인드 변수에 값 할당.
				pstmt.setString(1, SchNo);
			//4. 쿼리문 수행 후 결과 얻기
				if( pstmt.executeUpdate() == 1) {
				
					flag = true;
				}//end if
			}finally {
			//5. 연결 끊기.
				dc.dbClose(con, pstmt, null);
			}//end try~ fin
		return flag;
	}
}//class