package service;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.Board;
import board.BoardDao;
public class BUpdate implements CommandProcess{
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {	}
		Board board = new Board();
		int num = Integer.parseInt(request.getParameter("num"));
		String id = request.getParameter("id");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		board.setNum(num);
		board.setId(id);
		board.setSubject(subject);
		board.setContent(content);
		String pageNum=request.getParameter("pageNum");
		BoardDao bd = BoardDao.getInstance();
		int result = bd.update(board);
		
		request.setAttribute("board", board);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		return "bupdate";
	}

}
