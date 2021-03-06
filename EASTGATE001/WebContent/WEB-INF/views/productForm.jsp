
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="sessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>EAST-GATE 상품등록</title>   
    
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<script>  // 게시판 에디터 
    $(document).ready(function() {
  $('#productnote').summernote({
    placeholder: '등록할 제품의 설명을 넣어주세요.  EAST-GATE',
        height: 500, // 크기
        lang: 'ko-KR', //언어
        toolbar: [
                    // [groupName, [list of button]]
                    ['Font Style', ['fontname']],
                    ['style', ['bold', 'italic', 'underline']],
                    ['font', ['strikethrough']],
                    ['fontsize', ['fontsize']],
                    ['color', ['color']],
                    ['para', ['paragraph']],
                    ['height', ['height']],
                    ['Insert', ['picture']],
                    ['Insert', ['link']],
                    ['Misc', ['fullscreen']]
                 ]
  });
});
</script> 

<!-- 이미지 미리보기 스타일 -->
    <style>
    input[type="file"] {
        display: block;
      }
      .imageThumb {
        max-height: 120px;
        max-width: 120px;
        border: 2px solid;
        padding: 1px;
        cursor: pointer;
      }
      .pip {
        display: inline-block;
        margin: 10px 10px 0 0;
      }
      .remove {
        display: block;
        background: #444;
        border: 1px solid black;
        color: white;
        text-align: center;
        cursor: pointer;
      }
      .remove:hover {
        background: white;
        color: black;
      }
</style>   

<script type="text/javascript"> // 이미지 미리보기 스크랩
    $(document).ready(function() {
        if (window.File && window.FileList && window.FileReader) {
            $("#pimageid").on("change", function(e) {
                var files = e.target.files,
                filesLength = files.length;
                for (var i = 0; i < filesLength; i++) {
                    var f = files[i]
                    var fileReader = new FileReader();
                
                    fileReader.onload = (function(e) {
                    var file = e.target;
                    $("<span class=\"pip\">" +
                    "<img class=\"imageThumb\" src=\"" + e.target.result + "\" title=\"" + file.name + "\"/>" +
                    "<br/><span class=\"remove\">이미지 삭제</span>" +
                    "</span>").insertAfter("#pimageid");
                        $(".remove").click(function(){
                            $(this).parent(".pip").remove();
                        });          
                    });
                fileReader.readAsDataURL(f);
                }
            });
        } else {
            alert("브라우저에서 해당 기능을 지원하지 않습니다.")
        }
    });
</script>
  
 <script> // 카테고리 선택
/*     <option value="A">패션의류/잡화</option>
                  <option value="B">스포츠</option>
                  <option value="C">식품</option>
                  <option value="D">가전디지털</option>*/

       function CategoryChange_top(e) { // 대분류 선택시 중분류 설정
    var Clothing = ["여성", "남성"];
    var Sports = ["여성","남성"];
    var Beauty =["뷰티"];
    var Food = ["건강식품"];
    var Digital = ["가전디지털"];
    
    var middle_option = document.getElementById("Category_middle");

    if(e.value == "C") 
        var mselect = Clothing;             
    else if(e.value == "S") 
        var mselect = Sports;
    else if(e.value == "B") 
        var mselect = Beauty;
    else if(e.value == "F") 
        var mselect = Food;
    else if(e.value == "D")
        var mselect = Digital;
    
    middle_option.options.length = 0;
    var count = 1;
    var opt = document.createElement("option");    
        opt.value="";
        opt.innerHTML = "중분류 선택";
        middle_option.appendChild(opt);
    for (x in mselect) {
        var opt = document.createElement("option");
        opt.value = e.value+x;
        opt.innerHTML = mselect[x];
        middle_option.appendChild(opt);
    }   


}
//////////////////////////////////////////////////////////////////
function CategoryChange_middle(e) { // 중분류 선택시 소분류 설정
    var c_women=["티셔츠","블라우스/셔츠","원피스/세트류","바지/레깅스",
    "스커트/치마","니트류/조끼","맨투맨/후드집업","아우터","패션운동복",
    "비키니/비치웨어","속옷/잠옷","신발","가방/잡화"];
    var c_men=["티셔츠","맨투맨/후드티","셔츠","바지/청바지","트레이닝복",
    "후드집업/집업류","스웨터","가디건","베스트/조끼","아우터","속옷/잠옷",
    "신발","가방/잡화"];
    var s_women=["언더레이어","티셔츠","자켓/집업","바지","요가복","등산의류","골프의류","스키/보드복","수영복/레쉬가드"];
    var s_men=["언더레이어","티셔츠","자켓/집업","바지","요가복","등산의류","골프의류","스키/보드복","수영복/레쉬가드"];
    var b=["클랜징/필링","메이크업","향수","남성화장품","네일","뷰티소품","헤어","바디"];
    var f=["건강즙","비타민/미네랄","영양제","헬스보충식품","다이어트식품","견과/건과","영양식/선식","건강차"];
    var d=["공기청정기","다리미/재봉/보풀","비데/온수기","전동칫솔","학습용 스탠드","안마/찜질기","건강측정/의료기","살균/소독기","손건조기"];
    
    var low_option = document.getElementById("Category_low");    
    if(e.value == "C0") var lselect = c_women;
    else if(e.value == "C1") var lselect = c_men;
    else if(e.value == "S0")var lselect = s_women;
    else if(e.value == "S1")var lselect = s_men;
    else if(e.value == "B0")var lselect = b;
    else if(e.value == "F0")var lselect = f;
    else if(e.value == "D0")var lselect = d;
    low_option.options.length = 0;
    
        var opt = document.createElement("option");
        opt.value = "";
        opt.innerHTML = "소분류 선택";
        low_option.appendChild(opt);
    for (x in lselect) {   
        var opt = document.createElement("option");   
        
        
        if(x <10)x00="0"+x; 
        else var x00=x; // 자릿수 4개로 맞추기
        opt.value = e.value+x00; // 최종 제품 카테고리 코드 4자리
        opt.innerHTML = lselect[x];
      
        low_option.appendChild(opt);
    }   
}
function CategoryValue(e) { // 카테고리 코드 보내기
    var cval=e.value;
    document.getElementById('pcode').value=cval;
}
   </script>
   
   
 <!-- 기본 폼 스타일 -->
