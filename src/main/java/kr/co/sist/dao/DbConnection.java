package kr.co.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 * DBCP�� ����Ͽ� DBConnection�� ��� ��.
 * @author jin
 */
public class DbConnection {
	private static DbConnection dc;
	
	private DbConnection() {
		
	}//DbConnection
	
	public static DbConnection getInstance() {
		if(dc == null) {
			dc = new DbConnection();
		}//end if
		return dc;
	}//getInstance
	
	
	public Connection getConn() throws SQLException{
		Connection con = null;
		
		try {
		//1. JNDI��밴ü ����
		Context ctx = new InitialContext();
		//2. DBCP���� DB�� �����ϰ� �ִ� ��ü ���
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/dbcp");
		//3. DBCP���� �����ϰ� �ִ� ��ü�� ���� Connection ���
		con = ds.getConnection();
		}catch(NamingException	ne) {
			ne.printStackTrace();
		}//end try~catch
		
		return con;
	}//getConn
	
	public void dbClose(Connection con,PreparedStatement pstmt, ResultSet rs) throws SQLException{
		if( rs != null) { rs.close();}
		if( pstmt != null) { pstmt.close();}
		if( con != null) { con.close();}
	}//dbClose
	
}//class
