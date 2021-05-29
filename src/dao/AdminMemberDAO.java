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

public boolean delectMember(String memNO) throws SQLException{
	boolean flage=false ;
	Connection con = null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	DbConnection dc = DbConnection.getInstance();
	try {
		con=dc.getConn();
		String deletMember = "DELETE FROM MEMBER WHERE MEM_NO = "+memNO;
		pstmt = con.prepareStatement(deletMember);
		rs = pstmt.executeQuery();
		pstmt.executeUpdate();
		
		while (rs.next()) {
			flage=true;
		} // end while
	} finally {
		dc.dbClose(con, pstmt, null);
	}//end finally
	return  flage;
}

public boolean updateMember(AdminUpdateMemberVO aumVO ) throws SQLException{
	boolean flage=false ;
	Connection con = null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	DbConnection dc = DbConnection.getInstance();
	try {
		con=dc.getConn();
		String updateMember = "UPDATE MEMBER SET (MEM_ID,MEM_NAME,MEM_BIRTH,MEM_GENDER,MEM_EMAIL,MEM_PHONE) = (?,?,?,?,?,?) ";
		pstmt = con.prepareStatement(updateMember);
		rs = pstmt.executeQuery();
		pstmt.setString(1, aumVO.getMemId());
		pstmt.setString(2, aumVO.getMemName());
		pstmt.setString(3, aumVO.getMemBirth());
		pstmt.setString(4, aumVO.getMemGender());
		pstmt.setString(5, aumVO.getMemEmail());
		pstmt.setString(6, aumVO.getMemPhone());
		pstmt.executeUpdate();
		
		while (rs.next()) {
			flage=true;
		} // end while
	} finally {
		dc.dbClose(con, pstmt, null);
	}//end finally
	return  flage;
}
}
