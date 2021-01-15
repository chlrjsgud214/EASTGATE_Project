package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.Member;
import member.MemberDao;

public class UpdateAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String addr = request.getParameter("addr");
		String email = request.getParameter("email");
		MemberDao md = MemberDao.getInstance();
		Member member = new Member();
		
		member.setId(id);
		member.setPassword(password);
		member.setName(name);
		member.setTel(tel);
		member.setAddr(addr);
		member.setEmail(email);
		int result = md.update(member);
		request.setAttribute("result", result);
		
		
		return "update";
	}

}
