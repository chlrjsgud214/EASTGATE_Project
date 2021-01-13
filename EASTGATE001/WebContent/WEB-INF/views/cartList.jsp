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
	function fnPay() {
		alert("결제 API를 발급 받으시기 발바니다.");
	}
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
<form action="buyForm.do">
	<table border="1">
		<tr>
			<th>번호</th>
			<th>상품명</th>
			<th>판매가격</th>
			<th>수량</th>
			<th>가격</th>
		</tr>
	<%
		if(cart.size() ==0) {
			out.println("<tr>");
				out.println("<td colspan='5'>");
				out.println("장바구니에 담긴 상품이 없습니다.");
				out.println("<a href='mmain.do'>주문하기</a>");
				out.println("</td>");
			out.println("</tr>");
		} else {
			int totalSum = 0, total = 0;			
			String pname = request.getParameter("pname");
			int price = Integer.parseInt(request.getParameter("price"));
	
			for(int i = 0; i < cart.size(); i++) {
				Cart ct = cart.get(i); 
				out.println("<tr>");
					out.println("<td>"+i+1+"</td>");
					out.println("<td>"+pname+"</td>");
					out.println("<td>"+price+"</td>");
					out.println("<td>"+ct.getOcount()+"</td>");
					total = price * ct.getOcount();
					out.println("<td>"+total+"</td>");
				out.println("</tr>");
				totalSum += total;
			}
			out.println("<tr>");
				out.println("<td colspan='4'>");
					out.println("<input type='button' value='결제하기' onclick='fnPay()' />");
					out.println("<input type='button' value='장바구니 비우기' onclick='fnClear()' />");
					out.println("<input type='button' value='쇼핑 계속하기' onclick='fnGo()' />");
				out.println("</td><td>");
				out.println(totalSum+"</td>");
			out.println("<tr>");
		}
	%>
		
	</table>
</form>
</body>
</html>