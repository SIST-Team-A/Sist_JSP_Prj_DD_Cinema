package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.DbConnection;
import vo.SchMovieDateTimeVO;
import vo.MovieListVO;
import vo.SchMovieDateVO;



public class SchMovieDAO {

	
	public SchMovieDAO() {
		
	}//SchMovieDAO
	
	public List<MovieListVO> selectSchMovie() throws SQLException{
		List<MovieListVO> list= new ArrayList<MovieListVO>();
		MovieListVO mlVO = null;
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
		//1. Connection 얻기
			con = dc.getConn();
		//2. 쿼리문 생성객체 얻기
			
			String selectQuery = "select  distinct m.mv_title, m.mv_no from sch_movie scm, movie m where scm.mv_no = m.mv_no";
			pstmt = con.prepareStatement(selectQuery);
		//3. 바인드 변수에 값 할당.
		//4. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();
			
			while(rs.next()) { 
				mlVO = new MovieListVO(rs.getString("mv_title"), rs.getString("mv_no"));
				list.add(mlVO);
			}//end while

			
		}finally {
		//5. 연결 끊기.
			dc.dbClose(con, pstmt, rs);
		}//end try~ finally
		return list;
	}//selectSchMovie

	
	public List<SchMovieDateVO> selectSchDate(String mvNo) throws SQLException{
		List<SchMovieDateVO> smdList= new ArrayList<SchMovieDateVO>();
		SchMovieDateVO smdVO = null;
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
		//1. Connection 얻기
			con = dc.getConn();
		//2. 쿼리문 생성객체 얻기
			
			String selectQuery = "select scm.sch_no,scm.mv_no, scm.sch_date from sch_movie scm, movie m where (scm.mv_no = m.mv_no) and  m.mv_no = '"+ mvNo+"'";
			pstmt = con.prepareStatement(selectQuery);
		//3. 바인드 변수에 값 할당.
		//4. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();
			
			while(rs.next()) { 
				smdVO = new SchMovieDateVO(rs.getString("sch_no"),rs.getString("mv_no") ,rs.getString("sch_date"));
				smdList.add(smdVO);
			}//end while

			
		}finally {
		//5. 연결 끊기.
			dc.dbClose(con, pstmt, rs);
		}//end try~ finally
		return smdList;
		
		
	}//selectSchDate
	
	
	public List<SchMovieDateTimeVO> selectSchTime(String schNo) throws SQLException{
		List<SchMovieDateTimeVO> smdtList= new ArrayList<SchMovieDateTimeVO>();
		SchMovieDateTimeVO smdtVO = null;
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
		//1. Connection 얻기
			con = dc.getConn();
		//2. 쿼리문 생성객체 얻기
			
			String selectQuery = "select  m.mv_title, scm.sch_date, scm.sch_stime from sch_movie scm, movie m where (scm.mv_no = m.mv_no) and scm.sch_no = '"+schNo+"'";
			pstmt = con.prepareStatement(selectQuery);
		//3. 바인드 변수에 값 할당.
		//4. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();
			
			while(rs.next()) { 
				smdtVO = new SchMovieDateTimeVO(rs.getString("mv_title"),rs.getString("sch_date") ,rs.getString("sch_stime"));
				smdtList.add(smdtVO);
			}//end while

			
		}finally {
		//5. 연결 끊기.
			dc.dbClose(con, pstmt, rs);
		}//end try~ finally
		return smdtList;
		
	}
}//class