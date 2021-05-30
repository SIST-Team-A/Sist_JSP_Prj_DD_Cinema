package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.AdminMemberMainVO;
import vo.AdminMemberVO;
import vo.AdminUpdateMemberVO;

public class AdminMemberDAO {
	
	public AdminMemberDAO() {
	}
	
	public List<AdminMemberMainVO> selectMemberAll() throws SQLException{
		List<AdminMemberMainVO> list = new ArrayList<AdminMemberMainVO>();
		AdminMemberMainVO  ammVO = null;
		
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		DbConnection dc = DbConnection.getInstance();
		try {
			con=dc.getConn();
			String selectQuery = "select MEM_NO,MEM_ID,MEM_NAME, MEM_BIRTH from MEMBER ";
			pstmt = con.prepareStatement(selectQuery);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ammVO = new AdminMemberMainVO(rs.getString("MEM_NO"),rs.getString("MEM_ID"),rs.getString("MEM_NAME"),rs.getString("MEM_BIRTH"));
				list.add(ammVO);
			} // end while
			
		} finally {
			dc.dbClose(con, pstmt, null);
		}//end finally
		return list;
	}
	
	public AdminMemberVO selectMember(String memId) throws SQLException{
		AdminMemberVO admVO =null;
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		DbConnection dc = DbConnection.getInstance();
		try {
			con=dc.getConn();
			String selectQuery = "select *  from MEMBER where MEM_ID= ? " ;
			pstmt = con.prepareStatement(selectQuery);
			pstmt.setString(1, memId);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				admVO = new AdminMemberVO(rs.getString("mem_no"), rs.getString("mem_id"), rs.getString("mem_name"), rs.getString("mem_birth"), rs.getString("mem_gender"), rs.getString("mem_email"), rs.getString("mem_phone"), rs.getString("mem_regdate"));
			} // end while
		} finally {
			dc.dbClose(con, pstmt, null);
		}//end finally
		return admVO;
	}

public int delectMember(String memId) throws SQLException{
	int cnt =0;
	
	Connection con = null;
	PreparedStatement pstmt=null;
	
	DbConnection dc = DbConnection.getInstance();
	
	try {
		con=dc.getConn();
		
		String deletMember = "DELETE FROM MEMBER WHERE MEM_ID = '"+memId+"'";
		
		pstmt = con.prepareStatement(deletMember);
		cnt = pstmt.executeUpdate();
		
		
	} finally {
		dc.dbClose(con, pstmt, null); 
	}//end finally
	return cnt;
}

public int updateMember(AdminUpdateMemberVO aumVO) throws SQLException{
	int cnt=0;
	
	Connection con = null;
	PreparedStatement pstmt=null;
	
	DbConnection dc = DbConnection.getInstance();
	try {
		con=dc.getConn();
		//String updateMember = "UPDATE MEMBER SET MEM_NAME = 'QWE', WHERE MEM_ID = 'han' ";
		String updateMember = "UPDATE MEMBER SET MEM_NAME = ?, MEM_BIRTH = ?, MEM_GENDER = ?, MEM_EMAIL =?, MEM_PHONE = ? where MEM_ID = ? " ;
		
		pstmt = con.prepareStatement(updateMember);
		
		pstmt.setString(1, aumVO.getMemName());
		pstmt.setString(2, aumVO.getMemBirth());
		pstmt.setString(3, aumVO.getMemGender());
		pstmt.setString(4, aumVO.getMemEmail());
		pstmt.setString(5, aumVO.getMemPhone());
		pstmt.setString(6, aumVO.getMemId());
		
		cnt = pstmt.executeUpdate();
		
		
	} finally {
			dc.dbClose(con, pstmt, null);

	}//end finally
	return cnt;
}

}//class
