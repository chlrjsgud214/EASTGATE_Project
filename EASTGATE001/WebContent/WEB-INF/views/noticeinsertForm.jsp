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
<div align="center">
	<h2>공지사항 작성</h2>
		<form action="noticeinsert.do" method="post" name="frm"
			onsubmit="return ConChk">
			<input type="hidden" name="nnum" value=${notice.nnum }>
			<table>
				<tr><th>제목</th><td><input type="text" name="nsubject" autopautofocus="autofocus"></tr>
				<tr><th>내용</th><td><textarea rows="10" cols="30" name="ncontent"></textarea></td></tr>
				<tr align="center">
					<td colspan="2">
						<input type="submit" value="등록">
						<input type="reset" value="다시 작성">
						<input type="button" value="목록으로" 
							onclick="location.href='notice.do'"></td>
			</table>	
		</form>
</div>
</body>
</html>