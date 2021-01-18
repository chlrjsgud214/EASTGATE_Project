package service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.Member;
import member.MemberDao;

public class ContentMg implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id=request.getParameter("id");
		MemberDao md=MemberDao.getInstance();
		Member member=md.select(id);
		request.setAttribute("member", member);
		return "contentMg";
	}

}
