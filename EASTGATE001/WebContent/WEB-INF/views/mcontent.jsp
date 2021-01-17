<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("css/form.css");</style>
</head>
<body>
<table>
	<tr><th>번호</th><td>${notice.nnum}</td>
		<th>제목</th><td>${notice.nsubject}</td>
		<th>작성일</th><td>${notice.ndate}</td>
		<th>조회수</th><td>${notice.ncount}</td></tr>
	<tr><th>내용</th><td colspan="7">${notice.ncontent}</td></tr>
</table>
<div align="center" style="margin-right: 502px">
<button onclick="location.href='mnotice.do'">목록</button>
</div>
</body>
</html>