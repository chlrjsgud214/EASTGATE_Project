package service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDao;
public class BDelete implements CommandProcess{
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		BoardDao bd = BoardDao.getInstance();
		int result = bd.delete(num);
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		return "bdelete";
	}

}
