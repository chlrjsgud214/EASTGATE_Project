package service;

import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import admin.Admin;
import admin.AdminDao;

public class AdminloginAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int result=0;
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		AdminDao ad=AdminDao.getInstance();
		Admin admin=ad.adminChk(id);
		if (admin==null || admin.getAdel().equals('y')) {
			result=1;
		} else {
			String dbpass=admin.getPass();
			if (dbpass.equals(password)) {
				HttpSession session=request.getSession();
				session.setAttribute("id", id);
				session.setAttribute("password", password);
				result=1;
			} else result=0;
		}
		request.setAttribute("result", result);
		return "adminlogin";
	}

}
