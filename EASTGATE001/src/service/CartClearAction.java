package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.Cart;
import cart.CartDao;

public class CartClearAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		CartDao cd = CartDao.getInstance();
		List<Cart> list = cd.list(id);	
		if(list != null) {		
			result = cd.delete(id);
			request.setAttribute("result", result);
			return "cartClear";
		} else {
				result = -1;	
				request.setAttribute("result", result);
				return "cartClear";
		}
	}

}
