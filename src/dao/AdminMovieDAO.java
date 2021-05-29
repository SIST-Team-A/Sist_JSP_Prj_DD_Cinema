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

	}// AdminMovieDAO

	public static AdminMovieDAO getInstance() {
		if (amDAO == null) {
			amDAO = new AdminMovieDAO();
		} // end if
		return amDAO;
	}

	public List<ActorVO> selectActor(String mvNO) throws SQLException {
		List<ActorVO> list = new ArrayList<ActorVO>();
		ActorVO avVO = null;
		DbConnection dc = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = dc.getConn();

			String selectQuery = "select act_name,act_mainorsub from actor where mv_no='" + mvNO + "'";
			pstmt = con.prepareStatement(selectQuery);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				avVO = new ActorVO(rs.getString("act_name"), rs.getString("act_mainorsub"));
				list.add(avVO);
			}
		} finally {
			dc.dbClose(con, pstmt, rs);
		} // end try ~finally

		return list;
	}

	public List<AdminMovieMainVO> selectMovieAll(String or) throws SQLException {
		List<AdminMovieMainVO> list = new ArrayList<AdminMovieMainVO>();
		AdminMovieMainVO ammVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();

		try {
			con = dc.getConn();
			String selectQuery = "select mv_no,mv_title,mv_director from movie where mv_openornot='" + or + "'";
			pstmt = con.prepareStatement(selectQuery);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ammVO = new AdminMovieMainVO(rs.getString("mv_no"), rs.getString("mv_title"),
						rs.getString("mv_director"), selectActor(rs.getString("mv_no")));
				list.add(ammVO);
			}
		} finally {
			dc.dbClose(con, pstmt, rs);
		} // end finally
		return list;
	}

	public AdminMovieSelectVO selectMovie(String mvNO) throws SQLException {
		AdminMovieSelectVO amsVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();

		try {
			con = dc.getConn();

			StringBuilder selectQuery = new StringBuilder();

			selectQuery.append(
					"select mv_no,mv_title,mv_poster,mv_director,mv_st,mv_trailer,mv_opendate,mv_closedate,mv_runtime,mv_regdate,mv_openornot,mv_genre,mv_soon_poster ")
					.append("from movie	").append("where mv_no='" + mvNO + "'");

			pstmt = con.prepareStatement(selectQuery.toString());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				amsVO = new AdminMovieSelectVO(rs.getString("mv_no"), rs.getString("mv_poster"),
						rs.getString("mv_soon_poster"), rs.getString("mv_title"), rs.getString("mv_director"),
						selectActor(rs.getString("mv_no")), rs.getString("mv_st"), rs.getString("mv_runtime"),
						rs.getString("mv_trailer"), rs.getString("mv_opendate"), rs.getString("mv_openornot"),
						rs.getString("mv_genre"));
			}
		} finally {
			dc.dbClose(con, pstmt, rs);
		} // end finally
		return amsVO;
	}

	public void insertMovie(MovieUpdateInsertVO muiVO) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DbConnection dc = DbConnection.getInstance();

		try {
			con = dc.getConn();
			String insertQuery = "insert into movie(mv_no,mv_title,mv_poster,mv_director,mv_st,mv_trailer,mv_opendate,mv_closedate,mv_runtime,mv_regdate,mv_openornot,mv_genre,mv_soon_poster) values(concat('m_',lpad(seq_mv.nextval,8,0)),?,?,?,?,?,?,sysdate,?,sysdate,?,?,?)";
			pstmt = con.prepareStatement(insertQuery);

			pstmt.setString(1, muiVO.getMvTitle());
			pstmt.setString(2, muiVO.getMvPoster());
			pstmt.setString(3, muiVO.getMvDirector());
			pstmt.setString(4, muiVO.getMvSt());
			pstmt.setString(5, muiVO.getMvTrailler());
			pstmt.setString(6, muiVO.getMvOpenDate());
			pstmt.setString(7, muiVO.getMvRuntime());
			pstmt.setString(8, muiVO.getMvOpenOrNot());
			pstmt.setString(9, muiVO.getMvGenre());
			pstmt.setString(10, muiVO.getMvPosterSoon());

			pstmt.executeUpdate();

			rs = pstmt.executeQuery("SELECT concat('m_',lpad(seq_mv.currval,8,0)) FROM DUAL");
			rs.next();

			insertActor(rs.getString(1), muiVO.getActLeadArr(), muiVO.getActSubArr());
		} finally {
			dc.dbClose(con, pstmt, rs);
		} // end finally
	}

	public void updateMovie(MovieUpdateInsertVO muiVO) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;

		DbConnection dc = DbConnection.getInstance();

		try {
			con = dc.getConn();

			String updateQuery = "update movie set mv_title=?,mv_poster=?,mv_director=?,mv_st=?,mv_trailer=?,mv_opendate=?,mv_runtime=?,mv_openornot=?, mv_regdate=sysdate, mv_genre=?, mv_soon_poster=? where mv_no='"
					+ muiVO.getMvNo() + "'";
			pstmt = con.prepareStatement(updateQuery);

			pstmt.setString(1, muiVO.getMvTitle());
			pstmt.setString(2, muiVO.getMvPoster());
			pstmt.setString(3, muiVO.getMvDirector());
			pstmt.setString(4, muiVO.getMvSt());
			pstmt.setString(5, muiVO.getMvTrailler());
			pstmt.setString(6, muiVO.getMvOpenDate());
			pstmt.setString(7, muiVO.getMvRuntime());
			pstmt.setString(8, muiVO.getMvOpenOrNot());
			pstmt.setString(9, muiVO.getMvGenre());
			pstmt.setString(10, muiVO.getMvPosterSoon());

			pstmt.executeUpdate();
		} finally {
			dc.dbClose(con, pstmt, null);
		} // end finally
	}

	public boolean deleteMovie(String mvNo) throws SQLException {

		int cnt = 0;
		boolean flag = false;

		Connection con = null;
		PreparedStatement pstmt = null;

		DbConnection dc = DbConnection.getInstance();

		try {
			deleteActor(mvNo);
			con = dc.getConn();
			String deleteQuery = "delete from movie where mv_no='" + mvNo + "'";
			/* String deleteQurey = "delete from movie where mv_no='" + mvNO + "'"; */
			pstmt = con.prepareStatement(deleteQuery);
			cnt = pstmt.executeUpdate();

			if (cnt == 1) {
				flag = true;
			}
		} finally {
			dc.dbClose(con, pstmt, null);
		}
		return flag;
	}// deleteCpDept

	public void insertActor(String mvNo, String[] actLeadArr, String[] actSubArr) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;

		DbConnection dc = DbConnection.getInstance();

		try {
			con = dc.getConn();
			String insertQuery = "insert into actor(mv_no,act_name,act_mainorsub) values(?,?,?)";
			pstmt = con.prepareStatement(insertQuery);

			for (int i = 0; i < actLeadArr.length; i++) {
				pstmt.setString(1, mvNo);
				pstmt.setString(2, actLeadArr[i]);
				pstmt.setString(3, "M");

				pstmt.executeUpdate();
				pstmt.clearParameters();
			}
			for (int i = 0; i < actSubArr.length; i++) {
				pstmt.setString(1, mvNo);
				pstmt.setString(2, actSubArr[i]);
				pstmt.setString(3, "S");

				pstmt.executeUpdate();
				pstmt.clearParameters();
			}
		} finally {
			dc.dbClose(con, pstmt, null);
		} // end finally
	}

	public boolean deleteActor(String mvNo) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		int cnt = 0;
		boolean flag = false;

		DbConnection dc = DbConnection.getInstance();

		try {
			con = dc.getConn();
			String deleteQuery = "delete from actor where mv_no='" + mvNo + "'";
			/* String deleteQurey = "delete from movie where mv_no='" + mvNO + "'"; */
			pstmt = con.prepareStatement(deleteQuery);
			cnt = pstmt.executeUpdate();

			if (cnt == 1) {
				flag = true;
			}
		} finally {
			dc.dbClose(con, pstmt, null);
		} // end finally
		return flag;
	}

}// class
