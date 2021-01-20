package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.*;

public class ProductCListAction implements CommandProcess {
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("들어옴");
		ProductDao pis=ProductDao.getInstance();
		String pcode = request.getParameter("pcode");
		int sub = Integer.parseInt(request.getParameter("sub"));
		if(sub==0)sub=1;
		String code = pcode.substring(0,sub);
		System.out.println("code : "+code);
		List<Product> list=pis.code_list(code);
		
		request.setAttribute("list", list);
		return "productList";
		
	}
}
