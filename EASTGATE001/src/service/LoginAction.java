package service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.Member;
import member.MemberDao;
import util.StringUtils;

public class LoginAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		String id = StringUtils.nvl(request.getParameter("id"));
		String password = StringUtils.nvl(request.getParameter("password"));
		Map<String, String> param = new HashMap<>();
		param.put("id", id);
		param.put("password", password);

		HttpSession session = request.getSession();
		if (id.equals("master")) {
			MemberDao md = MemberDao.getInstance();
			Member member = md.select(id);
			if (password.equals(member.getPassword())) {
				result = 1;
				session.setAttribute("member", member);
			} else {
				result = -2;
			}
		} else {
			MemberDao md = MemberDao.getInstance();
			Member member = md.select(id);
			
			if (member == null || member.getDel().equals("y")) {
				result = -1;
			} else {
				if (password.equals(member.getPassword())) {
					result = 0;
					session.setAttribute("id", member.getId());
				} else {
					result = -2;
				}
			}
		}

		request.setAttribute("result", result);
		return "login";
	}
}