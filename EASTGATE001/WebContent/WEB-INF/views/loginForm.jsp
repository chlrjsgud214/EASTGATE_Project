<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>로그인</h1>
<form action="loginAction.do" method="post">
	<table>
		<tr><th>아이디</th><td><input type="text" name="id" required="required"
		autofocus="autofocus"></td></tr>
		<tr><th>비밀번호</th><td><input type="text" name="password" required="required"></td></tr>
		<tr><th colspan="2"><input type="submit" value="로그인"></th></tr>
	</table>
</form>
</body>
</html>