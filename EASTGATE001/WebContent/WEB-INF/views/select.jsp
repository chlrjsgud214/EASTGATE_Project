<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="sessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/form.css">
</head>
<body>
	<table>
		<tr>
			<th>아이디</th>
			<td>${member.id }</td>
		</tr>

		<tr>
			<th>이름</th>
			<td>${member.name }</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>${member.tel }</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${member.addr }</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${member.email }</td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" onclick="location.href='updateForm.do'" value="회원정보수정">
				<input type="button" onclick="location.href='mmain.do'" value="메인으로"></td>
		</tr>
	</table>
</body>
</html>