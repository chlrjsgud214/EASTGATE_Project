<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	a {
		text-decoration: none;
		color: white;
	}
h2 {
	text-align: center;
}
table {margin: auto;margin-top:40px;
		width:550px; 
}

th {
	padding: 20px;width: 20%;
	background: #333; color: #fff;
}
td {
	padding: 20px;background: #777;
}
</style>
<title>Insert title here</title>
</head>
<body>
<h2>관리자 페이지</h2>
	<table>
		<tr><th>관리자 메뉴</th></tr>
		<tr><td><a href='notice.do'>공지사항</a></td></tr>
		<tr><td><a href='blist.do'>Q&A</a></td></tr>
		<tr><td><a href='memberMg.do'>회원</a></td></tr>
	</table>
<div align="center">
	<button onclick="location.href='adminMain.do'">메인</a></button>
</div>
</body>
</html>