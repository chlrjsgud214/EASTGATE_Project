package service;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import notice.Notice;
import notice.NoticeDao;

public class McontentAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		//String pageNum=request.getParameter("pageNum");
		int nnum = Integer.parseInt(request.getParameter("nnum"));
		NoticeDao nd = NoticeDao.getInstance();
		SqlSession session=NoticeDao.getSession();
		nd.readCount(nnum);
		Notice notice = nd.detail(nnum);
		
		//request.setAttribute("pageNum", pageNum);
		request.setAttribute("notice", notice);
		return "mcontent";
	}

}
