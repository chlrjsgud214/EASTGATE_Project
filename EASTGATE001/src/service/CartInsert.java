package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.Cart;
import cart.CartDao;
import product.ProductDao;

public class CartInsert implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		HttpSession session = request.getSession();
		String pcode = request.getParameter("pcode"); 
		ProductDao pd = ProductDao.getInstance();
		
		String pname = pd.selectPname(pcode);
		
		String image = pd.selectPimage(pcode);
		int price = pd.selectPrice(pcode);
		int ocount = Integer.parseInt(request.getParameter("ocount"));
		String id = session.getId();
		
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
