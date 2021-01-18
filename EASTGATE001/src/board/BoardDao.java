package board;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.naming.*;
import javax.sql.*;
public class BoardDao {
	// 싱글톤
	private static BoardDao instance=new BoardDao();
	private BoardDao() {}
	public static BoardDao getInstance() {
		return instance;
	}
	// 데이타베이스 Connection pool
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println("연결에러 : "+e.getMessage());
		}
		return conn;
	}
	public List<Board> list(int startRow, int endRow){
		List<Board> list = new ArrayList<Board>();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from (select rowNum rn, a.* from ("
				+ "select * from board order by ref desc,re_step)a) "
				+ " where rn between ? and ?";
		try {
			while(rs.next()) {
				Board board = new Board();
				board.setId(rs.getString("id"));
				board.setNum(rs.getInt("num"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setBdate(rs.getDate("bdate"));
				board.setRef(rs.getInt("ref"));
			    board.setRe_step(rs.getInt("re_step"));
			    board.setRe_level(rs.getInt("re_level"));
			    board.setReadcount(rs.getInt("readcount"));
			    board.setDel(rs.getString("del"));
			    list.add(board);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {}
		}
		return list;
		
	}
	public int total() {
		int result = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from board";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}finally { // 성공/실패와 관계없이 무조건 실행
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			}catch (Exception e) {}
		}
		return result;		
	}
	public Board select(int num) {
		Board board = new Board();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from board where num=? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				board.setId(rs.getString("id"));
				board.setNum(rs.getInt("num"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setBdate(rs.getDate("bdate"));
				board.setRef(rs.getInt("ref"));
			    board.setRe_step(rs.getInt("re_step"));
			    board.setRe_level(rs.getInt("re_level"));
			    board.setReadcount(rs.getInt("readcount"));
			    board.setDel(rs.getString("del"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {	}
		}
		return board;
	}
	
}
