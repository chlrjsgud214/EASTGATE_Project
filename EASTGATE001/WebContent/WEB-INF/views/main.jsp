<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<link rel="stylesheet" href="css/reset.css">
<script>
	$(function() {
		$('.gnb>li').hover(function() {
			$(this).children('ul', 'ul ul').slideDown()
		}, function() {
			$('.gnb ul').hide()
		})

	})//ready
</script>
<style>
body {
	font-size: 14px;color: #333;font-family: '맑은 고딕';
}

a {
	text-decoration: none;color: inherit;
}

.container {
	width: 1080px;margin: auto;
}

.container:after {
	content: "";display: block;clear: both;
}

.blind {
	width: 0;height: 0;overflow: hidden;padding: 0;margin: 0;display: none;
}
/* Header */
header {
	
}

.top_header {
	padding: 20px 0;border-bottom: 2px solid #000000;
}

h1 {
	float: left;
}

h1 a {
	height: 100px;
}

.util {
	float: right;margin-bottom: 45px;
}

.util li {
	float: left;font-size: 12px;color: #666;
}

.util li:after {
	content: "";display: inline-block;margin: 0 8px;width: 1px;
	height: 8px;background: #AAA;
}

.util li:last-child:after {
	display: none;
}

.search_form {
	clear: right;float: right;border: 1px solid #000;
}

.search_form input {
	vertical-align: middle;
}

.search_form .search_txt {
	width: 220px;height: 30px;border: none;padding-left: 10px;
}

.gnb_wrap {
	border-bottom: 2px solid #000000;
}

.gnb {
	font-weight: bold;
}

.gnb a {
	display: block;
}

.gnb>li {
	position: relative;z-index: 999;
}

.gnb>li>a {
	width: 210px;line-height: 40px;font-size: 16px;
}

.gnb>li>a:hover {
	background: #f16e5a;color: #FFF;
}
.gnb ul {
	font-size: 8px;
    overflow: hidden;display: none;position: absolute;
    background:#FFF; 
}
.gnb ul li {width: 180px;}
.gnb>li>a {font-size: 16px;}
.g1 {left: 220px;top: 10px;}
.g2 {left: 220px;top: 130px;}
.g3 {left: 220px;top: -30px;}
.g4 {left: 220px;top: 100px;}
.g5 {left: 220px;top: 200px;}
.g6 {left: 220px;top: 260px;}
.g7 {left: 220px;top: -70px;}
.g8 {left: 220px;top: -110px;}
.g9 {left: 220px;top: -150px;}
.gnb ul li {
	float: left;
}

.gnb ul li a {
	padding: 13px 35px;
}

.gnb ul li a:hover {
	
}

/* Main */
main {
	
}

.slider_wrap {
	height: 360px;overflow: hidden;position: relative;margin-top: 25px;
}

h2 {
	font-size: 24px;margin-bottom: 40px;margin-left: 30px;
}

.product1 {
	margin-top: 50px;
}

.contents {
	position: relative;padding-bottom: 300px;
}

.contents .box {
	position: absolute;left: 0;right: 0;top: 0;
}

.contents .box li span {
	text-align: center;
}

.box {
	margin-left: 60px;
}

.box li {
	float: left;padding-right: 40px;
}

.box li img {
	width: 210px;height: 210px;
}

.box li:last-child {
	padding-right: 0;
}

.txt_price {
	color: #f16e5a;font-weight: bold;font-size: 18px;display: block;
}

.txt_name {
	display: block;padding: 10px 0;
}
/* footer */
footer {
	height: 200px;background: #eee;
}

