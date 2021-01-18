package service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import board.Board;
import board.BoardDao;
public class BUpdateForm implements CommandProcess{
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		BoardDao bd = BoardDao.getInstance();
		Board board = bd.select(num);
		String content1 = board.getContent();
		String content =  content1.replace("<br>", "\r\n");
	
		request.setAttribute("board", board);
		request.setAttribute("content", content);
		request.setAttribute("pageNum",pageNum);
		return "bupdateForm";
	}

}
