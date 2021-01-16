package service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cart.Cart;
import cart.CartDao;


public class OrdersForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		ArrayList<Cart> cartLists = null;
		Cart cartList = null;
		
		CartDao cartProcess = CartDao.getInstance();
		cartLists = cartProcess.getCart(id);
		
		for (int i=0; i<cartLists.size(); i++) {
			cartList = (Cart)cartLists.get(i);
			request.setAttribute("cartList", cartList);
		}
		request.setAttribute("id", id);
		
		
		return "ordersForm";
	}

}
