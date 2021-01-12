<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="product.*" %>
<%@ page import="java.sql.Timestamp,com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.util.*,java.io.*"%> 
<% 	request.setCharacterEncoding("utf-8"); %>
<%
	String realFolder = "";//웹 어플리케이션상의 절대 경로
	String filename ="";
	MultipartRequest imageUp = null;
	String saveFolder = "/pimage";//파일이 업로드되는 폴더를 지정한다.
	String encType = "utf-8"; //엔코딩타입
	int maxSize = 100*1024*1024;  //최대 업로될 파일크기 5Mb
	realFolder = application.getRealPath(saveFolder);  

	imageUp = new MultipartRequest(request,realFolder,
		   maxSize,encType,new DefaultFileRenamePolicy());   
    filename = imageUp.getFilesystemName("pimage");

	Product product = new Product();
	String pcode = imageUp.getParameter("pcode");
 	String pname = imageUp.getParameter("panme");
 	String price = imageUp.getParameter("price");
 	String pcount = imageUp.getParameter("pcount");
	String pcon = imageUp.getParameter("pcon");
 	String publishing_com = imageUp.getParameter("publishing_com");
 
	product.setPcode(pcode);
	product.setPname(pname);
	product.setPrice(Integer.parseInt(price));
	product.setPcount(Integer.parseInt(pcount));
	product.setPimage(filename);
	product.setPcon(pcon);
	
	
	String mid="admin";
	ProductDao productProcess = ProductDao.getInstance();
	int result = productProcess.insert(product);
	
	if (result > 0) {	
		response.sendRedirect("productList.jsp?pcode="+pcode);
	} else {
%>
		 <script type="text/javascript">
			alert("데이터 입력중에 에러가 발생했습니다. 메세지 확인하세요");
			history.go(-1);
			//	location.href = 'bookRegisterForm.jsp';
		</script>
<%  }  %>