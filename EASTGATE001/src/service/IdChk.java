package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.Member;
import member.MemberDao;

public class IdChk implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String mid = request.getParameter("mid");
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(mid);
		String msg = "";
		if(member == null) msg = "사용가능한 아이디 입니다";
		else msg = "이미 사용중인 아이디 입니다";
		request.setAttribute("msg", msg);
		return "idChk";
	}

}
