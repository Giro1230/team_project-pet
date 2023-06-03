<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.detail {
	width: 80%;
	height: 600px;
	display: flex;
	margin: 0 auto;
	margin-top: 100px;
}

.detail_img {
	width: 30%;
	height: 500px;
}

.detail_content {
	width: 60%;
	height: 600px;
	margin-left: 10%;
}

span {
	width: 400px;
	color: red;
	margin-left: 20px;
	font-size: large;
}

ul {
	margin-left: 0;
	display: flex;
}

li {
	width: 100px;
	font-size: medium;
	list-style: none;
}

h2 {
	width: 100%;
	color: black;
	text-align: center;
}

.sel {
	width: 100%;
	height: 50px;
	margin-top: 15px;
	text-align: center;
}

button {
	width: 100%;
	height: 45px;
	margin-top: 15px;
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


#review-box{
	width: 80%;
	margin: 0 auto;
	background-color: rgba(238, 238, 238, 0.68);
}

#review-box .review:first-child{
	text-align: center;
	font-size: 16px;
	font-weight: bold;
	border-top: 2px solid #333333;
	border-bottom: 2px solid #333333;
}

.review{
	margin: 10px 10px;
	display: flex;
	border-bottom: 1px solid #333333;
}

.review-userId{
	width: 10%;
	text-align: center;
}

.review-img{
	width: 15%;
}

.review-comment{
	width: 55%;
}

.review-score{
	width: 10%;
	text-align: center;
}
.review-date{
	width: 10%;
	text-align: center;
}

html, body {
	margin: 0;
	padding: 0;
	height: 100%;
}

#body_wrapper {
	min-height: 100%;
	position: relative;
}

#body_content {
	margin-top: 100px;
	padding-bottom: 150px;;
}

footer {
	width: 100%;
	height: 150px;;
	display: flex;
	margin-top: 100px;
	justify-content: space-between;
	bottom: 0;
	left: 0;
	border-top: 1px solid #333333;
}

.footer_1 {
	margin-top: 30px;
}

.footer_2 {
	width: 40%;
	height: 150px;
	padding: 1px 0 1px 30px;
	text-align: center;
	font-family: 'Roboto', 'Notokr Local', 'Noto Sans KR', 'Malgun Gothic',
		sans-serif;
	line-height: 25px;
	font-size: small;
	margin-left: 50px;
	text-align: left;
}

