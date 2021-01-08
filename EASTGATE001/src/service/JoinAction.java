package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.Member;
import member.MemberDao;

public class JoinAction implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		String scode = request.getParameter("scode");
		String mid = request.getParameter("mid");    
		String mpass = request.getParameter("password");
		String mname = request.getParameter("name"); 
		String resinum = request.getParameter("resinumFront"+"-"+"resinumBack"); 
		String tel = request.getParameter("tel");  
		String addr = request.getParameter("addr"); 
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(mid);
		if(member == null) {
			member = new Member();
			member.setMid(mid);
			member.setMpass(mpass);
			member.setMname(mname);
			member.setResinum(resinum);
			member.setTel(tel);
			member.setAddr(addr);
			member.setScode(scode);
			result = md.insert(member);
		} else result = -1;
		request.setAttribute("result", result);	
		return "join";
	}

}
