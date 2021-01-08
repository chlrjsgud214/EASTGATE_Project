package service;
import java.io.File;
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
		int max = 1024 * 1024 * 10; // 10MB
		// 이클립스 실제로 데이터 저장될 위치
		String real = request.getSession()
				.getServletContext().getRealPath("/upload");
		MultipartRequest mr = new MultipartRequest(request,
			real, max,"utf-8",new DefaultFileRenamePolicy());
		String fileName = mr.getFilesystemName("file");
		String description = mr.getParameter("description");
		File file = new File(real+"/"+fileName);
		int fileSize = (int)file.length();
		// DB에 연동하기위해 dto값 세팅 
		PdsItem pi = new PdsItem();
		pi.setFileName(fileName);
		pi.setFileSize(fileSize);
		pi.setDescription(description);
		PdsItemDao pid = PdsItemDao.getInstance();
		result = pid.insert(pi);
		return result;		
	}

	public List<PdsItem> list() {
		PdsItemDao pid = PdsItemDao.getInstance();
		List<PdsItem> list = pid.list();
		return list;
	}
}