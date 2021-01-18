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
<h2>Q&A 수정</h2>
<form action="bupdate.do" method="post">
	<input type="hidden" name="num" value="${board.num}">
	<input type="hidden" name="pageNum" value="${pageNum}">
<table><tr><th>제목</th><td><input type="text" name="subject" 
		required="required" autofocus="autofocus"
		value="${board.subject}"></td></tr>
	<tr><th>아이디</th><td><input type="text" name="id"
		required="required" value="${board.id}"></td></tr>
	<tr><th>내용</th><td><textarea rows="5" cols="40" 
		name="content" required="required" >${content}</textarea></td></tr>
	<tr><th colspan="2"><input type="submit"></th></tr>
</table>
</form>
</body>
</html>