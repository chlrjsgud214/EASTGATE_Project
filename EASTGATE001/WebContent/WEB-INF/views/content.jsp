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
<table>
	<tr><th>번호</th><td>${notice.nnum}</td>
		<th>제목</th><td>${notice.nsubject}</td>
		<th>작성일</th><td>${notice.ndate}</td>
		<th>조회수</th><td>${notice.ncount}</td></tr>
	<tr><th>내용</th><td colspan="7">${notice.ncontent}</td></tr>
	<tr align="left">
		<td colspan="5" class="b"><button onclick="location.href='noticeUpdateForm.do?nnum=${notice.nnum}'">수정</button>
						<button onclick="location.href='noticeDelete.do?nnum=${notice.nnum}'">삭제</button>
						<button onclick="location.href='notice.do'">목록</button></td></tr>
</table>
</body>
</html>