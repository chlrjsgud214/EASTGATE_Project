package admin;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class AdminDao {
	// 싱글톤
	private static AdminDao instance=new AdminDao();
	public static AdminDao getInstance() {
		return instance;
	}
	private AdminDao() {}
	
	// mybatis
	private static SqlSession session;
	static {
		try {
			Reader reader=Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(reader);
			session=ssf.openSession(true);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	public Admin adminChk(String id) {
		return (Admin) session.selectOne("adminrns.adminChk", id);
	}
}
