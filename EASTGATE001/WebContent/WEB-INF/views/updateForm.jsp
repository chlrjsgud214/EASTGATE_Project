<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="sessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function chk() {
		if(frm.password.value != frm.confirmPass.value) {
			alert("암호와 암호 확인이 다릅니다");
			frm.password.focus();
			return false;
		}
		return true;
	} 
</script>
</head>
<body>
<form action="updateAction.do" name="frm" onsubmit="return chk()" method="post">
<input type="hidden" name="mid" value="${member.mid }">
	<table>
		<tr>
			<th>아이디</th>
			<td>${member.mid }</td>
		</tr>
		<tr>
			<th>암호</th>
			<td><input type="password" name="password" required="required"></td>
		</tr>
		<tr>
			<th>암호확인</th>
			<td><input type="password" name="confirmPass" required="required"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" required="required" value="${member.mname }"></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="tel" name="tel" required="required" pattern="\d{3}-\d{3,4}-\d{4}" placeholder="010-xxxx-xxxx" value="${member.tel }"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="addr" required="required" value="${member.addr }"></td>
		</tr>
		<tr>
			<th colspan="2"><input type="submit" value="가입"><input type="reset" value="취소"></th>
		</tr>
	</table>
</form>
<a href="main.do">메인으로로</a>
</body>
</html>