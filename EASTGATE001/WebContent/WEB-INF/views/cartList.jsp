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
%>

<h1>장바구니</h1>
<form action="ordersForm.do" method="post">
	<table border="1">
		<tr>
			<th>번호</th>
			<th>상품명</th>
			<th>판매가격</th>
			<th>수량</th>
			<th>가격</th>
		</tr>
	<%
		if(cart.size() ==0) { %>
		<tr>
			<td colspan="5">장바구니에 담긴 상품이 없습니다. <a href="mmain.do">쇼핑계속하기</a></td>
		</tr>
	<%	} else {	%>
		<input type="hidden" name="pcode" value="${pcode }">
		<input type="hidden" name="mcode" value="${mcode }">
	<%		int totalSum = 0, total = 0;			
			String pname = request.getParameter("pname");
			int price = Integer.parseInt(request.getParameter("price"));
	
			for(int i = 0; i < cart.size(); i++) { 
				Cart ct = cart.get(i); %>
		<tr>
			<td><%= i+1 %></td>
			<td><%=pname %></td>
			<td><%=price %></td>
			<td><%=ct.getOcount() %></td>
			<%total = price * ct.getOcount(); %>
			<td><%=total %></td>
		</tr>		
	<%			totalSum += total;
			}  %>
		<tr>
			<td colspan="4">
				<input type='submit' value='주문하기' />
				<input type='button' value='장바구니 비우기' onclick='fnClear()' />
				<input type='button' value='쇼핑 계속하기' onclick='fnGo()' /></td>
			<td><%=totalSum %></td>
		</tr>	
	<%	}
	%>		
	</table>
</form>
</body>
</html>