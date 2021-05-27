package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.SeatVO;

public class SeatDAO {

	public SeatDAO() {

	}// SeatDAO

	public List<SeatVO> seatAvailability(String movie, String date, String time) throws SQLException {
		List<SeatVO> slist = new ArrayList<SeatVO>();

		DbConnection dc = DbConnection.getInstance();

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			// 1. Connection ���
			con = dc.getConn();
			// 2. ������ ������ü ���

			String selectQuery = "select s.seat_name, s.seat_tf from seat s, movie m, sch_movie sm where (s.sch_no = sm.sch_no and sm.mv_no = m.mv_no) and m.mv_title ='"
					+ movie + "'and sm.sch_date ='" + date + "' and sm.sch_stime='" + time + "' and s.seat_tf='T'";
			pstmt = con.prepareStatement(selectQuery);

			// 3. ���ε� ������ �� �Ҵ�.
			// 4. ������ ���� �� ��� ���
			rs = pstmt.executeQuery();

			while (rs.next()) {
				slist.add(new SeatVO(rs.getString("seat_name"), rs.getString("seat_tf")));
			} // end while

		} finally {
			// 5. ���� ����.
			dc.dbClose(con, pstmt, rs);
		} // end try~ finally
		return slist;
	}// seatAvailability
}// class
