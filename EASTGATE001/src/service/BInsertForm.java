package service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import board.Board;
import board.BoardDao;
public class BInsertForm implements CommandProcess{
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int num=0,ref=0,re_level=0,re_step=0;
		num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		if(num != 0) {
			BoardDao bd = BoardDao.getInstance();
			Board board = bd.select(num);
			ref = board.getRef();
			re_step = board.getRe_step();
			re_level = board.getRe_level();
		}
		System.out.println("num = "+num);
		System.out.println("ref = "+ref);
		request.setAttribute("num", num);
		request.setAttribute("ref", ref);
		request.setAttribute("re_level", re_level);
		request.setAttribute("re_step", re_step);
		request.setAttribute("pageNum", pageNum);
		return "binsertForm";
	}

}
