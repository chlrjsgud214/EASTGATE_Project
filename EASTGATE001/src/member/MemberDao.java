package member;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MemberDao {
	// singleton : 한번 생성한 객체를 같이 사용
		private static MemberDao instance = new MemberDao();
		// 다른 클래스에서 memberDao생성자를 사용할 수 없게 만듬
		private MemberDao() {} 
		public static MemberDao getInstance() {
			return instance;
		}

	
	private static SqlSession session;
	static { // 클래스 변수 초기화 블럭
		try { // myBatis를 이용하여 DB를 연동
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
		} catch (IOException e) {
			System.out.println("초기화 에러 : " +e.getMessage());
		}
	}

	public Member select(String id) {
		
		return (Member)session.selectOne("members.select", id);
	}
	public int insert(Member member) {
		
		return session.insert("members.insert", member);
	}
	public int update(Member member) {
		
		return session.update("members.update", member);
	}
	public int delete(String id) {
		
		return session.update("members.delete", id);
	}
	
	
	public List<Member> mselect(Map<String, Integer> map) {
		return session.selectList("members.mselect", map);
	}
	public int total() {
		return (int) session.selectOne("members.total");
	}

}
