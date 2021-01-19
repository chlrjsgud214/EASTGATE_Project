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

<script type="text/javascript">
var sell_price;
var amount;

function init () {
	sell_price = document.productShowForm.sell_price.value;
	amount = document.productShowForm.amount.value;
	document.form.sum.value = sell_price;
	change();
}

function add () {
	hm = document.productShowForm.amount;
	sum = document.productShowForm.sum;
	hm.value ++ ;

	sum.value = parseInt(hm.value) * sell_price;
}

function del () {
	hm = document.productShowForm.amount;
	sum = document.productShowForm.sum;
		if (hm.value > 1) {
			hm.value -- ;
			sum.value = parseInt(hm.value) * sell_price;
		}
}

function change () {
	hm = document.productShowForm.amount;
	sum = document.productShowForm.sum;

		if (hm.value < 0) {
			hm.value = 0;
		}
	sum.value = parseInt(hm.value) * sell_price;
}  

</script>
</head>
<body>
<h1 align="center">
<a href="mmain.do"><img alt="" src="image/logo7.png"></a>
</h1>
    <form name="productShowForm" action="cartInsert.do" method="post" >
        <table>
        	<tr> 
        		<td class="fileupload" colspan="7" align="right"> <button onclick="cartInsert.do?pcode=${product.pcode }">구매하기</button>
         		<input type="text" name="amount" value="1" size="3" onchange="change();">
				<input type="button" value=" + " onclick="add();"><input type="button" value=" - " onclick="del();">  				     
            	<button type="submit" >장바구니 담기</button> </td> 
           	</tr>
            <tr>
                <th>제목</th><td>${product.pname}</td>
            </tr>
            <tr>
                <th>이미지</th><td><a href="productimage/${product.image }"><img class="imageThumb" src="productimage/${product.image }" alt="이미지 없음" ></a></td>
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