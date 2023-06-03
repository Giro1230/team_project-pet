<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/mainstyle.css">
<style>
* {
   margin: 0;
   padding: 0;
}
li {
   list-style: none;
}

a {
   text-decoration: none;
   font-size: 14px;
}
sectionthree {
	text-align: center;
}

.cf {
	display: inline-block;
}

span {
	font-size: 35px;
	font-weight: 600;
	line-height: 1.2;
	color: #cad300;
}

.best {
	width: 100%;
	height: 60px;
	margin-top: 30px;
}

.item_list{
width : 100%;
height : 1100px;
border : 1px solid black;
margin: 0 auto;
}

.st_item:hover {
	border-color: #ADFF2F;
}

.st_item {
	width: 380px;
	height: 450px;
	border: 1px solid #c0c0c0;
	border-radius: 5%;
	text-align: center;
	float : left;
	margin-left : 10px;
	margin-top : 50px;
	
}

.item1_1:hover {
	color: #AFEEEE;
}

.m_item1 {
	width: 350px;
	height: 300px;
	border-radius: 5%;
	margin-left: 15px;
	margin-top: 10px;
}

.item1_1 {
	cursor: pointer;
	margin-top: 20px;
}

a {
	color: #8080c0;
	font-size: x-large;
}

.item1_2 {
	margin-top: 10px;
	font-size: xx-large;
}

img {
	width: 350px;height: 300px;
	border-radius: 5%;
}
.tiq {
	cursor: pointer;
	font-size: 27px;
}
html, body {
	margin: 0;
	padding: 0;
	height: 100%;
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

			<a href="main"><div id="logo"></div></a>

			<div id="login">
				${user.user_id }님 반갑습니다! 
				<a href="/user/userLogout.do" class="lin">logout</a>||
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

			<div id="logo"></div>
			
			<div id="login">
				<a href="/user/user_login" class="lin">login</a>|| <a
					href="/user/user_Regassent" class="lin">join</a>||
					
					<a href="/cart/cart_list.do?user_no=${user.user_no }" class="lin">cart</a>
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
	</div>
	<sectionthree>
	<h1 class="best">
		<a href="/"><span># 미용/</span> [목욕용품]</a>
	</h1>
	<div class="item_list">
		<c:forEach var="ilist" items="${list }">
			<div class="st_item">
				<ul>
					<li class="item1"><div class="m_item1"><img src="/resources/images/beautybathproducts/${ilist.product_img }" style="width: 350px;height: 300px; "></div></li>
					<li class="item1_1"><a href="/product/product_detail.do?product_name=${ilist.product_name }"><span class="tiq">[#]</span>${ilist.product_name }</a></li>
					<li class="item1_2">${ilist.product_price }원</li>
				</ul>
			</div>
		</c:forEach>
		</div>
	</sectionthree>
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
</body>
</html>