package service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import board.Board;
import board.BoardDao;
public class BContent implements CommandProcess{
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDao bd = BoardDao.getInstance();
		bd.updateReadCount(num);
		Board board = bd.select(num);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("board", board);
		return "bcontent";
	}

}
