package cart;

import java.io.Reader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import member.Member;

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
	public ArrayList<Cart> getCart(String id) {
		
		return (ArrayList<Cart>) session.selectList("carts.select", id);
	}
	
	

}
