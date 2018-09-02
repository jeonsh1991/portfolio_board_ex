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
				return rs.getString(1); // 데이트값이 있을때 데이트값 리턴
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //없을때 공란
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
		}finally {
		try {
			rs.close();
		}catch(Throwable e) {
			e.printStackTrace();
		}
		}
		return -1;
	}
	public int Write(String Category, String Title, String uNick, String Content, String Date) {
		String sql = "insert into board values(?,?,?,?,?,?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, Category);
			pstmt.setString(3, Title);
			pstmt.setString(4, uNick);
			pstmt.setString(5, Content);
			pstmt.setString(6, getDate());
			pstmt.setInt(7, 1);
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public ArrayList<Board> getList(int pageNumber) {
		String sql = "select * from board where num < ? AND available = 1 order by num desc limit 10";
		ArrayList<Board> list = new ArrayList<Board>();
		System.out.println("여기");
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			System.out.println("여기4");
			pstmt.setInt(1, getNext() - (pageNumber - 1 ) * 10);
			System.out.println("여기5");
			rs = pstmt.executeQuery();
			System.out.println("여기3");
			while(rs.next()) {
				System.out.println("여기2");
				Board board = new Board();
				board.setNum(rs.getInt(1));
				board.setCategory(rs.getString(2));
				board.setTitle(rs.getString(3));
				board.setuNick(rs.getString(4));
				board.setContent(rs.getString(5));
				board.setDate(rs.getString(6));
				board.setAvailable(rs.getInt(7));
				list.add(board);
				System.out.println("여기1");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
			}catch(Throwable e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String sql = "select * from board where num < ? AND bbsAvailable = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
			}catch(Throwable e) {
				e.printStackTrace();
			}
		}
		return false;
		
	}
}