p {
	line-height: 200px;
}
</style>
</head>
<body>
	<div id="wrap">
		<header>
			<div class="top_header">
				<div class="container">
					<h1>
						<a href="index.jsp"> <span class="blind">EAST-GATE</span> <img
							alt="" src="image/logo7.png">
						</a>
					</h1>
					<ul class="util">
						<li><a href="joinForm.do">회원가입</a></li>
						<li><a href="#">로그인</a></li>
						<li><a href="#">장바구니</a></li>
					</ul>
					<form action="" class="search_form">
						<input type="text" class="search_txt" placeholder="상품검색">
						<input type="submit" value="검색">
					</form>
				</div>
			</div>
			<nav class="gnb_wrap">
				<div class="container">
					<ul class="gnb">
						<li><a href="#">패션의류/잡화</a>
							<ul class="g1">
								<a href="#" style="font-size: 16px;">여성</a>
								<li><a href="#">티셔츠</a></li>
								<li><a href="#">블라우스/셔츠</a></li>
								<li><a href="#">원피스/세트류</a></li>
								<li><a href="#">바지/레깅스</a></li>
								<li><a href="#">스커트/치마</a></li>
								<li><a href="#">니트류/조끼</a></li>
								<li><a href="#">맨투맨/후드집업</a></li>
								<li><a href="#">아우터</a></li>
								<li><a href="#">패션운동복</a></li>
								<li><a href="#">비키니/비치웨어</a></li>
								<li><a href="#">속옷/잠옷</a></li>
								<li><a href="#">신발</a></li>
								<li><a href="#">가방/잡화</a></li>
							</ul>
							<ul class="g2">
								<a href="#" style="font-size: 16px;">남성</a>
								<li><a href="#">티셔츠</a></li>
								<li><a href="#">맨투맨/후드티</a></li>
								<li><a href="#">셔츠</a></li>
								<li><a href="#">바지/청바지</a></li>
								<li><a href="#">트레이닝복</a></li>
								<li><a href="#">후드집업/집업류</a></li>
								<li><a href="#">스웨터</a></li>
								<li><a href="#">가디건</a></li>
								<li><a href="#">베스트/조끼</a></li>
								<li><a href="#">아우터</a></li>
								<li><a href="#">속옷/잠옷</a></li>
								<li><a href="#">신발</a></li>
								<li><a href="#">가방/잡화</a></li>
							</ul></li>
						<li><a href="#">스포츠</a>
							<ul class="g3">
								<a href="#" style="font-size: 16px;">여성</a>
								<li><a href="#">언더레이어</a></li>
								<li><a href="#">티셔츠</a></li>
								<li><a href="#">자켓/집업</a></li>
								<li><a href="#">바지</a></li>
								<li><a href="#">요가복</a></li>
								<li><a href="#">등산의류</a></li>
								<li><a href="#">골프의류</a></li>
								<li><a href="#">스키/보드복</a></li>
								<li><a href="#">수영복/레쉬가드</a></li>
							</ul>
							<ul class="g4">
								<a href="#" style="font-size: 16px;">남성</a>
								<li><a href="#">언더레이어</a></li>
								<li><a href="#">티셔츠</a></li>
								<li><a href="#">자켓/집업</a></li>
								<li><a href="#">바지</a></li>
								<li><a href="#">요가복</a></li>
								<li><a href="#">등산의류</a></li>
								<li><a href="#">골프의류</a></li>
								<li><a href="#">스키/보드복</a></li>
								<li><a href="#">수영복/레쉬가드</a></li>
							</ul>
							<ul class="g5">
								<a href="#" style="font-size: 16px;">신발</a>
								<li><a href="#">런닝화</a></li>
								<li><a href="#">운동화</a></li>
								<li><a href="#">스포츠샌들</a></li>
								<li><a href="#">슬리퍼</a></li>
								<li><a href="#">아쿠아슈즈</a></li>
								<li><a href="#">등산화</a></li>
								<li><a href="#">골프화</a></li>
								<li><a href="#">축구화</a></li>
							</ul>
							<ul class="g6">
								<a href="" style="font-size: 16px;">잡화</a>
								<li><a href="#">가방/파우치</a></li>
								<li><a href="#">모자/장갑</a></li>
								<li><a href="#">양말/타이즈</a></li>
								<li><a href="#">팔토시/방한워머</a></li>
								<li><a href="#">마스크/넥워머</a></li>
								<li><a href="#">시계</a></li>
								<li><a href="#">보호대/아대</a></li>
								<li><a href="#">악세서리</a></li>
							</ul></li>
						<li><a href="#">뷰티</a>
							<ul class="g7">
								<a href="" style="font-size: 16px;">뷰티</a>
								<li><a href="#">클랜징/필링</a></li>
								<li><a href="#">메이크업</a></li>
								<li><a href="#">향수</a></li>
								<li><a href="#">남성화장품</a></li>
								<li><a href="#">네일</a></li>
								<li><a href="#">뷰티소품</a></li>
								<li><a href="#">헤어</a></li>
								<li><a href="#">바디</a></li>
							</ul></li>
						</li>
						<li><a href="#">식품</a>
							<ul class="g8">
								<a href="#" style="font-size: 16px;">건강식품</a>
								<li><a href="#">건강즙</a></li>
								<li><a href="#">비타민/미네랄</a></li>
								<li><a href="#">영양제</a></li>
								<li><a href="#">헬스보충식품</a></li>
								<li><a href="#">다이어트식품</a></li>
								<li><a href="#">견과/건과</a></li>
								<li><a href="#">영양식/선식</a></li>
								<li><a href="#">건강차</a></li>
							</ul></li>
						<li><a href="#">가전디지털</a>
							<ul class="g9">
								<a href="" style="font-size: 16px;">가전디지털</a>
								<li><a href="">공기청정기</a></li>
								<li><a href="">다리미/재봉/보풀</a></li>
								<li><a href="">비데/온수기</a></li>
								<li><a href="">전동칫솔</a></li>
								<li><a href="">학습용 스탠드</a></li>
								<li><a href="">안마/찜질기</a></li>
								<li><a href="">건강측정/의료기</a></li>
								<li><a href="">살균/소독기</a></li>
								<li><a href="">손건조기</a></li>
							</ul></li>
					</ul>
				</div>
			</nav>
		</header>
		<main>
			<div class="main_visual">
				<div class="container">
					<div class="slider_wrap">
						<div class="slider">
							<ul>
								<li><img src="image/visual1.png" alt="후기쓰고 상품 받자"></li>

							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="product1">
				<div class="container">
					<h2>추천상품</h2>
					<div class="contents">
						<div class="box">
							<ul>
								<li><a href="#"><img src="image/1.jpg" alt="#"> <span
										class="txt_name">상품명1</span> <span class="txt_price">가격</span>
								</a></li>
								<li><a href="#"><img src="image/2.jpg" alt="#"> <span
										class="txt_name">상품명2</span> <span class="txt_price">가격</span>
								</a></li>
								<li><a href="#"><img src="image/3.jpg" alt="#"> <span
										class="txt_name">상품명3</span> <span class="txt_price">가격</span>
								</a></li>
								<li><a href="#"><img src="image/4.jpg" alt="#"> <span
										class="txt_name">상품명4</span> <span class="txt_price">가격</span>
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="product1">
				<div class="container">
					<h2>인기상품</h2>
					<div class="contents">
						<div class="box">
							<ul>
								<li><a href="#"><img src="image/1.jpg" alt="#"> <span
										class="txt_name">상품명1</span> <span class="txt_price">가격</span>
								</a></li>
								<li><a href="#"><img src="image/2.jpg" alt="#"> <span
										class="txt_name">상품명2</span> <span class="txt_price">가격</span>
								</a></li>
								<li><a href="#"><img src="image/3.jpg" alt="#"> <span
										class="txt_name">상품명3</span> <span class="txt_price">가격</span>
								</a></li>
								<li><a href="#"><img src="image/4.jpg" alt="#"> <span
										class="txt_name">상품명4</span> <span class="txt_price">가격</span>
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</main>
		<footer>
			<div class="container">
				<p class="copyright">Copyright©.All rights reserved by EAST-GATE</p>
			</div>
		</footer>
	</div>
</body>
</html>



