<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
h2 {
	text-align: center;
}
table {margin: auto;margin-top:40px;
		width:90%; 
}

th {
	padding:10px;
	background: #333; color: #fff;
}
td {
	padding: 5px; background: #777;
	text-align: center;
}
</style>
</head>
<body>
<table>
	<tr><th>번호</th><td>${notice.nnum}</td>
		<th>제목</th><td>${notice.nsubject}</td>
		<th>작성일</th><td>${notice.ndate}</td>
		<th>조회수</th><td>${notice.ncount}</td></tr>
	<tr><th>내용</th><td colspan="7">${notice.ncontent}</td></tr>
</table>
<div align="center" style="margin-right: 87%">
<button onclick="location.href='mnotice.do'">목록</button>
</div>
</body>
</html>