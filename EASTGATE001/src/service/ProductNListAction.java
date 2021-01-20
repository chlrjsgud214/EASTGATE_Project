package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.*;

public class ProductNListAction implements CommandProcess {
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("product N List Action");
		String pname = request.getParameter("search_txt");
		
		ProductDao pis=ProductDao.getInstance();				
		System.out.println("name : "+pname);
		List<Product> list=pis.name_list(pname);
		
		request.setAttribute("list", list);
		return "productList";
		
	}
}
