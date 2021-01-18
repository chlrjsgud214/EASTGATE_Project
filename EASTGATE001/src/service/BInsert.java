package service;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.Board;
import board.BoardDao;
public class BInsert implements CommandProcess{
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {	}
		Board board = new Board();
		int num = Integer.parseInt(request.getParameter("num"));
		String id = request.getParameter("id");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		int ref = Integer.parseInt(request.getParameter("ref"));
		int re_step = Integer.parseInt(request.getParameter("re_step"));
		int re_level = Integer.parseInt(request.getParameter("re_level"));
		board.setNum(num);
		board.setId(id);
		board.setSubject(subject);
		board.setContent(content);
		board.setRef(ref);
		board.setRe_step(re_step);
		board.setRe_level(re_level);
		String pageNum = request.getParameter("pageNum");
		BoardDao bd = BoardDao.getInstance();
		int result = bd.insert(board);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		return "binsert";
	}

}
