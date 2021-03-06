<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/form.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function idChk() {
		if (!frm.id.value) {
			alert("아이디를 입력하세요");
			frm.id.focus();
			return false;
		}
		$.post('idChk.do', "id="+frm.id.value, function(data) {
			$('#err').html(data);
		});
	}
	function chk() {
		if (frm.password.value != frm.confirmPass.value) {
			alert("암호와 암호확인이 다릅니다");
			frm.password.focus();
			return false;
		}
	}
</script>
</head>
<body>
<div id=container>
	<div id=box>
		
		<div id=formMain>
			<form action="joinAction.do" name="frm" onsubmit="return chk()"
				method="post">
				<table>
					<tr>
						<th colspan="2">
							<a href="main.do"><img alt="" src="image/logo7.png"></a>
						</th>
					</tr>
					<tr>
						<th>아이디</th>
						<td><input type="text" name="id" required="required" autofocus="autofocus" autocomplete="off"> 
							<input type="button" value="중복확인" onclick="idChk()">
							<div id="err"></div></td>
					</tr>
					<tr>
						<th>암호</th>
						<td><input type="password" name="password"
							required="required"></td>
					</tr>
					<tr>
						<th>암호확인</th>
						<td><input type="password" name="confirmPass"
							required="required"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" required="required"
							autocomplete="off"></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="tel" name="tel" required="required"
							pattern="\d{3}-\d{3,4}-\d{4}" placeholder="010-xxxx-xxxx"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" name="addr" required="required"
							autocomplete="off"></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="email" name="email" required="required"></td>
					</tr>
					<tr>
						<th colspan="2"><input type="submit" value="가입" class="btn"><input
							type="reset" value="취소" class="btn"></th>
					</tr>
				</table>
			</form>
 		</div>
	</div>
</div>
</body>
</html>