package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cart.Cart;
import cart.CartDao;

public class CartInsert implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		String pcode = request.getParameter("pcode");  
		String ccode = request.getParameter("ccode");
		String mcode = request.getParameter("mcode");
		int ocount = Integer.parseInt(request.getParameter("ocount"));
		String pname = request.getParameter("pname");
		int price = Integer.parseInt(request.getParameter("price"));
		CartDao cd = CartDao.getInstance();
		Cart cart = cd.select(pcode);
		
		if(cart == null) {
			cart = new Cart();
			cart.setPcode(pcode);
			cart.setCcode(ccode);
			cart.setMcode(mcode);
			cart.setOcount(ocount);
			request.setAttribute("pname", pname);
			request.setAttribute("price", price);
		} else result = -1;
		request.setAttribute("result", result);
		return "cartList";
	}

}
