<%@page import="member.MemberDao"%>
<%@page import="cart.CartDao"%>
<%@page import="member.Member"%>
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
		location.href="cartInsert.do";
	}
</script>
</head>

<body>
	<form action="orders.do" method="post">
	<table border="1">
		<tr>
			<th colspan="4">상품목록</th>
		</tr>
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
		</tr>		
		<%-- <c:set var="pcode" value=${ct.pcode } scope="session"/>
		<c:set var="pname" value=${ct.pcode } scope="session"/>
		<c:set var="image" value=${ct.pcode } scope="session"/>
		<c:set var="price" value=${ct.pcode } scope="session"/>
		<c:set var="ocount" value=${ct.pcode } scope="session"/> --%>
		</c:forEach>
		<tr>
			<td colspan="4" align="right"><b>총금액 : ${total } </b></td>
		</tr>	
	</table>
	<%
		String id = (String)request.getAttribute("id");
		Member member = new Member();
		MemberDao md = MemberDao.getInstance();
		member = md.select(id);
	%>
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
			<th colspan="2">배송지정보 </th>
		</tr>
			
		<tr>
			<td>성명</td>
			<td><input type="text" required="required"></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="tel" required="required"
				pattern="\d{3}-\d{3,4}-\d{4}" placeholder="010-xxxx-xxxx"></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" required="required"></td>
		</tr>
	</table>
		<table>				
			<tr>
				<th colspan="2" align="right"><input type="submit" value="결제" >
											<input type="reset" value="다시입력">
											<input type="button" onclick="fnClear()" value="주문취소">
											</th>		
			</tr>
		</table>
	</form>
</body>
</html>