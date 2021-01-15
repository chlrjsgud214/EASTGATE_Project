package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class OrdersForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String pcode = request.getParameter("pcode");
		String mcode = request.getParameter("mcode");
		
		
		return "ordersForm";
	}

}
