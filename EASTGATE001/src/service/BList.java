package service;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import board.Board;
import board.BoardDao;
public class BList implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int rowPerPage = 10; // 한페이지 보여주는 row갯수
		int pagePerBlock = 10; // 한 블럭에 몇 페이지
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1)*rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		BoardDao bd = BoardDao.getInstance();
		List<Board> list = bd.list(startRow, endRow); 
		int total = bd.total();
		int tot = total - startRow + 1;
		int totalPage = (int)Math.ceil((double)total / rowPerPage);
		int startPage = currentPage - (currentPage - 1) % 10;
		int endPage = startPage + pagePerBlock - 1;
		if (endPage > totalPage) endPage = totalPage;
		request.setAttribute("rowPerPage",rowPerPage );
		request.setAttribute("pagePerBlock", pagePerBlock);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("list", list);
		request.setAttribute("tot", tot);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		return "list";
	}
	
}
