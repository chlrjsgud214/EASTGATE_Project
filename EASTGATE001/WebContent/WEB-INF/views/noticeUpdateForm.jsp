<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("css/form.css");</style>
</head>
<body>
<div align="center">
	<h2>수정</h2>
		<form action="noticeUpdate.do" method="post" name="frm"
			onsubmit="return ConChk">
			<input type="hidden" name="nnum" value=${notice.getNnum() }>
			<table>
				<tr><th>제목</th><td><input type="text" name="nsubject" value="${notice.getNsubject()}"></tr>
				<tr><th>내용</th><td><textarea rows="10" cols="30" name="ncontent" value="${ncontent}"></textarea></td></tr>
				<tr align="center">
					<td colspan="2">
						<input type="submit" value="수정하기">
						<input type="reset" value="다시 작성">
						<input type="button" value="뒤로가기" 
							onclick="location.href='content.do?nnum=${notice.getNnum()}'"></td>
			</table>	
		</form>
</div>
</body>
</html>