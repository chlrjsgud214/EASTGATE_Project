package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.Cart;
import cart.CartDao;
import product.Product;
import product.ProductDao;

public class CartInsert implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		HttpSession session = request.getSession();
		String pcode = request.getParameter("pcode"); 
		ProductDao pd = ProductDao.getInstance();		
		
		int price = pd.selectPrice(pcode);
		String ocount = request.getParameter("amount");
		System.out.println(ocount);
		String id = session.getId();
		Product product = pd.select(pcode);
		System.out.println(product.getPimage());
		CartDao cd = CartDao.getInstance();	
		Cart cart = new Cart();
		
			cart.setPcode(pcode);
			cart.setId(id);
			cart.setPname(product.getPname());
			cart.setPrice(price);
			cart.setOcount(Integer.parseInt(ocount));
			result = cd.insert(cart);
	
		request.setAttribute("result", result);
		return "cartList";
	}

}
