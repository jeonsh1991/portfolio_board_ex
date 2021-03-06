package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UserDAO {
	
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Connection conn;
	
	public UserDAO() {
		try{
			String dbUrl = "jdbc:mysql://localhost/pp?serverTimezone=UTC";
			String jdbcDriver = "com.mysql.cj.jdbc.Driver";
		
			Class.forName(jdbcDriver);
			conn = DriverManager.getConnection(dbUrl, "root", "tmdgml65");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public int login(String uId, String uPassword) {
		String sql = "select uPassword from member where uId=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(uPassword)) {
					return 1; // 로그인이 되었을 때 1 반환
				}else return 0; // 비밀번호가 틀렸을경우 0 반환
			}
			return -1; // rs값에 아무것도 안담겼을때 즉, 아이디가 틀렸을 경우 -1 반환
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2; // 오류났을때 -2반환
	}
	public int join(String uId, String uPassword, String uName, String uNick) {
		String sql = "insert into member values (?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uId);
			pstmt.setString(2, uPassword);
			pstmt.setString(3, uName);
			pstmt.setString(4, uNick);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int idChk(String uId) {
		String sql = "select uId from member where uId=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return 1; //중복아이디가 있을경우 1 리턴
			}else return 0; //중복아이디가 없을경우 0 리턴
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public String getInfo(String id) {
		String sql = "select uNick from member where uId=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				pstmt.close();
			}catch(Throwable e) {
				e.printStackTrace();
			}try {
				rs.close();
			}catch(Throwable e) {
				e.printStackTrace();
			}
		}
		return "";
	}

}
