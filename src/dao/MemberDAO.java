package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import vo.InsertMemberVO;
import vo.MemberIdFindVO;
import vo.MemberLoginVO;
import vo.MemberPassFindVO;
import vo.MemberPassUpdateVO;
import vo.SelectUpdateMemberVO;

public class MemberDAO {
	

	public MemberDAO() {
	
	}//MemberDAO
	
	public int insertMember(InsertMemberVO imVO) throws SQLException{
		int cnt=0;
		
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
			
			cnt = pstmt.executeUpdate();
		} finally {
			dc.dbClose(con, pstmt, null);
		}//end finally
		return cnt;
	}//insertMember
	
	public boolean selectCheckId(String memId) throws SQLException {
		boolean result = false;
		
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		DbConnection dc = DbConnection.getInstance();
		
		try {
			con=dc.getConn();
			
			String selectQuery = "select mem_id from member where mem_id= ? ";
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
	
	public void updateMember(SelectUpdateMemberVO sumVO) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt=null;
		
		DbConnection dc = DbConnection.getInstance();
		
		try {
			con=dc.getConn();
			String updateMember = "UPDATE MEMBER SET MEM_NAME = ?, MEM_GENDER = ?, MEM_BIRTH = ?,MEM_PHONE = ?,MEM_EMAIL = ?WHERE (MEM_ID = LOWER(?) )";
			pstmt = con.prepareStatement(updateMember);

			pstmt.setString(1, sumVO.getMemName());
			pstmt.setString(2, sumVO.getMemGender());
			pstmt.setString(3, sumVO.getMemBirth());
			pstmt.setString(4, sumVO.getMemPhone());
			pstmt.setString(5, sumVO.getMemEmail());
			pstmt.setString(6, sumVO.getMemId());
			pstmt.executeUpdate();
			
		} finally {
			dc.dbClose(con, pstmt, null);
		}//end finally
		
	}//insertMember
	
	
	
	public boolean memberLogin(MemberLoginVO mlVO) throws SQLException{
		boolean result = false;
		
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		DbConnection dc = DbConnection.getInstance();
		
		try {
			con=dc.getConn();
			
			String selectQuery = "select MEM_ID, MEM_PASS from member where mem_id=? and mem_pass=? ";
			pstmt = con.prepareStatement(selectQuery);
			
			pstmt.setString(1, mlVO.getMemId());
			pstmt.setString(2, mlVO.getMemPass());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result=true;
			}//end if
			
		} finally {
			dc.dbClose(con, pstmt, rs);
		}//end finally
		
		
		return result;
	}//memberLogin
	
	public String memberIdFind(MemberIdFindVO mifVO) throws SQLException{
		String id = null;
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		DbConnection dc = DbConnection.getInstance();
		try {
			con=dc.getConn();
			
			String selectQuery = "select MEM_ID from MEMBER where MEM_NAME = ? and MEM_EMAIL = ? ";
			
			pstmt = con.prepareStatement(selectQuery);
			
			pstmt.setString(1,mifVO.getMemName());
			pstmt.setString(2, mifVO.getMemEmail());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				id = rs.getString("MEM_ID");
			}
			
		} finally {
			dc.dbClose(con, pstmt, rs);
		}//end finally
			 
		return id ;
	}
	
	public boolean memberPassFind(MemberPassFindVO mpfVO) throws SQLException{
		boolean result = false;
		
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		DbConnection dc = DbConnection.getInstance();
		
		try {
			con=dc.getConn();
			
			String selectQuery = "select MEM_ID, MEM_PASS from member where mem_name=? and mem_id=? and mem_email=? ";
			pstmt = con.prepareStatement(selectQuery);
			
			pstmt.setString(1, mpfVO.getMemName());
			pstmt.setString(2, mpfVO.getMemId());
			pstmt.setString(3, mpfVO.getMemEmail());
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result=true;
			}//end if
			
		} finally {
			dc.dbClose(con, pstmt, rs);
		}//end finally	
		
		return result;
	}
	
	public boolean memberPassReset(MemberPassUpdateVO mpuVO) throws SQLException{
		boolean result = false;
		
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		DbConnection dc = DbConnection.getInstance();
		
		try {
			con=dc.getConn();
			
			String selectQuery = "update member set mem_pass= ? where mem_name= ? and mem_id= ? and mem_email= ? ";
			pstmt = con.prepareStatement(selectQuery);
			
			pstmt.setString(1, mpuVO.getMemNewPass());
			pstmt.setString(2, mpuVO.getMemName());
			pstmt.setString(3, mpuVO.getMemId());
			pstmt.setString(4, mpuVO.getMemEmail());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result=true;
			}//end if
			
		} finally {
			dc.dbClose(con, pstmt, rs);
		}//end finally	
		
		return result;
	}
	
	
	
	
	
	
 	public boolean memberCheckPass(String pass) throws SQLException{
		boolean result = false;
				
				Connection con = null;
				PreparedStatement pstmt=null;
				ResultSet rs=null;
				
				DbConnection dc = DbConnection.getInstance();
				
				try {
					con=dc.getConn();
					
					String selectQuery = "select * from member where mem_id='?'";
					pstmt = con.prepareStatement(selectQuery);
					
					pstmt.setString(1, pass);
					
					rs = pstmt.executeQuery();
					if(rs.next()) {
						result=true;
					}//end if
					
				} finally {
					dc.dbClose(con, pstmt, rs);
				}//end finally
				return result;	
				
	}
	
	
	
	
}//class