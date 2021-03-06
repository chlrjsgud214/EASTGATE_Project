package service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import notice.Notice;
import notice.NoticeDao;

public class MnoticeAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int rowPerPage = 10; // 한페이지 보여주는 row갯수
		int pagePerBlock = 10; // 한 블럭에 몇 페이지
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		// 시작번호 = (페이지번호 - 1)*페이지 당 글 수 + 1;
		int startRow = (currentPage-1)*rowPerPage + 1;
		// 끝번호 = 시작번호 + 페이당 글수 - 1;
		int endRow = startRow + rowPerPage - 1;
		
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		NoticeDao nd=NoticeDao.getInstance();
		SqlSession session=NoticeDao.getSession();
		List<Notice> list=nd.select(session, map);
		
		int total = nd.total();
		int tot = total - startRow + 1;
		// 233 /10 => 23은 한페이지 안보임, 24
		int totalPage = (int)Math.ceil((double)total / rowPerPage);
		int startPage = currentPage - (currentPage - 1) % 10;
		int endPage = startPage + pagePerBlock - 1;
		if (endPage > totalPage) endPage = totalPage;
		request.setAttribute("pagePerBlock", pagePerBlock);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("list", list);
		request.setAttribute("tot", tot);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		return "mnotice";
	}

}
