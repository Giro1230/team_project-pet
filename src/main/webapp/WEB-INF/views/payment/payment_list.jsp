<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	margin: 0;
	padding: 0;
}

header {
	width: 100%;
	height: 100px;
	display: flex;
	justify-content: space-between;
}

div {
	/* border: 1px solid black;*/
	
}

#search {
	display: inline-flex;
	width: 100px;
	height: 30px;
}

.search_btn {
	width: 30px;
	height: 30px;
	background-image: url("/resources/images/main/검색.JPG");
	background-size: contain;
}

#login {
	width: 200px;
	height: 50px;
	margin-right: 50px;
	margin-top: 30px;
	font-family: sans-serif;
}

.lin {
	font-family: Georgia, serif;
	font-size: medium;
}

#logo {
	width: 150px;
	height: 100px;
	text-align: center;
	font-size: small;
	background-image: url("/resources/images/main/logo01.JPG");
	background-size: cover;
	margin-left: 150px;
}

li {
	list-style: none;
}

table {
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
}

.btn {
	text-align: center;
	margin-top: 30px;
}

#demo {
	text-align: center;
}

h1 {
	text-align: center;
	margin-top: 50px;
	margin-bottom: 30px;
}

#top_menu {
	width: 100%;
	height: 50px;
}

li {
	list-style: none;
}

a {
	text-decoration: none;
	font-size: 14px;
}

.menu {
	width: 100%;
	overflow: hidden;
	margin: 0 auto;
}

.menu>li {
	width: 16.66%; /*20*5=100%*/
	float: left;
	text-align: center;
	line-height: 40px;
}

.menu a {
	color: black;
	font-style: italic;
}

.menu>li:hover {
	background-color: #E8F5FF;
	transition-duration: 0.5s;
	border-radius: 15px;
}
.payment_list {
	width: 100%; height: 900px;
	margin-top:20px;

}
.list_top {
	width: 100%; height: 50px;

}
.list_top1,.list_top2,.list_top3,.list_top4,.list_top5,.list_top6,.list_top7 {
	width: 13.5%; height: 50px;
	text-align: center;
	float: left;
	font-size: x-large;
	font-family: sans-serif;
	margin-left: 0.4%;
	

}
.list_box {
	width: 100%; height: 50px;
	margin-top: 15px;

}
.line {
	border: 1px solid black;
}
.list_name, .list_date, .list_no, .list_price, .list_quantity, .list_state,.list_rivew {
	width: 13.5%; height: 50px;
	text-align: center;
	float: left;
	font-size: large;
	margin-left: 0.4%;

}
html, body {
	margin: 0;
	padding: 0;
	height: 105%;
}
#body_wrapper{
  min-height: 100%;
  position: relative;
}
#body_content {
	margin-top: 100px;
	padding-bottom: 150px;;
}
footer {
	width: 100%; height: 150px;;
	position: absolute;
	display: flex;
	justify-content: space-between;
	bottom: 0;
	left: 0;
	border-top: 1px solid #333333;
}
.footer_1 {

	margin-top: 30px;
}
.footer_2 {
	width: 40%; height: 150px;
	padding: 1px 0 1px 30px;
	text-align: center;
	font-family: 'Roboto', 'Notokr Local','Noto Sans KR','Malgun Gothic',sans-serif;
	line-height: 25px;
	font-size: small;
	margin-left: 50px;
	text-align: left;
}
.footer_3 {
	width: 40%; height: 150px;
	padding: 1px 0 1px 30px;
	text-align: center;
	font-family: 'Roboto', 'Notokr Local','Noto Sans KR','Malgun Gothic',sans-serif;
	line-height: 25px;

	font-size: small;
	margin-right: 8%;
	text-align: left;
}
</style>
</head>
<body>
<div id="body_wrapper">
<div id="body-content">
	<c:if test="${user.user_id != null }">
		<header>

			<div id="search">
				<li><input type="hidden" name="search_text"></li>
				<li><button class="search_btn" onclick="search_on()"></button></li>
			</div>

			<div id="logo" onclick="location.href='/'"></div>


			<div id="login">
				${user.user_id }님 반갑습니다! <a href="/user/userLogout.do" class="lin">logout</a>||
				<a href="/user/user_MyPage" class="lin">mypage</a>|| <a
					href="/cart/cart_list.do?user_no=${user.user_no }" class="lin">cart</a>
				<a href="/board/boardForm">QnA</a>
			</div>
		</header>
	</c:if>


	<c:if test="${user.user_id == null }">
		<header>

			<div id="search">
				<li><input type="hidden" name="search_text"></li>
				<li><button class="search_btn" onclick="search_on()"></button></li>
			</div>

			<div id="logo" onclick="location.href='/'"></div>

			<div id="login">
				<a href="/user/user_login" class="lin">login</a>|| <a
					href="/user/user_Regassent" class="lin">join</a>|| <a
					href="/cart/cart_list.do?user_no=${user.user_no }" class="lin">cart</a>
			</div>
		</header>
	</c:if>
		<div id="top_menu">
		<ul class="menu">
			<li><a href="/product/productTagvalList.do?tagval=1">사료/간식</a></li>
			<li><a href="/product/productTagvalList.do?tagval=2">영양제</a></li>
			<li><a href="/product/productTagvalList.do?tagval=3">장난감/훈련용품</a></li>
			<li><a href="/product/productTagvalList.do?tagval=4">하우스</a></li>
			<li><a href="/product/productTagvalList.do?tagval=5">미용/목용용품</a></li>
			<li><a href="/product/productTagvalList.do?tagval=6">위생/배변</a></li>
		</ul>	

		
	<hr>
