<%@page import="member.MemberDao"%>
<%@page import="cart.CartDao"%>
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
<script type="text/javascript">
	function fnClear() {
		location.href="cartClear.do";
	}
</script>
</head>

<body>
<%
	String id = request.getParameter("id");
	Member member = null;
	MemberDao md = MemberDao.getInstance();
	member = md.select(id);
%>
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
	<form action="orders.do">
	
	<h1>장바구니</h1>
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
			}
			%>
		<tr>
			<td colspan="5" align="right"><b>총금액 : <%=totalSum %>원 </b></td>
		</tr>
	<%} %>
		
	</table>
	
	<table border="1">
		<tr>
			<th colspan="2">주문자정보</th>
		</tr>
		<tr>
			<td>성명</td>
			<td><%=member.getName() %></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><%=member.getTel() %></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><%=member.getAddr() %></td>
		</tr>
		<tr>
			<td>결제수단</td>
			<td><select>
					<option>국민은행</option>
					<option>우리은행</option>
					<option>신한은행</option>
					<option>농협</option>
					<option>기타</option>
				</select></td>
		</tr>
		<tr>
			<td colspan="2">계좌번호 : <input type="text" name="account" placeholder="계좌번호를 입력하세요"></td>
		</tr>
	</table>
	
	<table border="1">
		<tr>
			<th colspan="2">배송지정보 
			<label for="same"><font size="10">주문자와 정보가 동일합니다</font></label>
			<input type="checkbox" id="same"></th>
		</tr>
		<%
			String same = request.getParameter("same");
			if(same != null) { %>				
					<tr>
						<td>성명</td>
						<td><%=member.getName() %></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><%=member.getTel() %></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><%=member.getAddr() %></td>
					</tr>
				</table>
		<%	} else{ %>
		
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
			<th colspan="2" align="right"><input type="submit" value="결제" >
											<input type="reset" value="다시입력">
											<input type="button" onclick="fnClear()" value="주문취소">
											</th>
		</tr>
	</table>
	<%} %>
	</form>
</body>
</html>