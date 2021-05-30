package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import vo.AdminVO;
import vo.MemberLoginVO;
import vo.AdminMemberMainVO;

public class AdminDAO {

	public AdminDAO() {
		
	}
		public boolean adminLogin( AdminVO aVO ) throws SQLException{
			boolean result = false;

			Connection con = null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			DbConnection dc = DbConnection.getInstance();
			
			try {
				con=dc.getConn();
				String selectQuery = "select AD_ID, AD_PASS from ADMIN where AD_ID=? and AD_PASS=? ";
				pstmt = con.prepareStatement(selectQuery);
				
				pstmt.setString(1, aVO.getAdId());
				pstmt.setString(2, aVO.getAdPass());
				
				rs = pstmt.executeQuery();
				while(rs.next()) {
					result=true;
				}//end if
			} finally {
				dc.dbClose(con, pstmt, null);
			}//end finally
			return result ;
		}
			
		public boolean adminPassReset(AdminVO aVO ) throws SQLException{
			boolean result =false;
			
			Connection con = null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;

			DbConnection dc = DbConnection.getInstance();
			
			try {
				con=dc.getConn();
				
				String updateQuery = "UPDATE DDMOVIE.ADMIN SET AD_PASS = ? WHERE (AD_ID = 'ADMIN')";
				pstmt = con.prepareStatement(updateQuery);
				
				pstmt.setString(1, aVO.getAdPass());
				
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result=true;
				}//end if
			} finally {
				dc.dbClose(con, pstmt, null);
			}//end finally
			return result ;
		}
	
	
}
