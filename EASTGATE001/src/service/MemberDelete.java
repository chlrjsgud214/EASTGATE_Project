package service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDao;

public class MemberDelete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws IOException {
		MemberDao md=MemberDao.getInstance();
		String id=request.getParameter("id");
		int result=md.delete(id);
		request.setAttribute("result", result);
		return "memberDelete";
	}

}
