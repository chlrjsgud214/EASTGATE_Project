<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a {
	text-decoration: none;
	color:white;
}
h2 {
	text-align: center;
}
table {margin: auto;margin-top:40px;
		width:40%; 
}

th {
	padding:10px;
	background: #333; color: #fff;
}
td {
	padding: 10px; background: #777;
	text-align: center;
}
</style>
</head>
<body>
<h2>마이페이지</h2>
<table>
	<tr>
		<td><a href="select.do">회원정보</a></td>
	</tr>
	<tr>
		<td><a href="#">주문내역</a></td>
	</tr>
	<tr>
		<td><a href="deleteAction.do">회원탈퇴</a></td>
	</tr>
	<tr>
		<td><a href="mmain.do">메인으로</a></td>
	</tr>
</table>
</body>
</html>