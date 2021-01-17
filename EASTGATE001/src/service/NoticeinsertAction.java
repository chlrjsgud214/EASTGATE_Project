package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.session.SqlSession;

import notice.Notice;
import notice.NoticeDao;

public class NoticeinsertAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		NoticeDao nd = NoticeDao.getInstance();
		Notice notice=new Notice();
		//int nnum=Integer.parseInt(request.getParameter("nnum"));
		String nsubject=request.getParameter("nsubject");
		String ncontent=request.getParameter("ncontent");
		//notice.setNnum(nnum);
		notice.setNcontent(ncontent);
		notice.setNsubject(nsubject);
		//bd.updateReadCount(num);
		int result=nd.insert(notice);
		
		//request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		return "noticeinsert";
	}
}
