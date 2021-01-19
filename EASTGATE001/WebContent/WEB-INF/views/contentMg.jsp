<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
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
<h2>회원 조회</h2>
<table>
<tr><th>아이디</th><th>비밀번호</th><th>이름</th><th>전화번호</th><th>주소</th><th>이메일</th><th>가입일</th><th>탈퇴여부</th></tr>
	<tr><td>${member.id}</td><td>${member.password}</td>
		<td>${member.name}</td><td>${member.tel}</td>
		<td>${member.addr}</td><td>${member.email}</td>
		<td>${member.reg_date}</td><td>${member.del}</td></tr>
	<tr align="left">
		<td colspan="8" class="b"><button onclick="location.href='memberDelete.do?id=${member.id}'">강제 탈퇴</button>
			<button onclick="location.href='memberMg.do'">목록</button></td></tr>
</table>
</body>
</html>