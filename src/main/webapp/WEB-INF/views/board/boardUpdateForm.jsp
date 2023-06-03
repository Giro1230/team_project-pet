<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

section {
	width: 700px;
	margin: 0 auto;
}

.content {
	width: 500px;
	height: 400px;
	margin: 0 auto;
}


#subsection {
	text-align: center;
	margin: 0 auto;
}

.button {
	background-color: #acd300;
	margin-left: 21%;
width: 100%;
height: 50px;
border: none;
border-radius: 15px;
background-color : #cad300;

}
.buy_btn{
display: flex;
margin-top: 5%;
margin-right: 20%;
margin-bottom: 5%;
}

h1{
	margin-top: 50px;
	margin-bottom: 50px;
	font-size: 30px;
}
input{
border: 1px solid white;
height: 30px;
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
			<input type="hidden" name="board_no" value="${vo.board_no }">
			<h1>
				제목 : <input type="text" name="board_title" placeholder="제목을 입력해주세요">
			</h1>
			작성자 : <input type="text" name="board_writer" value="${user.user_id }"
				readonly> / 작성시간 : <input type="text" name="board_regdate"
				value="${vo.board_regdate}" readonly>
			<hr>
			<div class="content">
				<br> <input type="text" id="board_content" name="board_content"
					style="width: 500px; height: 350px; font-size: 30px;" placeholder="${vo.board_content}">
			</div>
				<hr>
			<div class="buy_btn">
     <input type="button" class="button" value="수정" onclick="return check()" ><input type="button" class="button" value="삭제" onclick="return delet()">
     </div>
		</div>
	</section>
	

	

</body>
<script>
function check(){
	if(document.querySelector("input[name='board_title']").value==""){
		alert("제목을 입력해주세요");
		document.frm.board_title.focus();
		return false;
	}else if(document.querySelector("#board_content").value==""){
		alert("내용을 입력해주세요");
		document.frm.board_content.focus();
		return false;
	}
	
	update();
	return true;
}

const $ = (val)=>document.querySelector(val);

function update() {
	 let data = {
			 board_no : $("input[name='board_no']").value,
	   		 board_title : $("input[name='board_title']").value,
	  	 	board_content : $("#board_content").value
	    }
	 let json_data = JSON.stringify(data);
	
	const xhttp = new XMLHttpRequest();
	  xhttp.onload = function() {
	    let result = this.responseText;
	    
	    if(result ==1){
	    	alert("수정 완료");
	    	location.href="/board/boardlist.do";
	    }else {
	    	alert("수정 실패");
	    }
   }
	  xhttp.open("POST", "/board/boardupdate.do", true);
	  xhttp.setRequestHeader("Content-type", "application/json");
	  xhttp.send(json_data); 
	}
	
	
function delet() {
	 alert("aaa");
			let board_no = $("input[name='board_no']").value;
			alert(board_no);
	const xhttp = new XMLHttpRequest();
	  xhttp.onload = function() {
	    let result = this.responseText;
	    alert(result);
	    if(result ==1){
	    	alert("수정 완료");
	    	location.href="/board/boardlist.do";
	    }else {
	    	alert("수정 실패");
	    }
  }
	  xhttp.open("GET", "/board/boarddelete.do?board_no="+board_no, true);
	  //xhttp.setRequestHeader("Content-type", "application/json");
	  xhttp.send(); 
}



</script>
</html>