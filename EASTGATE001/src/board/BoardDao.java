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
	public int insert(Board board) {
		int result = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sqlNum = "select nvl(max(num),0)+1 from board";
		String sqlUp = "update board set re_step=re_step+1 "
				+ "where ref=? and re_step >?";
		String sql = "insert into board "
				+ "values(?,?,?,?,sysdate,?,?,?,0)";
		try {
			pstmt = conn.prepareStatement(sqlNum);
			rs = pstmt.executeQuery();
			rs.next();
			int number = rs.getInt(1);
			rs.close(); pstmt.close();
			if (board.getNum() > 0) {
				pstmt = conn.prepareStatement(sqlUp);
				pstmt.setInt(1, board.getRef());
				pstmt.setInt(2, board.getRe_step());
				pstmt.executeUpdate();
				board.setRe_level(board.getRe_level()+1);
				board.setRe_step(board.getRe_step()+1);
				pstmt.close();
			} else board.setRef(number);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getId());
			pstmt.setInt(2, number);
			pstmt.setString(3, board.getSubject());
			pstmt.setString(4, board.getContent());
			pstmt.setInt(5, board.getRef());
			pstmt.setInt(6, board.getRe_step());
			pstmt.setInt(7, board.getRe_level());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {}
		}
		return result;
	}
	public int update(Board board) {
		int result = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		String sql = "update board set subject=?, content=? where num=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getSubject());
			pstmt.setString(2, board.getContent());
			pstmt.setInt(3, board.getNum());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {	}
		}
		return result;
	}
	public void updateReadCount(int num) {
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		String sql = "update board set readcount=readcount+1 where num=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {	}
		}
		
	}
	public int delete(int num) {
		int result = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		String sql="delete from board where num=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {	}
		}
		return result;
	}
	
}
