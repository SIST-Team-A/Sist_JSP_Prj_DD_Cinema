package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.AdminSchMovieDAO;
import vo.AdminSchMovieSelectVO;
import vo.AdminSchMovieUpdateVO;
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
	 * 관리자 스케줄 관리 메인 리스트
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
	 *스케줄 추가할떄 영화리스트 띄우기
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
			con = dc.getConn();
			
			String selectQuery = "select   mv_no, mv_title, mv_opendate from  movie ";
			pstmt = con.prepareStatement(selectQuery);
			rs = pstmt.executeQuery();
			
			while(rs.next()) { 
				amlVO = new AdminMovieListVO(rs.getString("mv_no"), rs.getString("mv_title"), rs.getString("mv_openDate"));
				amlList.add(amlVO);
			}//end while

			
		}finally {
			dc.dbClose(con, pstmt, rs);
		}//end try~ finally
		return amlList;
	}//selectSchMovieAll
	
	
	/**
	 * 스케줄 추가 
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
			con = dc.getConn();
			
			String insertQuery = "insert into sch_movie values(concat('h_',lpad(seq_schmv.nextval,8,0)), (select mv_no from movie where mv_title = ? and mv_opendate= ?),?,?,sysdate,?) ";
			pstmt = con.prepareStatement(insertQuery);
			pstmt.setString(1, asmiVO.getMvTitle());
			pstmt.setString(2, asmiVO.getMvOpenDate());
			pstmt.setString(3, asmiVO.getSchDate());
			pstmt.setString(4, asmiVO.getSchStime());
			pstmt.setString(5, asmiVO.getSchEtime());
			 cnt = pstmt.executeUpdate();
			
			if(cnt == 1) {
				flag = true;
			}
			
		}finally {
			dc.dbClose(con, pstmt, null);
		}//end try~ finally
		
		return flag;
	}//insertSchMovie
	
	
	/**
	 * 스케줄 추가, 수정할 때 영화 개봉종료일 업데이트
	 * @param mvTitle
	 * @param closeDate
	 * @return
	 * @throws SQLException
	 */
	public boolean updateMovieClose(String mvTitle, String closeDate) throws SQLException{
		boolean flag = false;
		int cnt = 0;
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = dc.getConn();
			
			String updateQuery = "update movie set mv_closedate = ? where mv_no in (select mv_no from movie where mv_title = ?)";
			pstmt = con.prepareStatement(updateQuery);
			
			pstmt.setString(1, closeDate);
			pstmt.setString(2, mvTitle);
			cnt =  pstmt.executeUpdate();
			
			if(cnt == 1) {
				flag = true;
			}
			
		}finally {
		//5. 쩔짭째찼 짼첨짹창.
			dc.dbClose(con, pstmt, null);
		}//end try~ finally
		
		return flag;
	}

	/**
	 * 상세보기
	 * @param schNo
	 * @return
	 * @throws SQLException
	 */
	public AdminSchMovieSelectVO selcetSchMovie(String schNo) throws SQLException{
		AdminSchMovieSelectVO asmsVO= null;
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dc.getConn();
			
			
			String selectQuery = "select m.mv_no,  m.mv_title, m.mv_opendate, m.mv_closedate, sm.sch_date, sm.sch_stime, sm.sch_etime from movie m, sch_movie sm where m.mv_no = sm.mv_no and sm.sch_no = ?";
			pstmt = con.prepareStatement(selectQuery);
		//3. 쨔횢�횓쨉책 쨘짱쩌철쩔징 째짧 횉횘쨈챌.
			pstmt.setString(1, schNo);

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				asmsVO = new AdminSchMovieSelectVO(rs.getString("mv_no"), rs.getString("mv_title"), rs.getString("mv_opendate"), rs.getString("mv_closedate"), rs.getString("sch_date"), rs.getString("sch_stime"), rs.getString("sch_etime"));
				
			}
		}finally {
			
			dc.dbClose(con, pstmt, rs);
		}//end try~finally
		return asmsVO;
	}
	
	/**
	 * 스케줄 삭제
	 * @param SchNo
	 * @return
	 * @throws SQLException
	 */
	public boolean deleteSchMovie(String SchNo) throws SQLException{
		boolean flag=  false;

		DbConnection dc =DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
		//1. Connection 쩐챵짹창
			con = dc.getConn();
			
			String deleteQuery = "delete from sch_movie where sch_no = ?";
			pstmt = con.prepareStatement(deleteQuery);
			pstmt.setString(1, SchNo);
		
			
			if(pstmt.executeUpdate() == 1) {
				flag = true;
			}
			
		}finally {
			dc.dbClose(con, pstmt, null);
		}//end try~ finally
		return flag;
	}

	
	/**
	 * 스케줄 수정 
	 * @param asmuVO
	 * @return
	 * @throws SQLException
	 */
	public boolean updateSchMovie(AdminSchMovieUpdateVO asmuVO) throws SQLException{
		boolean flag = false;
		
		DbConnection dc =DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = dc.getConn();
			
			String updateQuery = "update sch_movie set sch_date = ?, sch_stime = ?, sch_etime = ? where sch_no = ?";
			pstmt = con.prepareStatement(updateQuery);
			pstmt.setString(1, asmuVO.getSchDate());
			pstmt.setString(2, asmuVO.getSchStime());
			pstmt.setString(3, asmuVO.getSchEtime());
			pstmt.setString(4, asmuVO.getSchNo());
		
			
			if(pstmt.executeUpdate() == 1) {
				flag = true;
			}
			
		}finally {
			dc.dbClose(con, pstmt, null);
		}//end try~ finally
		
		return flag;
	}
}//class