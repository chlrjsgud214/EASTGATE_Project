<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("관리자로 로그인 되었습니다");
		location.href="adminMain.do";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("로그인 되었습니다");
		location.href="mmain.do";
	</script>
</c:if>
<c:if test="${result == -1 }">
	<script type="text/javascript">
		alert("없는 아이디예요");
		history.back();
	</script>
</c:if>
<c:if test="${result == -2 }">
	<script type="text/javascript">
		alert("비밀번호가 다릅니다");
		history.back();
	</script>
</c:if>
</body>
</html>