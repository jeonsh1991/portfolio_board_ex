package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {
	
	private ResultSet rs;
	private Connection conn;
	
	public BoardDAO() {
		try {
			String dbUrl = "jdbc:mysql://localhost/pp?serverTimezone=UTC";
			String jdbcDriver = "com.mysql.cj.jdbc.Driver";
			
			Class.forName(jdbcDriver);
			conn = DriverManager.getConnection(dbUrl, "root", "tmdgml65");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	public String getDate() {
		String sql = "select now()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1); // ����Ʈ���� ������ ����Ʈ�� ����
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //������ ����
	}
	public int getNext() {
		String sql = "select num from board order by num desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1;
		}catch(Throwable e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int Write(String Category, String Title, String uNick, String Nickname, String Content) {
		String sql = "insert into board values(?,?,?,?,?,?,?,?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, Category);
			pstmt.setString(3, Title);
			pstmt.setString(4, uNick);
			pstmt.setString(5, Nickname);
			pstmt.setString(6, Content);
			pstmt.setString(7, getDate());
			pstmt.setInt(8, 1);
			pstmt.executeUpdate();
			return 1;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<Board> getList(int pageNumber) {
		String sql = "select * from board where num < ? AND available = 1 order by num desc limit 10";
		ArrayList<Board> list = new ArrayList<Board>();
		System.out.println("����");
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			System.out.println("����4");
			pstmt.setInt(1, getNext() - (pageNumber - 1 ) * 10);
			System.out.println("����5");
			rs = pstmt.executeQuery();
			System.out.println("����3");
			while(rs.next()) {
				System.out.println("����2");
				Board board = new Board();
				board.setNum(rs.getInt(1));
				board.setCategory(rs.getString(2));
				board.setTitle(rs.getString(3));
				board.setuNick(rs.getString(4));
				board.setNickname(rs.getString(5));
				board.setContent(rs.getString(6));
				board.setDate(rs.getString(7));
				board.setAvailable(rs.getInt(8));
				list.add(board);
				System.out.println("����1");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String sql = "select * from board where num < ? AND available = 1";
		System.out.println("����");
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
		
	}
	public int pageList() {
		String sql = "select count(num) from board where available = ?";
		try {
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, 1);
		rs = pstmt.executeQuery();
		System.out.println("�丮3");
		if(rs.next()) {
			System.out.println("�丮4");
			if(rs.getInt(1)/10==0) {
				System.out.println("0�̶�����");
			return 1;
			}else if(rs.getInt(1)%10==0) { // ����Ʈ�� ������ �������� 0�ΰ�� �� ����Ʈ�� 10����
				System.out.println("10����");
				return rs.getInt(1)/10; // ����Ʈ�� 10�϶� 1������, 20�϶� 2������.
			}else if (rs.getInt(1)%10 != 0) { //10���� �������� 0 �� �ƴϸ� �� 10������ �ƴ�.
				return (rs.getInt(1)/10) + 1; // ����Ʈ�� 25�ϰ�� 2+1 �� 3������ 35�ϰ�� 3+5 4������.
			}
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
}
