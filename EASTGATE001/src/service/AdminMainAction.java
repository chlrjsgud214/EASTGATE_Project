package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.Admin;
import admin.AdminDao;

public class AdminMainAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id=(String)session.getAttribute("id");
		AdminDao ad=AdminDao.getInstance();
		if (id != null) {
			Admin admin = ad.adminChk(id);
			request.setAttribute("admin", admin);
		}
		return "Amain";
	}

}
