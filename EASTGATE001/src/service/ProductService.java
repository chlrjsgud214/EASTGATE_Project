package service;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import product.ProductDao;
import product.Product;
import member.MemberDao;
public class ProductService { // 수정 필요
	public int insert(HttpServletRequest request) throws IOException {
		int result = 0;
		int max = 1024 * 1024 * 100; // 10MB
		// 이클립스 실제로 데이터 저장될 위치
		String real = request.getSession()
				.getServletContext().getRealPath("/upload");
		MultipartRequest mr = new MultipartRequest(request,
			real, max,"utf-8",new DefaultFileRenamePolicy());
		String Pimage = mr.getFilesystemName("pimage");
		String Pname = mr.getParameter("pname");
		File file = new File(real+"/"+Pimage);
		// int fileSize = (int)file.length();
		// DB에 연동하기위해 dto값 세팅 
		Product pd = new Product();
		pd.setPimage(pimage);
		pd.setPname(pname);
		pd.setPcon(pcon);
		ProductDao pdt = ProductDao.getInstance();
		String mid;
		result = pdt.insert(pd,mid);
		return result;		
	}

	public List<PdsItem> list() {
		PdsItemDao pid = PdsItemDao.getInstance();
		List<PdsItem> list = pid.list();
		return list;
	}
}