package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.Notice;
import notice.NoticeDao;

public class NoticeUpdateAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int nnum=Integer.parseInt(request.getParameter("nnum"));
		String nsubject=request.getParameter("nsubject");
		String ncontent=request.getParameter("ncontent");
		NoticeDao nd=NoticeDao.getInstance();
		Notice notice=new Notice();
		notice.setNsubject(nsubject);
		notice.setNnum(nnum);
		notice.setNcontent(ncontent);
		int result=nd.update(notice);
		request.setAttribute("result", result);
		return "noticeUpdate";
	}

}
