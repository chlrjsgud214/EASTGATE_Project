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
public class ProductUploadAction implements CommandProcess  {
	
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int result = 0; 
		HttpSession session = request.getSession();
		String pid = StringUtils.nvl((String) session.getAttribute("id"));		
		
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
		String pimage =StringUtils.nvl(mr.getFilesystemName("pimage"));
		String pcon = StringUtils.nvl(mr.getParameter("pcon"));
		String explain = StringUtils.nvl(mr.getParameter("explain"));	 
		ProductDao pd = ProductDao.getInstance();
			Product product= new Product();
			product.setPcode(pcode);						//1
			product.setPid(pid);
			product.setPname(pname);
			product.setPrice(Integer.parseInt(price));
			product.setPcount(Integer.parseInt(pcount));
			product.setPimage(pimage);
			product.setPcon(pcon);
			product.setPcon(explain); //8
			
			result = pd.insert(product);
			
		
		request.setAttribute("result", result);	
		return "product";
	}

	
}
