<%@page import="com.sun.crypto.provider.RSACipher"%>
<%@page import="java.util.List"%>
<%@page import="cart.CartDao"%>
<%@page import="cart.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/cart.css">
<script type="text/javascript">
	function fnClear() {
		if(confirm("장바구니를 비우시겠습니까?")) {
			location.href = "cartClear.do";
		}
	}
	function fnGo() {
		location.href = "mmain.do";
	}

</script>
</head>
<body>
<%-- 
<%
	
	String id = (String)request.getAttribute("id");
	System.out.println("id = "+id);
	CartDao cd = CartDao.getInstance();
	Cart cart = (ArrayList<Cart>) cd.getCart(id);
	ArrayList<Cart> cartList = null;
	
	if(cart == null) {
		cartList = new ArrayList<Cart>();
	} else {
		cartList = (ArrayList<Cart>) cart;
	}

	
	if(cartList.size() ==0) { 	%> --%>
<c:if test="${empty list }">
	<h1>장바구니</h1>	
	<table border="1">
		<tr>
			<td>장바구니에 담긴 상품이 없습니다. <a href="mmain.do">쇼핑계속하기</a></td>
		</tr>
	</table>
</c:if>
<c:if test="${not empty list }">
	<h1>장바구니</h1>
<form action="ordersForm.do">

		<table border="1">
		<tr>
			<th>상품명</th>
			<th>판매가격</th>
			<th>수량</th>
			<th>금액</th>
		</tr>
	<c:forEach var="ct" items="${list }">
	
		<tr>
			<td><img src="productimage/${ct.image }" width="100px" height="100px">${ct.pname }</td>
			<td>${ct.price }</td>
			<td>${ct.ocount }</td>	
			<c:set var="sum" value="${ct.price * ct.ocount }"/>
			<td>${sum}</td>
			<c:set var="total" value="${total + sum }"/>
		</tr>		
		
	</c:forEach>

		<tr>
			<td colspan="5" align="right"><b>총금액 : ${total }원 </b></td>
		</tr>
		
		<tr>
			<td colspan="5">
				<input type='submit' value='주문하기'  />
				<input type='button' value='쇼핑 계속하기' onclick='fnGo()' />
				<input type='button' value='장바구니 비우기' onclick='fnClear()' />
				</td>
		</tr>		
	</table>
</form>
</c:if>
</body>
</html>