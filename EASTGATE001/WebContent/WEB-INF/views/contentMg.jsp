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
	padding: 10px; background: #777;
}
</style>
</head>
<body>
<h2>회원 조회</h2>
<table>
<tr><th>아이디</th><th>비밀번호</th><th>이름</th><th>전화번호</th><th>주소</th><th>이메일</th><th>가입일</th><th>탈퇴여부</th></tr>
	<tr><td>${member.id}</td><td>${member.password}</td>
		<td>${member.name}</td><td>${member.tel}</td>
		<td>${member.addr}</td><td>${member.email}</td>
		<td>${member.reg_date}</td><td>${member.del}</td></tr>
</table>
<div align="center" style="margin-right: 82%">
<button onclick="location.href='memberDelete.do?id=${member.id}'">강제 탈퇴</button>
<button onclick="location.href='memberMg.do'">목록</button>
</div>
</body>
</html>