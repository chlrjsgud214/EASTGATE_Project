package service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import product.*;
public class productShowAction implements CommandProcess{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		ProductDao pd = ProductDao.getInstance();
		Product product = pd.select(pcode);
		request.setAttribute("product", product);
		return "productShowForm";
	}
}
