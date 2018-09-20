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
		PreparedStatement pstmt = conn.prepareStatement(sql);  //sql실행
		pstmt.setString(1, userID); // select userPassword from user where userID = userID
		rs = pstmt.executeQuery(); // 실행해서 나온값을 rs에 담는다.
		if(rs.next()) { // rs에 값이 있어서 다음으로 넘어간다면?
			if(rs.getString(1).equals(userPass)) { // 입력된 비밀번호와 db에서 가져온 비밀번호가 같을 때
				return 1; //로그인 성공 
			}else if(!rs.getString(1).equals(userPass)){
				return 0; //비밀번호 틀림
			}
		}
		return -1; // 아이디가 틀림.
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2; //전송되어온게 잘못됨.
		
	}
	public int idCheck(String userID) {
		String sql = "select * from user where userID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return 1; //아이디가 중복됨.
			}
		}catch(Exception e ) {
			e.printStackTrace();
		}
		return 0; // 가입가능
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
