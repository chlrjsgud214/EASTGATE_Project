<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<script src="js/main.js" charset="utf-8"></script>
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/main.css">

</head>
<body>
	<div id="wrap">
		<header>
			<div class="top_header">
				<div class="container">
					<h1>
						<a href="mmain.do"> <span class="blind">EAST-GATE</span> <img
							alt="" src="image/logo7.png">
						</a>
					</h1>
					<ul class="util">
						<li><a href="mypageForm.do">마이페이지</a></li>
						<li><a href="#">문의내역</a></li>
						<li><a href="cartList.do">장바구니</a></li>
						<li><a href="productForm.do">제품등록 - 시연용</a></li>
						<li><a href="productlist.do">제품리스트 - 시연용</a></li>
						<li><a href="logout.do">로그아웃</a></li>
					</ul>
					<form action="" class="search_form">
						<input type="text" class="search_txt" placeholder="상품검색">
						<input type="submit" value="검색">
					</form>
				</div>
			</div>
			<nav class="gnb_wrap">
				<div class="container">
					<nav id="main_menu">
				        <ul class="list_gnb">
				            <li><a href="#">패션의류/잡화</a>
				                <div id="mega-menu">
				                    <ul class="list_lnb">
				                        <li><a href="#">여성</a></li>
				                        <li><a href="#">티셔츠</a></li>
				                        <li><a href="#">블라우스/셔츠</a></li>
										<li><a href="#">블라우스/셔츠</a></li>
										<li><a href="#">원피스/세트류</a></li>
										<li><a href="#">바지/레깅스</a></li>
										<li><a href="#">스커트/치마</a></li>
										<li><a href="#">니트류/조끼</a></li>
				                    </ul>
				                    <ul class="list_lnb">
				                        <li><a href="#">여성</a></li>
										<li><a href="#">아우터</a></li>
										<li><a href="#">패션운동복</a></li>
										<li><a href="#">비키니/비치웨어</a></li>
										<li><a href="#">속옷/잠옷</a></li>
										<li><a href="#">신발</a></li>
										<li><a href="#">가방/잡화</a></li>
				                    </ul>
				                    <ul class="list_lnb">
				                        <li><a href="#">남성</a></li>
				                        <li><a href="#">티셔츠</a></li>
										<li><a href="#">맨투맨/후드티</a></li>
										<li><a href="#">셔츠</a></li>
										<li><a href="#">바지/청바지</a></li>
										<li><a href="#">트레이닝복</a></li>
										<li><a href="#">후드집업/집업류</a></li>
				                    </ul>
				                    <ul class="list_lnb">
				                    	<li><a href="#">남성</a></li>
										<li><a href="#">스웨터</a></li>
										<li><a href="#">가디건</a></li>
										<li><a href="#">베스트/조끼</a></li>
										<li><a href="#">아우터</a></li>
										<li><a href="#">속옷/잠옷</a></li>
										<li><a href="#">신발</a></li>
										<li><a href="#">가방/잡화</a></li>
				                    </ul>
				                </div>
				            </li>
				            <li><a href="#">스포츠</a>
				                <div id="mega-menu">
				                    <ul class="list_lnb">
				                        <li><a href="#">여성</a></li>
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
				                    <ul class="list_lnb">
				                        <li><a href="#">남성</a></li>
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
				                    <ul class="list_lnb">
				                        <li><a href="#">신발</a></li>
				                        <li><a href="#">런닝화</a></li>
				                        <li><a href="#">운동화</a></li>
				                        <li><a href="#">스포츠샌들</a></li>
				                        <li><a href="#">슬리퍼</a></li>
				                        <li><a href="#">아쿠아슈즈</a></li>
				                        <li><a href="#">등산화</a></li>
				                        <li><a href="#">골프화</a></li>
				                        <li><a href="#">축구화</a></li>
				                    </ul>
				                    <ul class="list_lnb">
				                        <li><a href="#">잡화</a></li>
				                        <li><a href="#">가방/파우치</a></li>
				                        <li><a href="#">모자/장갑</a></li>
				                        <li><a href="#">양말/타이즈</a></li>
				                        <li><a href="#">팔토시/방한워머</a></li>
				                        <li><a href="#">마스크/넥워머</a></li>
				                        <li><a href="#">시계</a></li>
				                        <li><a href="#">보호대/아대</a></li>
				                        <li><a href="#">악세서리</a></li>
				                    </ul>
				                </div>
				            </li>
				            <li><a href="#">뷰티</a>
				                <div id="mega-menu">
				                    <ul class="list_lnb">
				                        <li><a href="#">뷰티</a></li>
										<li><a href="#">클랜징/필링</a></li>
										<li><a href="#">메이크업</a></li>
										<li><a href="#">향수</a></li>
										<li><a href="#">남성화장품</a></li>
										<li><a href="#">네일</a></li>
										<li><a href="#">뷰티소품</a></li>
										<li><a href="#">헤어</a></li>
										<li><a href="#">바디</a></li>
				                    </ul>
				                </div>
				            </li>
				            <li><a href="#">식품</a>
				                <div id="mega-menu">
				                    <ul class="list_lnb">
				                        <li><a href="#">건강식품</a></li>
										<li><a href="#">건강즙</a></li>
										<li><a href="#">비타민/미네랄</a></li>
										<li><a href="#">영양제</a></li>
										<li><a href="#">헬스보충식품</a></li>
										<li><a href="#">다이어트식품</a></li>
										<li><a href="#">견과/건과</a></li>
										<li><a href="#">영양식/선식</a></li>
										<li><a href="#">건강차</a></li>
				                    </ul>
				                </div>
				            </li>
				            <li><a href="#">가전디지털</a>
				                <div id="mega-menu">
				                    <ul class="list_lnb">
				                        <li><a href="#">가전디지털</a></li>
										<li><a href="#">공기청정기</a></li>
										<li><a href="#">다리미/재봉/보풀</a></li>
										<li><a href="#">비데/온수기</a></li>
										<li><a href="#">전동칫솔</a></li>
										<li><a href="#">학습용 스탠드</a></li>
										<li><a href="#">안마/찜질기</a></li>
										<li><a href="#">건강측정/의료기</a></li>
										<li><a href="#">살균/소독기</a></li>
										<li><a href="#">손건조기</a></li>
				                    </ul>
				                </div>
				            </li>
				        </ul>
				    </nav>
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
								<li><img src="image/visual2.png" alt="후기쓰고 상품 받자"></li>
								<li><img src="image/visual3.png" alt="후기쓰고 상품 받자"></li>
							</ul>
						</div>
						<div class="dir_btn">
							<button class="left_btn"><i class="fas fa-chevron-circle-left"></i></button>
							<button class="right_btn"><i class="fas fa-chevron-circle-right"></i></button>
						</div>
					</div>
				</div>
			</div>
			<div class="product1">
				<div class="container">
					<h2>추천상품</h2>
					<button class="more"><i class="fas fa-plus"></i></button>
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
						<div class="btn">
							<button class="left_btn1"><i class="fas fa-chevron-left"></i></button>
							<button class="right_btn1"><i class="fas fa-chevron-right"></i></button>
						</div>
					</div>
				</div>
			</div>
			<div class="product1">
				<div class="container">
					<h2>인기상품</h2>
					<button class="more"><i class="fas fa-plus"></i></button>
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
						<div class="btn">
							<button class="left_btn1"><i class="fas fa-chevron-left"></i></button>
							<button class="right_btn1"><i class="fas fa-chevron-right"></i></button>
						</div>
					</div>
				</div>
			</div>
		</main>
		<footer>
		<div class="footer_menu">
			<div class="container">
				<ul>
					<li><a href="blist.do">Q&A</a></li>
					<li><a href="#">FAQ</a></li>
					<li><a href="#">상품후기</a></li>
					<li><a href="mnotice.do">공지사항</a></li>
				</ul>
			</div> <!-- .container end -->
		</div> <!-- .footer_menu end -->
		<div class="corp_info">
			<div class="container">
				<img src="image/flogo.png" alt="EastGate">
				<address>
					서울 마포구 신촌로 176 중앙빌딩 501호 <br>
					TEL : 02-1234-1234 / FAX : 02-123-4567 <br>사업자등록번호 : 123-45-67890
				<p class="copyright">Copyright©.All rights reserved by EAST-GATE</p>
				</address>
				<div class="bank_info">
					<h2>무통장 계좌</h2>
					<p>
						<span class="txt_1">1234-56-789012-34</span><br>
						<span class="txt_2">국민은행</span><br>
						<span class="txt_3">예금주 : (주)이스트게이트</span>
					</p>
				</div>
				</div> <!-- corp_info end -->
			</div> <!-- .container end -->
			
		</footer> <!-- footer end -->
	</div>
</body>
</html>



