package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.Cart;
import cart.CartDao;

public class CartInsert implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		HttpSession session = request.getSession();
		String pcode = request.getParameter("pcode"); 
		if(pcode == null) {
			System.out.println("됨1");
			CartDao cd = CartDao.getInstance();	
			System.out.println("됨2");
			String id = (String)session.getAttribute("id");
			System.out.println("됨3");
			List<Cart> list = cd.list(id);	
			System.out.println("됨4");
			request.setAttribute("id", id);
			System.out.println("됨5");
			request.setAttribute("list", list);
			System.out.println("됨6");
			request.setAttribute("result", result);
			System.out.println("됨7");
			
		} else {	
		String ocount = request.getParameter("amount");
		String pname = request.getParameter("pname");
		String image = request.getParameter("image");
		int price = Integer.parseInt(request.getParameter("price"));
		String id = (String)session.getAttribute("id");
		CartDao cd = CartDao.getInstance();	
		Cart cart = new Cart();
		System.out.println("됨2");
		System.out.println(pcode);
		System.out.println(ocount);
		System.out.println(id);
		System.out.println(image);
		System.out.println(price);
		
			cart.setPcode(pcode);
			cart.setId(id);
			cart.setPname(pname);
			cart.setImage(image);
			cart.setPrice(price);
			cart.setOcount(Integer.parseInt(ocount));
			result = cd.insert(cart);
		
		List<Cart> list = cd.list(id);
		request.setAttribute("id", id);
		request.setAttribute("list", list);
		request.setAttribute("result", result);

		}
		return "cartList";
	}
}
