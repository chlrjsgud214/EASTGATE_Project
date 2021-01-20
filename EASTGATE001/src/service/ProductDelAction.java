package service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.*;

public class ProductDelAction implements CommandProcess{
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int result=0;
		System.out.println("Delete Action1");
		String pcode = request.getParameter("pcode");	
		ProductDao pdd=ProductDao.getInstance();
		System.out.println("Delete Action3");
		
		result = pdd.delete(pcode);
		System.out.println("Delete Action4");
		request.setAttribute("result", result);	
		return "productDelete";
}
}
