<%@page import="cart.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/cart.css">
<script type="text/javascript">
	function fnClear() {
		if(confirm("장바구니를 비우시겠습니까?")) {
			location.href = "cartClear.jsp";
		}
	}
	function fnGo() {
		location.href = "Mmain.do";
	}
</script>
</head>
<body>
<%
	ArrayList<Cart> cart = null;
	Object obj = session.getAttribute("cart");
	if(obj == null) {
		cart = new ArrayList<Cart>();
	} else {
		cart = (ArrayList<Cart>) obj;
	}
	
	if(cart.size() ==0) { 	%>
	<h1>장바구니</h1>	
	<table border="1">
		<tr>
			<td>장바구니에 담긴 상품이 없습니다. <a href="mmain.do">쇼핑계속하기</a></td>
		</tr>
	</table>
	<%	} else {	%>
	<h1>장바구니</h1>
	<form action="ordersForm.do" method="post">
	<table border="1">
		<tr>
			<th>번호</th>
			<th>상품명</th>
			<th>판매가격</th>
			<th>수량</th>
			<th>금액</th>
		</tr>
	<%		int totalSum = 0, total = 0;			
			for(int i = 0; i < cart.size(); i++) { 
				Cart ct = cart.get(i); %>
		<tr>
			<td><%= i+1 %></td>
			<td><img src="../image/<%=ct.getImage() %>"><%=ct.getPname() %></td>
			<td><%=ct.getPrice() %></td>
			<td><%=ct.getOcount() %></td>
			<%total = ct.getPrice() * ct.getOcount(); %>
			<td><%=total %></td>
		</tr>		
	<%			totalSum += total;
			}  %>
		<tr>
			<td colspan="5" align="right"><b>총금액 : <%=totalSum %>원 </b></td>
		</tr>
		<tr>
			<td colspan="5">
				<input type='submit' value='주문하기' />
				<input type='button' value='쇼핑 계속하기' onclick='fnGo()' />
				<input type='button' value='장바구니 비우기' onclick='fnClear()' />
				</td>
		</tr>	
	<%	}
	%>		
	</table>
</form>
</body>
</html>