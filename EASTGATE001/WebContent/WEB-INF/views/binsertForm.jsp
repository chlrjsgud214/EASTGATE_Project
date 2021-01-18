<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="binsert.do" method="post">
	<input type="hidden" name="num" value="${num}">
	<input type="hidden" name="ref" value="${ref}">
	<input type="hidden" name="re_level" value="${re_level}">
	<input type="hidden" name="re_step" value="${re_step}">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<h2>게시글 작성</h2>
<table>
<c:if test="${num == 0 }">
	<tr>
		<th>제목</th>
		<td>
			<input type="text" name="subject" required="required" autofocus="autofocus">
		</td>
	</tr>
</c:if>
<c:if test="${num != 0 }">
	<tr>
		<th>제목</th>
		<td>
			<input type="text" name="subject" required="required"
			 autofocus="autofocus" value="답변 =>">
		</td>
	</tr>
</c:if>
	<tr>
		<th>내용</th>
		<td>
			<textarea rows="5" cols="40" name="content" required="required"></textarea> 
		</td>
	</tr>
	<tr>
		<th colspan="2"><input type="submit"></th>
	</tr>
</table>
</form>
</body>
</html>