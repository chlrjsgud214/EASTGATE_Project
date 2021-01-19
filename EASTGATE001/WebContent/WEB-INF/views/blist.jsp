<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/board.css">
</head>
<body>
<%String pid = (String)session.getAttribute("id");%>
<h2>Q&A</h2>
<table>
	<tr>
		<th>번호</th><th>제목</th><th>작성자</th><th>조회수</th><th>작성일</th>
	</tr>
<c:if test="${empty list }">
	<tr>
		<th colspan="5">게시글이 없습니다</th>
	</tr>
</c:if>
<c:if test="${not empty list }">
<c:forEach var="board" items="${list }">
	<tr>
		<td>${tot }<c:set var="tot" value="${tot - 1 }"></c:set></td>
	<td title="${board.content}">
	<c:if test="${board.re_level > 0}">
		<img alt="" src="images/level.gif" height="10" 
			width="${board.re_level*10}">
		<img alt="" src="images/re.gif">	
	</c:if>
		<a href="bcontent.do?num=${board.num}&pageNum=${currentPage}">
			${board.subject}</a>
	<c:if test="${board.readcount > 50}">
		<img alt="" src="images/hot.gif">
	</c:if></td>
	<td><%=pid %></td>
	<td>${board.readcount}</td>
	<td>${board.bdate}</td></tr>
</c:forEach>
</c:if>
	<tr align="right">
		<td colspan="5" class="l-th"><button onclick="location.href='binsertForm.do?num=0&pageNum=1'" class="gesi">게시글 작성</button></td>
	</tr>
</table>

<div align="center">
<c:if test="${startPage > pagePerBlock}">
	<button onclick="location.href='blist.do?pageNum=${startPage-1}'">이전</button>
</c:if>
<c:forEach var="i" begin="${startPage}" end="${endPage}">
	<c:if test="${i != currentPage }">
			<button onclick="location.href='blist.do?pageNum=${i}'">${i}</button>
	</c:if>	
	<c:if test="${i == currentPage }">
			<button onclick="location.href='blist.do?pageNum=${i}'"
				class="active">${i}</button>
	</c:if>	
</c:forEach>
<c:if test="${endPage < totalPage }">
		<button onclick="location.href='blist.do?pageNum=${endPage+1}'">다음</button>
</c:if>
</div>
</body>
</html>