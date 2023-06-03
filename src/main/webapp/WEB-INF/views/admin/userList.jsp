<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
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
/*  #logo {
      width: 200px; height: 100px;
      background-image: url('/resources/images/logo.JPG');
      background-size: cover;
      background-position: center;
      margin-left: 140px;
   }*/
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

#top_menu {
	width: 100%;
	height: 50px;
}

li {
	list-style: none;
}

a {
	text-decoration: none;
	font-size: 17px;
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
}

.menu>li:hover .submenu {
	height: auto; /*서브메뉴 li한개의 높이 50*5*/
	transition-duration: 1s;
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
section{

width: 700px;

margin: 0 auto;
}

.content{
width: 400px;
height: 250px;

}
.reply{
margin-top: 20px;
margin-left: 610px;
}
#subsection{
text-align: center;
margin: 0 auto;
}
button {
    top:50%;
    background-color:#acd300;
    border: 1px solid #acd300;
}
table{
width: 40%;
float: right;
margin-right: 27%;
}
th{
width: 100px;
text-align: left;
padding-bottom: 30px;
font-size: x-large;
}
td{
padding-bottom: 10px;
}
h1{
text-align: center;
margin-top: 50px;
margin-bottom: 50px;
font-size: 40px;
}
.hr{
position: absolute;
width: 38%;
 background:#E0EBFF;
    height:3px;
    border:0;
}
footer {
	width: 100%; height: 20px;
	display: flex;
	justify-content: space-between;
	bottom: 0;
	left: 0;
	margin-top: 30%;
	border-top: 1px solid #333333;
}
.footer_1 {

	margin-top: 30px;
}
.footer_2 {
	width: 40%; height: 30px;
	padding: 1px 0 1px 30px;
	text-align: center;
	font-family: 'Roboto', 'Notokr Local','Noto Sans KR','Malgun Gothic',sans-serif;
	line-height: 25px;
	font-size: small;
	margin-left: 50px;
	text-align: left;
}
.footer_3 {
	width: 40%; height: 30px;
	padding: 1px 0 1px 30px;
	text-align: center;
	font-family: 'Roboto', 'Notokr Local','Noto Sans KR','Malgun Gothic',sans-serif;
	line-height: 25px;

	font-size: small;
	margin-right: 8%;
	text-align: left;
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
		<div id="search">
			<input type="hidden" name="search_text">
			<button class="search_btn" onclick="search_on()"></button>
		</div>

		<div id="logo"></div>

		<div id="login">
			${user.user_id }님 반갑습니다! <a href="/user/userLogout.do" class="lin">logout</a><br>
			<a href="/user/user_MyPage" class="lin">mypage</a> || <a
				href="/cart/cart_list.do/${user.user_no}" class="lin">cart</a> || <a
				href="/board/boardlist.do">QnA</a>
		</div>
	</header>
	<div id="top_menu">
		<ul class="menu">
			<li><a href="/product/productTagvalList.do?tagval=1">사료/간식</a>
				</li>
			<li><a href="/product/productTagvalList.do?tagval=2">영양제</a>
				</li>
			<li><a href="/product/productTagvalList.do?tagval=3">장난감/훈련용품</a>
				</li>
			<li><a href="/product/productTagvalList.do?tagval=4">하우스</a>
				</li>
			<li><a href="/product/productTagvalList.do?tagval=5">미용/목용용품</a>
				</li>
			<li><a href="/product/productTagvalList.do?tagval=6">위생/배변</a>
				
		</ul>
		<hr>
	</div>
	<h1>회원 목록</h1>
	<table>
<tr>
<th>ID</th>
<th>PW</th>
<th>NAME</th>
<th>TEL</th>
<th>Email</th>
<th>Adress</th>
<th>Detail</th>
</tr>
 <c:forEach var="list" items="${list }" >
 <tr>
 <td><a href="/admin/admin_Mypage.do?user_id=${list.user_id }" >${list.user_id }</a></td>
 <td>${list.user_pw }</td>
 <td>${list.user_name }</td>
 <td>${list.user_tel }</td>
 <td>${list.user_email}</td>
 <td>${list.user_address }</td>
 <td>${list.user_address_detail}</td>
 </tr>
<tr><td><hr class="hr"></td></tr>
</c:forEach>
</table>

<footer>
		<hr>
		<div class="footer_1">
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
			<br>DELIVERY INFO 반품주소 : CJ 배송상품 - (13019) 경기도 사주시 시개동 오일로17번길
			36 사주시개<br> 로젠 배송 상품 - (00003)서울특별시 주시구 사주길 110-02 시개빌딩 1층 사주<br>
			배송조회 : CJ대한통운 1588-1255
		</div>
	</footer>
<script>

</script>
</body>
</html>