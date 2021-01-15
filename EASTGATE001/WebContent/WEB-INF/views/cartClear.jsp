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
		alert("장바구니를 비웠습니다");
		location.href="cartList.do";
	</script>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("다시 시도해주세요");
			history.go(-1);
		</script>
	</c:if>
	<c:if test="${result == -1 }">
		<script type="text/javascript">
			alert("장바구니가 처음부터 없었네요, 쇼핑을 계속 할까요?");
			location.href="mmain.do";
		</script>
	</c:if>
</c:if>

</body>
</html>