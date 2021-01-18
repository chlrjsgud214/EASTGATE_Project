<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/board.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('#dispList').load("blist.do", "pageNum=${pageNum}");
	});
</script>
</head>
<body>
	<table>
		<tr>
			<th>번호</th>
			<td>${board.num }</td>
			<th>제목</th>
			<td>${board.subject }</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>${board.id }</td>
			<th>작성일</th>
			<td>${board.bdate }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td colspan="3">${board.readcount }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3"><pre>${board.content }</pre></td>
		</tr>
		<tr align="right">
		<td colspan="5" class="l-th" align="right"><button onclick="location.href='bupdateForm.do?num=${board.num}&pageNum=${pageNum}'">수정</button>
		<button	onclick="location.href='bdeleteForm.do?num=${board.num}&pageNum=${pageNum}'">삭제</button>
		<button	onclick="location.href='binsertForm.do?num=${board.num}&pageNum=${pageNum}'">댓글</button>
		<button onclick="location.href='blist.do?pageNum=${pageNum}'">목록</button></td>
		</tr>
	</table>
	
	
	
	
	<div id="dispList"></div>
</body>
</html>