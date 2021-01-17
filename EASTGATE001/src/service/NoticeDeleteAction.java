package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.NoticeDao;

public class NoticeDeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int nnum=Integer.parseInt(request.getParameter("nnum"));
		NoticeDao nd=NoticeDao.getInstance();
		int result=nd.delete(nnum);
		request.setAttribute("result", result);
		return "noticeDelete";
	}

}
