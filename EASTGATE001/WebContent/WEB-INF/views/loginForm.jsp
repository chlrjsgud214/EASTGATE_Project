<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/form.css">
</head>
<body>
	<div id=container>
		<div id=box>
			<div id=formMain>
				<form action="loginAction.do" method="post">
					<h2>로그인</h2>
					<table>
						<tr>
							<th>아이디</th>
							<td><input type="text" name="id" required="required"
								autofocus="autofocus"></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="password"
								required="required"></td>
						</tr>
						<tr>
							<th colspan="2">
								<input type="submit" value="로그인" class="btn">
								<input type="button" value="회원가입" class="btn" onClick="location.href='joinForm.do'">
							</th>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>