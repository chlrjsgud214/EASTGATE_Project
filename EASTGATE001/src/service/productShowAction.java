package service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.*;
public class productShowAction implements CommandProcess{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String pcode = request.getParameter("pcode");
		System.out.println("get Pcode : "+pcode);
		ProductDao pd = ProductDao.getInstance();
		Product product = pd.select(pcode);
		System.out.println("get Pcode : "+product.getPimage());
		System.out.println("get Pcode : "+pcode);
		request.setAttribute("product", product);
		return "productShowForm";
	}
}
