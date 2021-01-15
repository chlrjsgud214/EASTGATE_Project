package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import orders.Orders;
import orders.OrdersDao;

public class OrdersAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		String pcode = request.getParameter("pcode"); 
		String mcode = request.getParameter("mcode"); 
		int ocount = Integer.parseInt(request.getParameter("ocount"));		
		int oprice = Integer.parseInt(request.getParameter("oprice"));
		
		
		
		try {
			OrdersDao od = OrdersDao.getInstance();
			Orders orders = new Orders();
			orders.setPcode(pcode);
			orders.setMcode(mcode);
			orders.setOcount(ocount);
			orders.setOprice(oprice);
			od.insert(orders);
		} catch (Exception e) {
			System.out.println("주문입력이 잘 못 되었습니다 : " +e.getMessage());
		}
			

		return "orders";
	}

}
