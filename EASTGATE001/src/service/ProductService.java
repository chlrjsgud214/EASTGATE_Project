package service;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import product.ProductDao;
import product.Product;
public class ProductService { // 수정 필요
	public int insert(HttpServletRequest request) throws IOException {
		int result = 0;
		int max = 1024 * 1024 * 100; // 10MB
		
		// 이클립스 실제로 데이터 저장될 위치
		String real = request.getSession()
				.getServletContext().getRealPath("/productimage");
		MultipartRequest mr = new MultipartRequest(request,
			real, max,"utf-8",new DefaultFileRenamePolicy());
		String Pimage = mr.getFilesystemName("pimage");
		// File file = new File(real+"/"+Pimage);
		// int fileSize = (int)file.length();
		// DB에 연동하기위해 dto값 세팅 
		Product pd = new Product();
		pd.setPimage(Pimage);
		ProductDao pdt = ProductDao.getInstance();
		
		try {
			result = pdt.insert(pd);
		} catch (Exception e) {
			
		}
		return result;		
	}

	public List<Product> list() {
		ProductDao pd = ProductDao.getInstance();
		List<Product> list = pd.list();
		return list;
	}
}