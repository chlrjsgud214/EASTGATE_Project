<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}
.b {
	background-color: white;
}
h2 {
	text-align: center;
}
table {margin: auto;margin-top:40px;
		width:72%; 
}

th {
	padding:9px;
	background: #333; color: #fff;
}
td {
	padding: 7px; background: #777;
}
</style>
</head>
<body>
<h2>공지사항</h2>
<table>
	<tr><th>번호</th><th>제목</th><th>등록일</th><th>조회수</th></tr>
	<c:if test="${empty list }">
		<tr align="center"><td colspan="4">게시글이 없습니다.</td></tr>
	</c:if>
	<c:if test="${not empty list }">
		<c:forEach var="n" items="${list }">
			<tr align="center">
				<td>${n.nnum }</td>
				<td><a href="mcontent.do?nnum=${n.nnum }">${n.nsubject }</a></td>
				<td>${n.ndate }</td>
				<td>${n.ncount }</td></tr>
		</c:forEach>
	</c:if>
	<tr align="left">
		<td colspan="4" class="b"><button onclick="location.href='mmain.do'">메인으로</button></td></tr>
</table>
<div align="center">
<c:if test="${currentPage <= startPage}">
	<button onclick="location.href='mnotice.do?pageNum=${startPage-1}'">이전</button>
</c:if>
<c:forEach var="i" begin="${startPage}" end="${endPage}">
	<c:if test="${i != currentPage }">
			<button onclick="location.href='mnotice.do?pageNum=${i}'">${i}</button>
	</c:if>	
	<c:if test="${i == currentPage }">
			<button onclick="location.href='mnotice.do?pageNum=${i}'"
				class="active">${i}</button>
	</c:if>	
</c:forEach>
<!-- 보여줄 페이지가 남아 있다	 -->
<c:if test="${currentPage >= totalPage }">
		<button onclick="location.href='mnotice.do?pageNum=${endPage+1}'">다음</button>
</c:if>
</div>

<div id="search" align="center">
		<select id="searchC" name="searchC">
			<option value="nsubject">제목</option>
			<option value="ncontent">내용</option>
		</select>
	<input type="search" id="search">
		<button>검색하기</button>
</div>
</body>
</html>