<%@page import="java.text.FieldPosition"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
StringBuffer stringBuffer = new StringBuffer();
Date now = new Date();

SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
simpleDateFormat.format(now, stringBuffer, new FieldPosition(0));
%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<style>
* {
	margin: 0;
	padding: 0;
}
html{
height: 800px;
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

section {
	width: 700px;
	margin: 0 auto;
}

.content {
	width: 500px;
	height: 400px;
	margin: 0 auto;
}

.reply {
	margin-top: 20px;
	margin-left: 610px;
}

#subsection {
	text-align: center;
	margin: 0 auto;
}

button {
	top: 50%;
	background-color: #acd300;
	border: 1px solid #acd300;
}

h1 {
	margin-top: 50px;
	margin-bottom: 50px;
	font-size: 40px;
}
input{
border: 1px solid white;
height: 30px;
}

.buy_btn{
margin-top: 5%;
margin-right: 20%;
margin-bottom: 5%;
}
.buy_btn1{
margin-left: 21%;
width: 75%;
height: 50px;
border: none;
border-radius: 15px;
background-color : #cad300;
}
footer {
	width: 100%; height: 90px;
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
	width: 40%; height: 100px;
	padding: 1px 0 1px 30px;
	text-align: center;
	font-family: 'Roboto', 'Notokr Local','Noto Sans KR','Malgun Gothic',sans-serif;
	line-height: 25px;
	font-size: small;
	margin-left: 50px;
	text-align: left;
	border: 1px solid red;
}
.footer_3 {
	width: 40%; height: 100px;
	padding: 1px 0 1px 30xp;
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
			<li><a href="/product/productTagvalList.do?tagval=1">사료/간식</a></li>
			<li><a href="/product/productTagvalList.do?tagval=2">영양제</a></li>
			<li><a href="/product/productTagvalList.do?tagval=3">장난감/훈련용품</a>
			</li>
			<li><a href="/product/productTagvalList.do?tagval=4">하우스</a></li>
			<li><a href="/product/productTagvalList.do?tagval=5">미용/목용용품</a>
			</li>
			<li><a href="/product/productTagvalList.do?tagval=6">위생/배변</a>
		</ul>
		<hr>
	</div>
	<section>
		<div id="subsection">
			<input type="hidden" name="no" id="no" value="${vo.board_no}">
			<h1>
				제목 : <input type="text" name="board_title" placeholder="제목을 입력해주세요">
			</h1>
			작성자 : <input type="text" name="board_writer" value="${user.user_id }"
				readonly> / 작성시간 : <input type="text" name="board_regdate"
				value="<%=stringBuffer%>">
			<hr>
			<div class="content">
				<br> <input type="text" name="board_content"
					style="width: 500px; height: 350px; font-size: 30px;" placeholder="내용을 입력해주세요">
			</div>
				<hr>
			<div class="buy_btn">
     <button class="buy_btn1" onclick="insert()">등록</button>
     </div>
		</div>
	</section>
	
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
			<br>DELIVERY INFO 반품주소 : CJ 배송상품 - (13019) 경기도 사주시 시개동 오일로17번길
			36 사주시개<br> 로젠 배송 상품 - (00003)서울특별시 주시구 사주길 110-02 시개빌딩 1층 사주<br>
			배송조회 : CJ대한통운 1588-1255
		</div>
	</footer>
</body>
<script>
const $ = (val)=>document.querySelector(val);

function insert() {
	 let data = {
	   		 board_title : $("input[name='board_title']").value,
	  	 	 board_writer : $("input[name='board_writer']").value,
	  	 	board_content : $("input[name='board_content']").value,
	   	     board_regdate : $("input[name='board_regdate']").value
	    }
	 let json_data = JSON.stringify(data);
	const xhttp = new XMLHttpRequest();
	  xhttp.onload = function() {
	    let result = this.responseText;
	    if (result ==1){
	    	alert("등록 완료");
	    	location.href="/";
	    }else {
	    	alert("등록 실패");
	    }
   }
	  xhttp.open("POST", "/board/boardinsert.do", true);
	  xhttp.setRequestHeader("Content-type", "application/json");
	  xhttp.send(json_data); 
	}
</script>
</html>