<style> 
h2 {
	text-align: center;
}
form {margin: 5px 0;}
table {margin: auto;
		width:800px; 
}

th {
	padding: 20px;width: 20%;
	background: #333; color: #fff;border: 1px solid #fff;
}
tr:last-child th {text-align: right;}
tr:last-child th input {background: #fff;font-size: 20px;color: #333; text-shadow: none;cursor: pointer;}
td {
	padding: 20px;background: #777;border: 1px solid #fff;
}

#err {
	color: #f56642;
	font-weight: bold;
}
.pname{
	width:100%; 
}

</style>

<%          // id 값 불러오기 
String pid = (String)session.getAttribute("id");

%>
<script type="text/javascript"> // 값 확인 
	function valchk() {
		var pcode=frm.pcode.value;
		var pname=frm.pname.value;
		var price=frm.price.value;
		var pcount=frm.pcount.value;
		var explain=frm.explain.value;
		var image=frm.image.value;
		alert("pcode :"+pcode+"\r\npname : "+pname+"\r\nprice :"+price+"\r\npcount :"
				+pcount+"\r\nexplain :"+explain+"\r\n 이미지 : "+image+
				"\r\n끝");
	}

</script>
</head>
<body>
<h1 align="center">
							<a href="mmain.do"><img alt="" src="image/logo7.png"></a>
						</h1>
	<form name="productForm" action="productupload.do" 
	method="post" id="frm"
    enctype="multipart/form-data">
    <table>
    	<tr><th>카테고리 선택</th><td>
            <div class="category_div">
                <select class="category_select_top" id="Category_top" name="Category_top" 
                onchange="CategoryChange_top(this)" required="required">
                  <option>대분류 선택</option>
                  <option value="C" >패션의류/잡화</option>
                  <option value="S">스포츠</option>
                  <option value="B">뷰티</option>
                  <option value="F">식품</option>
                  <option value="D">가전디지털</option>
                </select>
                <select class="category_select_middle" id="Category_middle" name="Category_middle"
                onchange="CategoryChange_middle(this)">
                  <option>중분류 선택</option>
                </select>
                <select class="category_select_low" id="Category_low" name="pcode"
                onchange="CategoryValue(this)" required="required">
                    <option>소분류 선택</option>
                  </select>
              </div></td>
        </tr>
        <tr >
            <th>제목</th><td ><input type="text" name="pname" class="pname"
           	required="required" autofocus="autofocus"></td>
        </tr>
        <tr>
			<th>판매자 ID</th>
			<td><%=pid%></td>
			
		</tr>
        <tr>             
            <th>썸네일 이미지</th>  
            <td> 
                <div class="field" align="left" >
                <span>
                    <input type="file" id="pimageid" name="image" />
                </span>
                </div>
            </td>
        </tr>
        <tr>
            <th>가격</th><td><input type="text" name="price" required="required">원</td>
        </tr>
         <tr>
            <th>재고수량</th><td><input type="text" name="pcount" required="required">개</td>
        </tr>
        <!-- <tr>
            <th>제품 설명</th>  <td ><div id="productnote" ></div> </td> 
        </tr>-->
         <tr>
            <th>제품 설명</th><td> <textarea rows="30" cols="100" name="explain"></textarea> </td>
        </tr>
        <tr><th colspan="2"><input type="submit" value="상품 등록" ></th></tr>
    </table>
</form>
</body>
</html>