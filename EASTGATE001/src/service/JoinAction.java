package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.Member;
import member.MemberDao;

public class JoinAction implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		String id = request.getParameter("id");    
		String password = request.getParameter("password");
		String name = request.getParameter("name"); 
		String tel = request.getParameter("tel");  
		String addr = request.getParameter("addr"); 
		String email = request.getParameter("email");
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(id);
		if(member == null) {
			member = new Member();
			member.setId(id);
			member.setPassword(password);
			member.setName(name);
			member.setTel(tel);
			member.setAddr(addr);
			member.setEmail(email);
			result = md.insert(member);
		} else result = -1;
		request.setAttribute("result", result);	
		return "join";
	}

}
