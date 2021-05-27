package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.AdminMovieCloseUpdateVO;
import vo.AdminMovieListVO;
import vo.AdminSchMovieInsertVO;
import vo.AdminSchMovieMainVO;

public class AdminSchMovieDAO {
	
	private static AdminSchMovieDAO asmDAO;
	
	public AdminSchMovieDAO(){
		
	}//AdminSchMovieDAO
	
	public static AdminSchMovieDAO getInstance() {
		if(asmDAO == null) {
			asmDAO = new AdminSchMovieDAO();
			
		}//end if
		
		return asmDAO;
	}//getInstance
	
	
	/**
	 * 메인에서 보여질 sch_movie 전체 select
	 * @return
	 * @throws SQLException
	 */
	public List<AdminSchMovieMainVO> selectSchMoavieMainAll() throws SQLException{
		List<AdminSchMovieMainVO> asmmList = new ArrayList<AdminSchMovieMainVO>();	
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection dc = DbConnection.getInstance();
		
		
		try {
			con = dc.getConn();
			
			String selectAdminMain = "select sm.sch_no, m.mv_title, sm.sch_date, sm.sch_Stime, sm.sch_etime from sch_movie sm , movie m where sm.mv_no = m.mv_no order by sm.sch_no";
			pstmt = con.prepareStatement(selectAdminMain);
			
			rs = pstmt.executeQuery();
			
			AdminSchMovieMainVO asmmVO = null;
			while(rs.next()) {
				asmmVO = new AdminSchMovieMainVO(rs.getString("sch_no"),rs.getString("mv_title"), rs.getString("sch_date"), rs.getString("sch_stime"),rs.getString("sch_etime"));
				asmmList.add(asmmVO);
			}//end while
			
		}finally {
			dc.dbClose(con, pstmt, rs);
		}//end try~finally
		
		
		
		return asmmList;
	}//selectSchMoavieMainAll
	
	
	/**
	 * 관리자에서 스케줄 추가시 영화리스트
	 * @return
	 * @throws SQLException
	 */
	public List<AdminMovieListVO>selectSchMovieAll() throws SQLException{
		List<AdminMovieListVO> amlList= new ArrayList<AdminMovieListVO>();
		AdminMovieListVO amlVO = null;
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
		//1. Connection 얻기
			con = dc.getConn();
		//2. 쿼리문 생성객체 얻기
			
			String selectQuery = "select   mv_no, mv_title, mv_opendate from  movie ";
			pstmt = con.prepareStatement(selectQuery);
		//3. 바인드 변수에 값 할당.
		//4. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();
			
			while(rs.next()) { 
				amlVO = new AdminMovieListVO(rs.getString("mv_no"), rs.getString("mv_title"), rs.getString("mv_openDate"));
				amlList.add(amlVO);
			}//end while

			
		}finally {
		//5. 연결 끊기.
			dc.dbClose(con, pstmt, rs);
		}//end try~ finally
		return amlList;
	}//selectSchMovieAll
	
	
	/**
	 * 스케줄 추가시 insert하는 메소
	 * @param asmiVO
	 * @return
	 * @throws SQLException
	 */
	public boolean insertSchMovie(AdminSchMovieInsertVO asmiVO) throws SQLException{
		boolean flag= false;
		int cnt = 0;
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
		//1. Connection 얻기
			con = dc.getConn();
		//2. 쿼리문 생성객체 얻기
			
			String insertQuery = "insert into sch_movie values(concat('h_',lpad(seq_schmv.nextval,8,0)), (select mv_no from movie where mv_title = ? and mv_opendate= ?),?,?,?,sysdate) ";
			pstmt = con.prepareStatement(insertQuery);
		//3. 바인드 변수에 값 할당.
			pstmt.setString(1, asmiVO.getMvTitle());
			pstmt.setString(2, asmiVO.getMvOpenDate());
			pstmt.setString(3, asmiVO.getSchDate());
			pstmt.setString(4, asmiVO.getSchStime());
			pstmt.setString(5, asmiVO.getSchEtime());
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
	}//insertSchMovie
	
	
	public boolean updateMovieClose(AdminMovieCloseUpdateVO amcuVO) throws SQLException{
		boolean flag = false;
		int cnt = 0;
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
		//1. Connection 얻기
			con = dc.getConn();
		//2. 쿼리문 생성객체 얻기
			
			String updateQuery = "update movie set mv_closedate = ? where mv_title = ? and mv_opendate= ?";
			pstmt = con.prepareStatement(updateQuery);
		//3. 바인드 변수에 값 할당.
			pstmt.setString(1, amcuVO.getMvCloseDate());
			pstmt.setString(2, amcuVO.getMvTitle());
			pstmt.setString(3, amcuVO.getMvOpendDate());
			
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
}//class
