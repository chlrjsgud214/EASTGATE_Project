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
		text-align: center;
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
<h2>회원 리스트</h2>
<table>
	<tr><th>이름</th><th>전화번호</th><th>주소</th><th>이메일</th><th>가입일</th><th>탈퇴여부</th>
	<c:if test="${empty list}">
		<tr colspan="6"><th>회원이 없습니다.</th></tr>
	</c:if>
		<c:if test="${not empty list}">
			<c:forEach var="m" items="${list }">
			<input type="hidden" name="id" value="${m.id }">
				<tr><td><a href="contentMg.do?id=${m.id}">${m.name}</a></td>
					<td>${m.tel}</td>
					<td>${m.addr}</td>
					<td>${m.email}</td>
					<td>${m.reg_date}</td>
					<td>${m.del}</td></tr>
			</c:forEach>
	</c:if>
	<tr align="left">
		<td colspan="6" class="b"><button onclick="location.href='adminpageForm.do'">이전 페이지</button></td></tr>
</table>
<div align="center">

<c:if test="${currentPage <= startPage}">
	<button onclick="location.href='notice.do?pageNum=${startPage-1}'">이전</button>
</c:if>
<c:forEach var="i" begin="${startPage}" end="${endPage}">
	<c:if test="${i != currentPage }">
			<button onclick="location.href='notice.do?pageNum=${i}'">${i}</button>
	</c:if>	
	<c:if test="${i == currentPage }">
			<button onclick="location.href='notice.do?pageNum=${i}'"
				class="active">${i}</button>
	</c:if>	
</c:forEach>
<c:if test="${currentPage >= totalPage }">
		<button onclick="location.href='notice.do?pageNum=${endPage+1}'">다음</button>
</c:if>
</div>
</body>
</html>