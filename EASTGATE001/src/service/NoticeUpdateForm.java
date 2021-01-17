package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import notice.Notice;
import notice.NoticeDao;

public class NoticeUpdateForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int nnum =Integer.parseInt(request.getParameter("nnum"));
		NoticeDao nd = NoticeDao.getInstance();
		Notice notice = nd.detail(nnum);
		String content=notice.getNcontent();
		String ncontent =content.replace("<br>", "\r\n");
		
		//request.setAttribute("pageNum", pageNum);
		request.setAttribute("notice", notice);
		request.setAttribute("ncontent", ncontent);
		return "noticeUpdateForm";
	}

}
