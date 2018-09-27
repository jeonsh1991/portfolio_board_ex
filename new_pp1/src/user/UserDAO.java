package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Connection conn;
	
	public UserDAO() {
		try{
			String dbUrl = "jdbc:mysql://localhost/pp?serverTimezone=UTC&characterEncoding=UTF-8";
			String jdbcDriver = "com.mysql.cj.jdbc.Driver";
		
			Class.forName(jdbcDriver);
			conn = DriverManager.getConnection(dbUrl, "testuser", "testuser");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	public int login(String uId, String uPassword) {
		String sql = "select Password from member where Id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(uPassword)) {
					return 1; // �α����� �Ǿ��� �� 1 ��ȯ
				}else return 0; // ��й�ȣ�� Ʋ������� 0 ��ȯ
			}
			return -1; // rs���� �ƹ��͵� �ȴ������ ��, ���̵� Ʋ���� ��� -1 ��ȯ
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2; // ���������� -2��ȯ
	}
	public int join(UserDTO dto) {
		String sql = "insert into member values (?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getuID());
			pstmt.setString(2, dto.getuPassword());
			pstmt.setString(3, dto.getuName());
			pstmt.setString(4, dto.getuGender());
			pstmt.setString(5, dto.getuEmail());
			pstmt.executeUpdate();
			return 1;
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return -1;
	}
	public int idChk(String uId) {
		String sql = "select Id from member where Id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return 1; //�ߺ����̵� ������� 1 ����
			}else return 0; //�ߺ����̵� ������� 0 ����
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				rs.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
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