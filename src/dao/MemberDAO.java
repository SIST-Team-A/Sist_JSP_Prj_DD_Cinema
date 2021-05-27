package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.InsertMemberVO;
import vo.MemberLoginVO;

public class MemberDAO {
	

	public MemberDAO() {
	
	}//MemberDAO
	
	public void insertMember(InsertMemberVO imVO) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt=null;
		
		DbConnection dc = DbConnection.getInstance();
		
		try {
			con=dc.getConn();
			
			String insertMember = "insert into member values(?, concat('m_',lpad(seq_mem.nextval,8,0)), ?,?,?,?,?,?,sysdate)";
			pstmt = con.prepareStatement(insertMember);
			
			pstmt.setString(1, imVO.getMemId());
			pstmt.setString(2, imVO.getMemPss());
			pstmt.setString(3, imVO.getMemName());
			pstmt.setString(4, imVO.getMemGender());
			pstmt.setString(5, imVO.getMemBirth());
			pstmt.setString(6, imVO.getMemPhone());
			pstmt.setString(7, imVO.getMemEmail());
			
			pstmt.executeUpdate();
		} finally {
			dc.dbClose(con, pstmt, null);
		}//end finally
		
	}//insertMember
	
	public boolean selectCheckId(String memId) throws SQLException {
		boolean result = false;
		
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		DbConnection dc = DbConnection.getInstance();
		
		try {
			con=dc.getConn();
			
			String selectQuery = "select mem_id from member where mem_id='?'";
			pstmt = con.prepareStatement(selectQuery);
			
			pstmt.setString(1, memId);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result=true;
			}//end if
			
		} finally {
			dc.dbClose(con, pstmt, rs);
		}//end finally
		return result;
	}//selectCheckId
	
	
	
	
	public boolean memberLogin(MemberLoginVO mlVO) throws SQLException{
		
		return false;
	}//memberLogin
	
	
	
	
}//class