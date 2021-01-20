package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.Cart;
import cart.CartDao;


public class OrdersForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		System.out.println(id);
		CartDao cd = CartDao.getInstance();
		List<Cart> list = cd.list(id);
		
		request.setAttribute("id", id);
		request.setAttribute("list", list);
		request.setAttribute("result", result);		
		return "ordersForm";
	}

}
