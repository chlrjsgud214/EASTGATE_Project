package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
			
				String pcode = (String) session.getAttribute("pcode");
				System.out.println(pcode);
				String pname = (String) session.getAttribute("pname");
				String image = (String) session.getAttribute("image");
				int price = Integer.parseInt((String) session.getAttribute("price"));
				int ocount = Integer.parseInt((String) session.getAttribute("ocount"));

				orders.setPcode(pcode);
				orders.setId(id);
				orders.setPname(pname);
				orders.setImage(image);
				orders.setPrice(price);
				orders.setOcount(ocount);
				result = od.insert(orders);

		
			request.setAttribute("result", result);
		return "orders";
	}

}
