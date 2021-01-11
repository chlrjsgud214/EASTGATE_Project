package service;

import java.util.Enumeration;


import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import admin.Admin;
import admin.AdminDao;
import member.Member;
import member.MemberDao;

public class LoginAction implements CommandProcess {
	   public String requestPro(HttpServletRequest request, HttpServletResponse response) {
	      int result=0;
	      String id=request.getParameter("id");
	      String password=request.getParameter("password");
	      
	      AdminDao ad=AdminDao.getInstance();
	      Admin admin=ad.adminChk(id);
	      
	      MemberDao md=MemberDao.getInstance();
	      Member member=md.select(id);
	      
	      if(id.equals("master")) {
	    	  String dbpass=admin.getPass();
	    		  if (dbpass.equals(password)) {
	          HttpSession session=request.getSession();
	          session.setAttribute("id", id);
	          result=1;
	    	 }
	       }
	       else if(!id.equals("master")){
	    	  String dbpass=member.getMpass();
	    	  if (dbpass.equals(password)) {
	          HttpSession session=request.getSession();
	          session.setAttribute("id", id);
	          result=0;
	    	  }
	       }
	       else{
	          result=-1;
	       }
	      request.setAttribute("result", result);
	      return "login";
	   }
	}
