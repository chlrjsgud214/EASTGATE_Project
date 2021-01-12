<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
<%@ page import="product.*" %>
<%@ page import="java.util.List,java.text.SimpleDateFormat" %>


<%	 
	List <Product> productList = null; int number = 0;
    String pcode = request.getParameter("pcode");
 
    ProductDao product_Process = ProductDao.getInstance();
    int count = product_Process.getProductCount();
    
    if (count > 0) {
    	productList = product_Process.getProducts(pcode);
    }
%>
<html><head><title>제품등록 리스트</title>
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css"> body { text-align: center;}</style>
</head><body>
<%
	String product_Name="";
   if(pcode.equals("C")){   product_Name="의류";
   }else if(pcode.equals("S")){  product_Name="스포츠";  
   }else if(pcode.equals("B")){  product_Name="뷰티";
   }else if(pcode.equals("F")){  product_Name="식품";
   }else if(pcode.equals("D")){  product_Name="디지털";}
%>
<a href="../managerMain.jsp"> 관리자 메인으로</a> &nbsp;
<b><%=product_Name%> 분류의 목록: 
<%
	if(pcode.equals("all")){
%>     <%=count%>개
<%
     	}else{
     %>    <%=productList.size()%>개
<%
    	}
    %>
</b>
<table >
<tr><td align="right" >
       <a href="ProductForm.action">책 등록</a> 
 </td></tr></table>
<%
	if (count == 0) {
%>
	<table>
		<tr><td align="center">등록된 책이 없습니다</td></tr></table>
<%
	} else {
%>
<table> 
    <tr height="30"> 
      <th>제품코드</th>  <th>분류</th> <th>제목</th>
      <th>가격</th>  <th>수량</th> 
      <th>이미지</th><th>내용</th> 
      <th>수정</th> <th>삭제</th>         
    </tr>
<%
	for (int i = 0 ; i <productList.size() ; i++) {
      	Product product = (Product)productList.get(i);
%>
   <tr height="30">
      <td><%=++number%></td> 
      <td><%= product.getPcode() %></td> 
      <td><%= product.getPname() %></td>
      <td><%= product.getPrice() %></td> 
      <td align="right">
         <% if(product.getPcount()<=0) {%>
         <font color="red"><%="일시품절"%></font>
         <% }else{ %> <%=product.getPcount()%>
         <%} %>
      </td> 
      <td><%=product.getPimage() %></td>
      <td><%=product.getPcon() %></td>
      
      <td>
         <a href="productUpdateForm.jsp?pcode=<%=product.getPcode()%>">수정</a></td>
      <td width="50">
         <a href="productDeleteForm.jsp?pcode=<%=product.getPcode()%>">삭제</a></td>    
  </tr>
     <% }%>
</table>
<% } %>
<br><a href="../managerMain.jsp"> 관리자 메인으로</a> 
</body></html>