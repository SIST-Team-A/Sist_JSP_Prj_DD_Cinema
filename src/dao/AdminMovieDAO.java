package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.ActorVO;
import vo.AdminMovieMainVO;
import vo.AdminMovieSelectVO;
import vo.MovieUpdateInsertVO;

public class AdminMovieDAO {
	
	private static AdminMovieDAO amDAO;
	
	public AdminMovieDAO() {
		
	}//AdminMovieDAO
	
	public static AdminMovieDAO getInstance() {
		if(amDAO==null) {
			amDAO=new AdminMovieDAO();
		}//end if
		return amDAO;
	}
	
	public List<ActorVO> selectActor(String mvNO) throws SQLException{
		List<ActorVO> list=new ArrayList<ActorVO>();
		ActorVO avVO=null;
		DbConnection dc = DbConnection.getInstance();
		Connection con  =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = dc.getConn();
			
			String selectQuery = "select act_name,act_mainorsub from actor where mv_no='"+mvNO+"'";
			pstmt = con.prepareStatement(selectQuery);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				avVO = new ActorVO(rs.getString("act_name"),rs.getString("act_mainorsub"));
				list.add(avVO);		
			}
		}finally {
			dc.dbClose(con, pstmt, rs);
		}//end try ~finally

		return list;
		
	}
	
	public List<AdminMovieMainVO> selectMovieAll(String or) throws SQLException{
		List<AdminMovieMainVO> list=new ArrayList<AdminMovieMainVO>();
		AdminMovieMainVO ammVO=null;
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
			
		DbConnection dc = DbConnection.getInstance();
		
		  try {
		      //1. JNDI사용 객체를 생성.
		      //2. DBCP에서 DB연결객체를 얻기.
		      //3. DB연결 객체에서 Connection을 얻기
		    	con=dc.getConn();
		      //4. 쿼리문 생성객체 얻기	    	
		    	String selectQuery="select mv_no,mv_title,mv_director,mv_attcnt from movie where mv_openornot='"+or+"'";  
		    	pstmt=con.prepareStatement(selectQuery);
		      //5. 바인드 변수에 값 설정.
				/* pstmt.setString(1, or); */
		      //6. 쿼리문 수행.
		    	rs=pstmt.executeQuery();
		    	while(rs.next()) {		    		
		    		ammVO=new AdminMovieMainVO(rs.getString("mv_no"),rs.getString("mv_title"),rs.getString("mv_director"),selectActor(rs.getString("mv_no")),rs.getString("mv_attcnt"));
		    		list.add(ammVO);
		    	}
		      }finally {
		      //7. 연결끊기
		    	  dc.dbClose(con, pstmt, rs);
		      }//end finally     
		  return list;
	}
	
	public List<AdminMovieSelectVO> selectMovie(String mvNO) throws SQLException {//클릭한 영화의 번호가 들어감
		List<AdminMovieSelectVO> list=new ArrayList<AdminMovieSelectVO>();
		AdminMovieSelectVO amsVO=null;
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
			
		DbConnection dc = DbConnection.getInstance();
		
		  try {
		      //1. JNDI사용 객체를 생성.
		      //2. DBCP에서 DB연결객체를 얻기.
		      //3. DB연결 객체에서 Connection을 얻기
		    	con=dc.getConn();
		      //4. 쿼리문 생성객체 얻기
		    	
		    	StringBuilder selectQuery = new StringBuilder();
				
		    	selectQuery
		    	.append("	select mv_no,mv_title,mv_poster,mv_director,mv_st,mv_trailer,mv_opendate,mv_closedate,mv_runtime,mv_regdate,mv_openornot	")
		    	.append("	from movie	")
		    	.append("	where mv_no='"+mvNO+"'");
		    					    			
		    	pstmt=con.prepareStatement(selectQuery.toString());
		      //5. 바인드 변수에 값 설정.
		      //6. 쿼리문 수행.
		    	rs=pstmt.executeQuery();
		    	if(rs.next()) {		    		
		    		amsVO=new AdminMovieSelectVO(rs.getString("mv_no"),rs.getString("mv_poster"),rs.getString("mv_title"),rs.getString("mv_director"),selectActor(rs.getString("mv_no")),rs.getString("mv_st"),rs.getString("mv_runtime"),rs.getString("mv_trailer"),rs.getString("mv_opendate"),rs.getString("mv_openornot"));
		    		list.add(amsVO);
		    	}
		      }finally {
		      //7. 연결끊기
		    	  dc.dbClose(con, pstmt, rs);
		      }//end finally     
		  return list;
	}
	public void insertMovie(MovieUpdateInsertVO muiVO) throws SQLException {
		
		Connection con=null;
		PreparedStatement pstmt=null;
		
		DbConnection dc = DbConnection.getInstance();
		
		try {
			con=dc.getConn();
			
			String insertQuery="insert into movie(mv_no,mv_title,mv_poster,mv_director,mv_st,mv_trailer,mv_opendate,mv_runtime,mv_openornot) values(?,?,?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(insertQuery);
		
			pstmt.setString(1, muiVO.getMvNo());
			pstmt.setString(2, muiVO.getMvTitle());
			pstmt.setString(3, muiVO.getMvPoster());
			pstmt.setString(4, muiVO.getMvDirector());
			pstmt.setString(5, muiVO.getMvSt());
			pstmt.setString(6, muiVO.getMvTrailler());
			pstmt.setString(7, muiVO.getMvOpenDate());
			pstmt.setString(8, muiVO.getMvRuntime());
			pstmt.setString(9, muiVO.getMvOpenOrNot());
		
			pstmt.executeUpdate();
		}finally {
			//7. 연결끊기
			dc.dbClose(con, pstmt, null);
		}//end finally     		
	}
	
	
	public void updateMovie(MovieUpdateInsertVO muiVO) throws SQLException {
		
		Connection con=null;
		PreparedStatement pstmt=null;
		
		DbConnection dc = DbConnection.getInstance();
		
		try {
			con=dc.getConn();
			
			String updateQuery="update movie set mv_title=?,mv_poster=?,mv_director=?,mv_st=?,mv_trailer=?,mv_opendate=?,mv_runtime=?,mv_openornot=?, mv_regdate=sysdate where mv_no='"+muiVO.getMvNo()+"'";
			pstmt=con.prepareStatement(updateQuery);
			
			pstmt.setString(1, muiVO.getMvTitle());
			pstmt.setString(2, muiVO.getMvPoster());
			pstmt.setString(3, muiVO.getMvDirector());	
			pstmt.setString(4, muiVO.getMvSt());
			pstmt.setString(5, muiVO.getMvTrailler());
			pstmt.setString(6, muiVO.getMvOpenDate());
			pstmt.setString(7, muiVO.getMvRuntime());
			pstmt.setString(8, muiVO.getMvOpenOrNot());
			
			pstmt.executeUpdate();
		}finally {
			//7. 연결끊기
			dc.dbClose(con, pstmt, null);
		}//end finally     		
	}
	
	
	public boolean deleteMovie(String mvNO) throws SQLException{
		
		int cnt=0;
		boolean flag=false;
		
		Connection con=null;
		PreparedStatement pstmt=null;
		
		DbConnection dc = DbConnection.getInstance();
		
		//1. 드라이버로딩
		try {
		//2. 커넥션 얻기
			con=dc.getConn();
		//3. 쿼리문생성객체 얻기
			String deleteQurey="delete from movie where mv_no='"+mvNO+"'";
			pstmt=con.prepareStatement(deleteQurey);
		//4. 바인드변수에 값 설정
		//5. 쿼리문 수행 후 결과 얻기
			cnt=pstmt.executeUpdate();
			
			if(cnt==1) {
				flag=true;
			}
		}finally{
			//6. 연결 끊기
			dc.dbClose(con,pstmt,null);
		}
		return flag;
	}//deleteCpDept
	
	
	
	
	
	
	
}//class
