package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.Member;
import member.MemberDao;

public class UpdateForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("mid");
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(mid);
		request.setAttribute("member", member);
		return "updateForm";
	}

}
