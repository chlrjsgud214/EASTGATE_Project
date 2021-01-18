<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/board.css">
</head>
<body>
<h2>게시글 삭제</h2>
<form action="bdelete.do">
	<input type="hidden" name="num" value="${num }">
	<input type="hidden" name="pageNum" value="${pageNum }">
	<table>
		<tr><th><input type="submit" value="삭제"></th></tr>
	</table>
</form>
</body>
</html>