package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberDao;

public class DeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("mid");
		MemberDao md = MemberDao.getInstance();
		int result = md.delete(mid);
		if(result > 0) session.invalidate();
		request.setAttribute("result", result);		
		return "delete";
	}

}
