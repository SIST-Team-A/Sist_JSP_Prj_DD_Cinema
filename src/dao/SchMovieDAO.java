package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
		//1. Connection 占쏙옙占�
			con = dc.getConn();
		//2. 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙체 占쏙옙占�
			
			String selectQuery = "select  distinct m.mv_title, m.mv_no from sch_movie scm, movie m where scm.mv_no = m.mv_no";
			pstmt = con.prepareStatement(selectQuery);
		//3. 占쏙옙占싸듸옙 占쏙옙占쏙옙占쏙옙 占쏙옙 占쌀댐옙.
		//4. 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙 占쏙옙占� 占쏙옙占�
			rs = pstmt.executeQuery();
			
			while(rs.next()) { 
				mlVO = new MovieListVO(rs.getString("mv_title"), rs.getString("mv_no"));
				list.add(mlVO);
			}//end while

			
		}finally {
		//5. 占쏙옙占쏙옙 占쏙옙占쏙옙.
			dc.dbClose(con, pstmt, rs);
		}//end try~ finally
		return list;
	}//selectSchMovie

	
	public List<SchMovieDateVO> selectSchDate(String mvTitle) throws SQLException{
		List<SchMovieDateVO> smdList= new ArrayList<SchMovieDateVO>();
		SchMovieDateVO smdVO = null;
		
		DbConnection dc = DbConnection.getInstance();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
		//1. Connection 占쏙옙占�
			con = dc.getConn();
		//2. 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙체 占쏙옙占�
			String selectQuery1 = "select scm.sch_no, scm.sch_date from sch_movie scm, movie m where (scm.mv_no = m.mv_no) and  m.mv_title = "+ mvTitle;
			pstmt = con.prepareStatement(selectQuery1);
		//3. 占쏙옙占싸듸옙 占쏙옙占쏙옙占쏙옙 占쏙옙 占쌀댐옙.
		//4. 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙 占쏙옙占� 占쏙옙占�
			rs = pstmt.executeQuery();
			while(rs.next()) { 
				smdVO = new SchMovieDateVO(rs.getString("sch_no"), rs.getString("sch_date"));
				smdList.add(smdVO);
			}//end while
		}finally {
		//5. 占쏙옙占쏙옙 占쏙옙占쏙옙.
			dc.dbClose(con, pstmt, rs);
		}//end try~ finally
		return smdList;
	}//selectSchDate
	
}//class
