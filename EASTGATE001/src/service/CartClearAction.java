package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cart.Cart;
import cart.CartDao;

public class CartClearAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		String id = request.getParameter("id");
		CartDao cd = CartDao.getInstance();
		Cart cart = cd.select(id);
		if(cart != null) {
			cart = new Cart();
			result = cd.delete(id);
		} else result = -1;
		
		request.setAttribute("result", result);
		return "cartClear";
	}

}
