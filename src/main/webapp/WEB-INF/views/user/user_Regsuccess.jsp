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
.reg {
	width: 100%; height: 120px;
	margin-top: 30px;
	
}
.reg1 {
	width: 20%; height: 120px;
	float: left;
	font-size: xx-large;
	margin-left: 10%;
	color: #cad300;
}
.reg2 {
	width: 70%; height: 120px;
	margin-left: 60%;
	
}
li {
   list-style: none;
}
.success {
	width: 480px; height: 250px;
	margin: 0 auto;
	margin-top: 100px;
	background-image: url("/resources/images/reg/회원가입성공.JPG");
}
.btns {
	width: 45%; height: 50px;
	margin: 0 auto;
	margin-top: 50px;
	text-align: center;
}
.login_btn, .main_btn {
	width: 40%; height: 50px;
	border-radius: 15px;
	border: none;
}
.login_btn {
	color:black;
	background-color:  #A0DFE1;
	margin-right: 10px;
}
.main_btn {
	color: black;
	background: #acd300;
	margin-left: 10px;
}
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
	<div class="reg">
	<div class="reg1">회원가입</div>
	<div class="reg2"><img  src="/resources/images/reg/회원가입3.JPG"></div>
	</div>
	<hr>
	
	<div class="success">
	<!-- <img src="resources/images/reg/회원가입성공.JPG"> -->
	</div>
	<div class="btns">
	<button class="login_btn" onclick="location.href='/user/user_login'">로그인</button>
	<button class="main_btn" onclick="location.href='/'">매인</button>
	</div>
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
</body>
</html>