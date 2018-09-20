package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn;
	private ResultSet rs;
	
public UserDAO() {
		
		try {
			String dbURL = "jdbc:mysql://localhost/test1?serverTimezone=UTC";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, "testuser","testuser");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int registerCheck(String userID, String userPass) {
		
		String sql = "select userPassword from user where userID = ?";
		try {
		PreparedStatement pstmt = conn.prepareStatement(sql);  //sql����
		pstmt.setString(1, userID); // select userPassword from user where userID = userID
		rs = pstmt.executeQuery(); // �����ؼ� ���°��� rs�� ��´�.
		if(rs.next()) { // rs�� ���� �־ �������� �Ѿ�ٸ�?
			if(rs.getString(1).equals(userPass)) { // �Էµ� ��й�ȣ�� db���� ������ ��й�ȣ�� ���� ��
				return 1; //�α��� ���� 
			}else if(!rs.getString(1).equals(userPass)){
				return 0; //��й�ȣ Ʋ��
			}
		}
		return -1; // ���̵� Ʋ��.
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2; //���۵Ǿ�°� �߸���.
		
	}
	public int idCheck(String userID) {
		String sql = "select * from user where userID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return 1; //���̵� �ߺ���.
			}
		}catch(Exception e ) {
			e.printStackTrace();
		}
		return 0; // ���԰���
	}
	
	public int joinAction(UserDTO dto) {
		String sql = "insert into user values (?,?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserID());
			pstmt.setString(2, dto.getUserPassword());
			pstmt.setString(3, dto.getUserName());
			pstmt.setString(4, dto.getUserGender());
			pstmt.setString(5, dto.getUserEmail());
			pstmt.executeUpdate();
			return 0;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return 1;
	}

}
