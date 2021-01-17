package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import product.Product;


public class ProductListAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		ProductService pis=new ProductService();
		List<Product> list=pis.list();
		
		request.setAttribute("list", list);
		return "productList";
	}

}
