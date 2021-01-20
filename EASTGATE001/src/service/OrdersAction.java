package service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.Cart;
import cart.CartDao;
import orders.Orders;
import orders.OrdersDao;

public class OrdersAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int result = 0;
		String id = (String) session.getAttribute("id");
		OrdersDao od = OrdersDao.getInstance();
		Orders orders = new Orders();
		CartDao cd = CartDao.getInstance();
		List<Cart> cartList = cd.list(id);  // cartList = {0,1,2}  ,  {00,11,22}
	
			for (int i = 0; i < cartList.size(); i++) {
		
				String pcode = cartList.get(0).toString();
				System.out.println(pcode);
				String pname = cartList.get(2).toString();
				String image = cartList.get(3).toString();
				int price = Integer.parseInt(cartList.get(4).toString());
				int ocount = Integer.parseInt(cartList.get(5).toString());

				orders.setPcode(pcode);
				orders.setId(id);
				orders.setPname(pname);
				orders.setImage(image);
				orders.setPrice(price);
				orders.setOcount(ocount);
				result = od.insert(orders);
				i++;
			}
		
			request.setAttribute("result", result);
		return "orders";
	}

}
