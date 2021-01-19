package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.Cart;
import cart.CartDao;
import product.*;

public class CartInsert implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		HttpSession session = request.getSession();
		String pcode = request.getParameter("pcode"); 
		String ocount = request.getParameter("amount");
		System.out.println(ocount + "개");
		
		ProductDao pd = ProductDao.getInstance();		
		Product pd_select =pd.select(pcode);
		System.out.println("됨1");
		System.out.println("이미지이름 : "+pd_select.getImage());
		
		System.out.println("이름 : "+pd_select.getPname());
//		int price = pd.selectPrice(pcode);
		
		
		
		
		String id = session.getId();
		CartDao cd = CartDao.getInstance();	
		Cart cart = new Cart();
		System.out.println("됨2");
			cart.setPcode(pcode);
			cart.setId(id);
			cart.setPname(pd_select.getPname());
//			cart.setPrice(price);
			cart.setOcount(Integer.parseInt(ocount));
			result = cd.insert(cart);
	
		request.setAttribute("result", result);
		return "cartList";
	}

}
