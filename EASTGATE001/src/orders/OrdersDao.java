package orders;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class OrdersDao {
	private static OrdersDao instance = new OrdersDao();
	private OrdersDao() {}
	public static OrdersDao getInstance() {
		return instance;
	}
	
	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (Exception e) {
			System.out.println("초기화 에러 : " +e.getMessage());
		}
	}
	public Orders select(String ocode) {
		
		return (Orders)session.selectOne("orderns.select", ocode);
	}
	public int insert(Orders orders) {
		return session.insert("orderns.insert", orders);
	}
}
