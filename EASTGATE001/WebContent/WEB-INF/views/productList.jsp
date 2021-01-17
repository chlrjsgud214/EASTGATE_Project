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
        max-height: 80px;
        max-width: 80px;
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
	padding: 20px;background: #777;border: 1px solid #fff;
}

#err {
	color: #f56642;
	font-weight: bold;
}
</style>
</head><body>
<h2>파일 목록</h2>
<table>
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
		<td><img class="imageThumb" src="productimage/${pi.pimage }"> </td>
		<td><a href="productimage/${pi.pimage }">${pi.pcode }</a></td><td>${pi.pid }</td>
			<td><a href="productimage/${pi.pimage }">${pi.pname}</a></td><td>${pi.price}</td>
			<td>${pi.pcount}</td>
			<td>${pi.explain}</td>
			</tr>
	</c:forEach>
</c:if>
</table>
<button onclick="location.href='productForm.do'">파일 업로드</button>
</body>
</html>