<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style type="text/css">
h2 {
	text-align: center;
}
form {margin: 100px 0;}
table {margin: auto;
		width:800px; 
}
.imageThumb {
        max-height: 150px;
        max-width: 150px;
        border: 2px solid;
        padding: 1px;
        cursor: pointer;
      }
th {
	padding: 20px;width: 20%;
	background: #333; color: #fff;border: 1px solid #fff;
}
tr:last-child th {text-align: right;}
tr:last-child th input {background: #fff;font-size: 20px;color: #333; text-shadow: none;cursor: pointer;}
td {
	padding: 10px;background: #777;border: 1px solid #fff;
}
td.fileupload{
	padding: 5px;background: white;border: 1px solid #fff;
}
#err {
	color: #f56642;
	font-weight: bold;
}
</style>
</head>
<body>
    <form name="productShowForm" action="cart.do" method="post" enctype="multipart/form-data">
        <table>
        <tr> <td class="fileupload" colspan="7" align="right"> <button onclick="cart.do?pcode=${product.pcode }">구매하기</button>
         <button onclick="cart.do?pcode=${product.pcode }">장바구니 담기</button> </td> </tr>
            <tr>
                <th>제목</th><td>${product.pname}</td>
            </tr>
            <tr>
                <th>이미지</th><td><a href="productimage/${product.pimage }"><img class="imageThumb" src="productimage/${product.pimage }" alt="이미지 없음" ></a></td>
            </tr>
            <tr>
                <th>가격</th><td>${product.price}</td>
            </tr>
            <tr>
                <th>남은 재고 수량</th> <td>${product.pcount}</td>

            </tr>
            <tr>
                <th>본문</th><td>${product.explain}</td>
            </tr>
            
        </table>

    </form>
</body>
</html>