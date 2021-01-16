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
		String id = request.getParameter("id"); 
	    String pname = request.getParameter("pname"); 
	    String image = request.getParameter("image");
		int price = Integer.parseInt(request.getParameter("price"));
		int ocount = Integer.parseInt(request.getParameter("ocount"));
		CartDao cd = CartDao.getInstance();
		
		Cart cart = new Cart();
		
			cart.setPcode(pcode);
			cart.setId(id);
			cart.setPname(pname);
			cart.setImage(image);
			cart.setPrice(price);
			cart.setOcount(ocount);
			result = cd.insert(cart);
	
		request.setAttribute("result", result);
		return "cartList";
	}

}