<h1>주문 목록</h1>
<hr>
<div class="payment_list">
<div class="list_top">
	<div class="list_top1">상품정보</div>
	<div class="list_top2">주문일자</div>
	<div class="list_top3">주문번호</div>
	<div class="list_top4">주문금액</div>
	<div class="list_top5">주문수량</div>
	<div class="list_top6">주문상태</div>
	<div class="list_top7">리뷰쓰기</div>
</div>
<div class="line"></div>
<c:forEach var="ls" items="${paymentList }">

<div class="list_box">
	<div class="list_name">${ls.payment_name }</div>
	<div class="list_date">${ls.payment_date }</div>
	<div class="list_no">${ls.payment_no }</div>
	<div class="list_price">${ls.payment_price }</div>
	<div class="list_quantity">${ls.payment_quantity }</div>
	<div class="list_state">${ls.payment_state }</div>
	<div class="list_rivew"><button onclick="hrefReview(${ls.payment_name})">리뷰쓰기</button></div>
</div>
<hr>
</c:forEach>
</div>
		</div>
		</div>
	<footer>
	<hr>
	<div class="footer_1" style="index='9999'"><img src="/resources/images/footer.JPG" style="width:90px; height:90px;"></div>
	<div class="footer_2"><br>
		<p>회사명: 주식회사 사주시개   |   대표이사: YPL   |   주소: 서울특별시 종로구 동숭길 111-100 사주빌딩 (시개동)</p>
		<p>사업자등록번호 : 111-22-3333   |   통신판매업신고번호 : 제2023-서울강남-0306호</p>
		<p>개인정보보호책임자 : YPL (YPL@sajura.com)|</p>
	</div>
	<div class="footer_3"><br>DELIVERY INFO
반품주소 : CJ 배송상품 - (13019) 경기도 하남시 하사창동 춘궁로91번길 36 슈펫<br>
로젠 배송 상품 - (03084)서울특별시 종로구 동숭길 130-5 무애빌딩 1층 슈펫<br>
배송조회1 : CJ대한통운 1588-1255</div>
	</footer>
	<script>
		function hrefReview(value) {
			location.href='/review/review_insert?product_name=' + value;
		}
	</script>
</body>
</html>