package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.Member;
import member.MemberDao;

public class LoginAction implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		String mid = request.getParameter("id");
		String mpass = request.getParameter("password");
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(mid);
		if(member == null || member.getMdel().equals("y")) result = -1;
		else {
			String dbPass = member.getMpass();
			if(dbPass.equals(mpass)) {
				HttpSession session = request.getSession();
				session.setAttribute("mid", mid);
				result = 1;
			} else result = 0;
		}
		request.setAttribute("result", result);
		return "login";
	}

}
