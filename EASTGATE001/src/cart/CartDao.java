package cart;

import java.io.Reader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import util.StringUtils;

public class CartDao {
	private static CartDao instance = new CartDao();
	private CartDao() {}
	public static CartDao getInstance() {
		return instance;
	}
	
	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (Exception e) {
			System.out.println("초기화 에러 : "+e.getMessage());
		}
	}

	public Cart select(String id) {
		// TODO Auto-generated method stub
		return (Cart)session.selectOne("carts.select", id);
	}
	public int insert(Cart cart) {
		
		return session.insert("carts.insert", cart);
	}
	public int delete(String id) {
		// TODO Auto-generated method stub
		return session.delete("carts.delete", id);
	}
	/*
	 * public ArrayList<Cart> getCart(String id) {
	 * 
	 * return (ArrayList<Cart>) session.selectList("carts.select", id); }
	 */
	
	
	
	public List<Cart> list(String id) {
		List<Cart> list = new ArrayList<Cart>();
		
		String mid = id;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from cart where id = ? order by pcode desc";
		try {
			pstmt = conn.prepareStatement(sql);		
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			while (rs.next()) {			
				 Cart ct= new Cart();
	             ct.setPcode(StringUtils.nvl(rs.getString("pcode"))); // 제품 번호
	             ct.setId(StringUtils.nvl(rs.getString("id"))); // 구매자아이디
	             ct.setPname(StringUtils.nvl(rs.getString("pname"))); // 제품이름
	             ct.setImage(StringUtils.nvl(rs.getString("image"))); // 썸네일
	             ct.setPrice(rs.getInt("price")); // 가격	             
	             ct.setOcount(rs.getInt("ocount")); // 주문수량
	             list.add(ct);
			}
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			}catch (Exception e) {	}
		}
		return list;
	}
	
	private Connection getConnection() {
		
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)
				ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}catch (Exception e) {
			System.out.println("연결에러 getconnection : "+e.getMessage());
		}
		return conn;
	}
}
	
	