.footer_3 {
	width: 40%;
	height: 150px;
	padding: 1px 0 1px 30px;
	text-align: center;
	font-family: 'Roboto', 'Notokr Local', 'Noto Sans KR', 'Malgun Gothic',
		sans-serif;
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
				<div class="detail">
					<div class="detail_img">
						<c:if test="${product.product_tagval == 1 }">
							<img src="/resources/images/feedsnack/${product.product_img }"
								style="width: 100%; height: 500px;">
						</c:if>
						<c:if test="${product.product_tagval == 2 }">
							<img src="/resources/images/supplement/${product.product_img }"
								style="width: 100%; height: 500px;">
						</c:if>
						<c:if test="${product.product_tagval == 3 }">
							<img src="/resources/images/toystraining/${product.product_img }"
								style="width: 100%; height: 500px;">
						</c:if>
						<c:if test="${product.product_tagval == 4 }">
							<img src="/resources/images/house/${product.product_img }"
								style="width: 100%; height: 500px;">
						</c:if>
						<c:if test="${product.product_tagval == 5 }">
							<img
								src="/resources/images/beautybathproducts/${product.product_img }"
								style="width: 100%; height: 500px;">
						</c:if>
						<c:if test="${product.product_tagval == 6 }">
							<img src="/resources/images/hygiene/${product.product_img }"
								style="width: 100%; height: 500px;">
						</c:if>

						<h2>[${product.product_name }]</h2>
					</div>
					<div class="detail_content">
						<ul>
							<li>판매가</li>
							<span>${product.product_price }원</span>
						</ul>
						<hr>
						<ul>
							<li>상태</li>
							<span>판매중</span>
						</ul>
						<hr>
						<ul>
							<li>배송</li>
							<span>택배(주문 시 결제)</span>
						</ul>
						<ul>
							<li></li>
							<span>3,000원(50,000원 이상 무료배송)</span>
						</ul>
						<ul>
							<li>상품정보</li>
							<c:if test="${product.product_content == null }">
								<span>상품정보가 없습니다.</span>
							</c:if>
							<span>${product.product_content }</span>
						</ul>
						<ul>
							<li>브랜드</li>
							<span>사주시개</span>
						</ul>
						<ul>
							<li>판매자</li>
							<span>본사</span>
						</ul>
						<hr>
						<ul>
							<li>상품옵션</li>
						</ul>
						</ul>
						<select class="sel">
							<option>-컬러선택-</option>
							<option>-yellow-</option>
						</select> <select class="sel">
							<option>-사이즈 선택-</option>
							<option>-free-</option>
						</select>
						<hr>
						<c:if test="${user.user_id != null}">
							<ul>
								<li>총상품 금액</li>
								<span><div id="demo"></div></span>
								<li>수량</li>
								<input type="number" id="quantity" min="1"
									max="${product.product_quantity }" placeholder="0"
									onchange="pp()">
							</ul>
							<button type="button" class="baguni" onclick="cart()">장바구니</button>
							<button class="gumea">구매하기</button>
						</c:if>
						<c:if test="${user.user_id == null}">
							<button type="button" class="baguni"
								onclick="location.href='/user/user_login'">로그인 하러가기</button>
							<button class="gumea"
								onclick="location.href='/user/user_Regassent'">회원가입
								하러가기</button>
						</c:if>
					</div>
				</div>
				<c:if test="${review != null}">
					<div id="review-box">
						<div class="review">
							<div class="review-userId">아이디</div>
							<div class="review-img">이미지</div>
							<div class="review-comment">내용</div>
							<div class="review-score">평점</div>
							<div class="review-date">날짜</div>
						</div>
						<c:forEach var="list" items="${review}">
							<div class="review">
								<div class="review-userId">${list.user_id}</div>
								<div class="review-img">${list.review_img}</div>
								<div class="review-comment">${list.review_comment}</div>
								<div class="review-score">${list.review_score}</div>
								<div class="review-date">${list.review_date}</div>
							</div>
						</c:forEach>
					</div>
				</c:if>
			</div>
		</div>
	</div>

	<footer>
		<hr>
		<div class="footer_1" style="">
			<img src="/resources/images/footer.JPG"
				style="width: 90px; height: 90px;">
		</div>
		<div class="footer_2">
			<br>
			<p>회사명: 주식회사 사주시개 | 대표이사: YPL | 주소: 서울특별시 종로구 동숭길 111-100 사주빌딩
				(시개동)</p>
			<p>사업자등록번호 : 111-22-3333 | 통신판매업신고번호 : 제2023-서울강남-0306호</p>
			<p>개인정보보호책임자 : YPL (YPL@sajura.com)|</p>
		</div>
		<div class="footer_3">
			<br>DELIVERY INFO 반품주소 : CJ 배송상품 - (13019) 경기도 하남시 하사창동 춘궁로91번길
			36 슈펫<br> 로젠 배송 상품 - (03084)서울특별시 종로구 동숭길 130-5 무애빌딩 1층 슈펫<br>
			배송조회1 : CJ대한통운 1588-1255
		</div>
	</footer>
	<script>
		const user_noo = null;
	function pp() {
		  const price = document.querySelector("#demo");
		  const total_quantity = document.querySelector("#quantity").value;
		  const total_price = total_quantity * ${product.product_price};
		  price.innerHTML = total_price + "원";
		}

		function cart() {
			alert("aaa");
		  let cart_quantity = document.querySelector("#quantity").value;
		  let product_no = ${product.product_no};
		  let product_name = '${product.product_name}';
		  let product_price = ${product.product_price};
		  let product_tagval = ${product.product_tagval};
		  let product_img = '${product.product_img}';
		   alert(product_no +product_name+product_price);
		   let user_id = '${user.user_id}'; 
		  if (${user.user_no} != null) {
		   let user_no = ${user.user_no};
		  }
		  let url =
		    "/cart/cart_insert.do?cart_quantity=" +
		    cart_quantity +
		    "&user_id=" +
		    user_id +
		    "&product_name=" +
		    product_name +
		    "&product_price=" +
		    product_price +
		    "&product_tagval=" +
		    product_tagval +
		    "&product_img=" +
		    product_img;
		    		    
		  const xhttp = new XMLHttpRequest();
		  xhttp.onload = function () {
		    let data = this.responseText;
		    if(data == 1){
		    	location.href="/cart/cartlist.do?user_id=" + user_id;
		    }
		  };
		  xhttp.open("GET", url, true);
		  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		  xhttp.send();
		}

	</script>
</body>
</html>