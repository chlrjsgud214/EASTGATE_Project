package notice;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class NoticeDao {
	// 싱글톤
	private static NoticeDao instance=new NoticeDao();
	public static NoticeDao getInstance() {
		return instance;
	}
	private NoticeDao() {}
	
	// mybatis
	static SqlSessionFactory sqlSessionFactory;
	static {
		String resource="configuration.xml";
		InputStream inputStream=null;
		try {
			inputStream=Resources.getResourceAsStream(resource);
		} catch (Exception e) {
			e.printStackTrace();
		}
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}
	public static SqlSession getSession() {
		return sqlSessionFactory.openSession();
	}

	
	// dao
	public List<Notice> select(SqlSession session, Map<String, Integer> map) {
		return (List<Notice>) session.selectList("noticens.select", map);
	}
	public Notice detail(int nnum) {
		SqlSession session=NoticeDao.getSession();
		Notice result=null;
		result=(Notice) session.selectOne("noticens.detail", nnum);
		session.close();
		return result;
	}
	public int insert(Notice notice) {
		int result=0;
		SqlSession session=NoticeDao.getSession();
		result=session.insert("noticens.insert", notice);
		System.out.println("----------------"+result+"-------------");
		session.commit();
		return result;
	}
	public void readCount(int nnum) {
		SqlSession session=NoticeDao.getSession();
		session.update("noticens.readCount", nnum);
		session.commit();
		System.out.println("-----------"+session+"------=-=--=-");
	}
	public int update(Notice notice) {
		int result=0;
		SqlSession session=NoticeDao.getSession();
		result=session.update("noticens.update", notice);
		session.commit();
		return result;
	}
	public int delete(int nnum) {
		SqlSession session=NoticeDao.getSession();
		int result=0;
		result=session.delete("noticens.delete", nnum);
		session.commit();
		return result;
	}
	public int total() {
		SqlSession session=NoticeDao.getSession();
		int result=0;
		result=(int) session.selectOne("noticens.total");
		return result;
	}
}
