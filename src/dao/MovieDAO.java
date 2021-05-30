package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import vo.ActorVO;
import vo.MovieMainVO;
import vo.MovieSelectVO;

public class MovieDAO {

	private static MovieDAO mDAO;

	private MovieDAO() {
	}

	public static MovieDAO getInstance() {
		if (mDAO == null) {
			mDAO = new MovieDAO();
		}

		return mDAO;
	}

	/**
	 * 상영예정 또는 개봉 둘중 하나의 상태를 입력받아 poster를 조회한다.
	 * 
	 * @param movieName
	 * @return
	 */
	public List<MovieMainVO> selectMainPoster(String OpenOrNot) throws SQLException {
		List<MovieMainVO> list = new ArrayList<MovieMainVO>();
		DbConnection dc = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;
		
		updateMovieState();
		
		try {
			con = dc.getConn();
			query = "select mv_no,mv_poster,mv_soon_poster from movie where mv_openornot = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, OpenOrNot);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new MovieMainVO(rs.getString("mv_no"), rs.getString("mv_poster"),
						rs.getString("mv_soon_poster")));
			}
		} finally {
			dc.dbClose(con, pstmt, rs);
		}

		return list;
	}

	/**
	 * 영화번호를 입력받아 해당하는 영화의 상세 정보를 조회.
	 * 
	 * @param OpenOrNot
	 * @return
	 */
	public MovieSelectVO selectMovie(String mvNo) throws SQLException {
		MovieSelectVO msVO = null;
		DbConnection dc = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;

		try {
			con = dc.getConn();
			query = "select mv_title,mv_poster,mv_genre,mv_director,mv_opendate,mv_st,mv_trailer,mv_runtime from movie where mv_no=?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, mvNo);
			rs = pstmt.executeQuery();
			rs.next();
			msVO = new MovieSelectVO(rs.getString("mv_title"), rs.getString("mv_poster"), rs.getString("mv_genre"),
					rs.getString("mv_director"), rs.getString("mv_opendate"), rs.getString("mv_st"),
					rs.getString("mv_trailer"), rs.getString("mv_runtime"), selectActor(mvNo));
		} finally {
			dc.dbClose(con, pstmt, rs);
		}
		return msVO;
	}

	/**
	 * 영화번호를 받아 배우 리스트를 반환.
	 * 
	 * @param mvNo
	 * @return
	 * @throws SQLException
	 */
	public List<ActorVO> selectActor(String mvNo) throws SQLException {
		DbConnection dc = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;
		List<ActorVO> list = new ArrayList<ActorVO>();

		try {
			con = dc.getConn();
			query = "select * from actor where mv_no = ?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, mvNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(new ActorVO(rs.getString("act_name"), rs.getString("act_mainorsub")));
			}
		} finally {
			dc.dbClose(con, pstmt, rs);
		}

		return list;
	}

	public void updateMovieState() throws SQLException {
		DbConnection dc = DbConnection.getInstance();
		Calendar calNow = Calendar.getInstance();
		Calendar calMv = Calendar.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = null;
		String[] mvCloseArr = null;
		List<String> mvNoList = new ArrayList<String>();

		try {
			con = dc.getConn();
			query = "select mv_closedate,mv_no from movie";
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				mvCloseArr = rs.getString(1).split("-");
				calMv.set(Integer.parseInt(mvCloseArr[0]), Integer.parseInt(mvCloseArr[1])-1,Integer.parseInt(mvCloseArr[2]));
//				System.out.println(calNow.get(Calendar.YEAR)+"-"+(calNow.get(Calendar.MONTH)+1)+"-"+calNow.get(Calendar.DAY_OF_MONTH));
//				System.out.println(calMv.get(Calendar.YEAR)+"-"+(calMv.get(Calendar.MONTH)+1)+"-"+calMv.get(Calendar.DAY_OF_MONTH));
//				System.out.println(calNow.after(calMv));
				if(calNow.after(calMv)) {
//					pstmt.executeUpdate("update movie set mv_openornot='C' where mv_no='"+rs.getString(2)+"'");
					mvNoList.add(rs.getString(2));
				}
			}
			pstmt.close();
			rs.close();
			
			pstmt = con.prepareStatement("update movie set mv_openornot='C' where mv_no=?");
			
			for(int i = 0; i<mvNoList.size();i++) {
				pstmt.setString(1, mvNoList.get(i));
				pstmt.executeUpdate();
				pstmt.clearParameters();
			}
			
		} finally {
			dc.dbClose(con, pstmt, rs);
		}
	}
}
