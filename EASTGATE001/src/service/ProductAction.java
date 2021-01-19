package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import util.StringUtils;
import java.io.*;
import product.Product;
import product.ProductDao;
public class ProductAction implements CommandProcess  {
	@Override
	
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		int result = 0; 
		HttpSession session = request.getSession();
		String pid = StringUtils.nvl((String) session.getAttribute("id"));		
		System.out.println("productAction");
		int max = 1024*1024*100;
		String real = request.getSession().getServletContext().getRealPath("/productimage");
		MultipartRequest mr = new MultipartRequest(request,
				real, max,"utf-8",new DefaultFileRenamePolicy());	
//		String id = StringUtils.nvl(request.getParameter("id"));
//		String password = StringUtils.nvl(request.getParameter("password"));
		
		String pcode = StringUtils.nvl(mr.getParameter("pcode"));    
		String pname = StringUtils.nvl(mr.getParameter("pname"));
		String price = StringUtils.nvl(mr.getParameter("price")); 
		String pcount = StringUtils.nvl(mr.getParameter("pcount"));  
		String image =StringUtils.nvl(mr.getFilesystemName("image"));
		String explain = StringUtils.nvl(mr.getParameter("explain"));	 
//		
//		System.out.println("pcode"+pcode);
//		System.out.println("pid"+pid);
//		System.out.println("pname"+pname);
//		System.out.println("price"+price);
//		System.out.println("pcount"+pcount);
//		System.out.println("pimage"+pimage);
//		System.out.println("explain"+explain);
//		
		ProductDao pd = ProductDao.getInstance();
		Product product= new Product();
		product.setPcode(pcode);						//1
		product.setPid(pid);
		product.setPname(pname);
		product.setPrice(Integer.parseInt(price));
		product.setPcount(Integer.parseInt(pcount));
		product.setImage(image);
		product.setExplain(explain);
			
		result = pd.insert(product);
			
		
		request.setAttribute("result", result);	
		return "product";
	}

	
}
