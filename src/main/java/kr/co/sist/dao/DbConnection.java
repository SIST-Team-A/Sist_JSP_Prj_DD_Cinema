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
 * DBCP를 사용하여 DBConnection을 얻는 일.
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
		//1. JNDI사용객체 생성
		Context ctx = new InitialContext();
		//2. DBCP에서 DB와 연결하고 있는 객체 얻기
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/dbcp");
		//3. DBCP에서 연결하고 있는 객체로 부터 Connection 얻기
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
