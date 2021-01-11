package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.Member;
import member.MemberDao;

public class UpdateAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		String mpass = request.getParameter("password");
		String mname = request.getParameter("name");
		String tel = request.getParameter("tel");
		String addr = request.getParameter("addr");
		MemberDao md = MemberDao.getInstance();
		Member member = new Member();
		
		member.setMid(mid);
		member.setMpass(mpass);
		member.setMname(mname);
		member.setTel(tel);
		member.setAddr(addr);
		int result = md.update(member);
		request.setAttribute("result", result);
		
		
		return "update";
	}

}
