<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
h2 {
	text-align: center;
}
form {margin: 100px 0;}
table {margin: auto;
		width:800px; 
}
.imageThumb {
        max-height: 150px;
        max-width: 150px;
        border: 2px solid;
        padding: 1px;
        cursor: pointer;
      }
th {
	padding: 20px;width: 20%;
	background: #333; color: #fff;border: 1px solid #fff;
}
tr:last-child th {text-align: right;}
tr:last-child th input {background: #fff;font-size: 20px;color: #333; text-shadow: none;cursor: pointer;}
td {
	padding: 10px;background: #777;border: 1px solid #fff;
}
td.fileupload{
	padding: 5px;background: white;border: 1px solid #fff;
}
#err {
	color: #f56642;
	font-weight: bold;
}
</style>
</head><body>
<h1 align="center">
							<a href="main.do"><img alt="" src="image/logo7.png"></a>
						</h1>
<table>
<tr> <td class="fileupload" colspan="7" align="right"> <button onclick="location.href='productForm.do'">파일 업로드</button> </td> </tr> 
	<tr><th>썸네일</th><th>제품코드</th><th>판매자아이디</th>
	<th>제품제목</th><th>가격</th>
	<th>재고수량</th>
	<th>설명</th></tr>
<c:if test="${empty list }">
	<tr><th colspan="5">데이터 없습니다</th></tr>
</c:if>	
<c:if test="${not empty list }">
	<c:forEach var="pi" items="${list }">
		<tr>
		<td><a href="productimage/${pi.pimage }"><img class="imageThumb" src="productimage/${pi.pimage }" alt="이미지 없음" ></a></td>
		<td><a href="productimage/${pi.pimage }">${pi.pcode }</a></td><td>${pi.pid }</td>
			<td><a href="productimage/${pi.pimage }">${pi.pname}</a></td><td>${pi.price}</td>
			<td>${pi.pcount}</td>
			<td>${pi.explain}</td>
			</tr>
	</c:forEach>
</c:if>
<tr> <td class="fileupload" colspan="7" align="right">  <button onclick="location.href='productForm.do'">파일 업로드</button> </td> </tr> 
</table>

</body>
</html>