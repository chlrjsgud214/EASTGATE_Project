<%@page import="member.Member"%>
<%@page import="cart.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>

<body>
<%
	ArrayList<Cart> cart = new ArrayList<>();
	
	Member member = new Member();
	
	String pcode = request.getParameter("pcode"); 
	String mcode = request.getParameter("mcode"); 
	
	/* int ocount = Integer.parseInt(request.getParameter("ocount"));
	int oprice = Integer.parseInt(request.getParameter("oprice")); */
	
%>

	<h1>구매목록</h1>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>상품명</th>
			<th>판매가격</th>
			<th>수량</th>
			<th>금액</th>
		</tr>
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
			<td colspan="5">총 주문 금액 : <%=totalSum %></td>
		</tr>
	</table>
	
	<table border="1">
		<tr>
			<th colspan="2">주문자정보</th>
		</tr>
		<tr>
			<td>성명</td>
			<td></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td></td>
		</tr>
		<tr>
			<td>주소</td>
			<td></td>
		</tr>
		<tr>
			<td>결제수단</td>
			<td></td>
		</tr>
	</table>
	
	<table border="1">
		<tr>
			<th colspan="2">배송지정보</th>
		</tr>
		<tr>
			<td>성명</td>
			<td></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td></td>
		</tr>
		<tr>
			<td>주소</td>
			<td></td>
		</tr>
		<tr>
			<td>결제수단</td>
			<td></td>
		</tr>
		<tr>
			<th><input type="button" value="결제" onclick="fnOrders()">
		</tr>
	</table>
</body>
</html>