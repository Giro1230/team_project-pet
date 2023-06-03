<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
font-size: 25px;
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
.button {
    top:50%;
    background-color:#acd300;
    border: 1px solid #acd300;
    float: right;
}
h1{
margin-top: 50px;
margin-bottom: 50px;
}
th{
float: left;
}
td{
text-align: center;
}
.buttontwo{
 top:50%;
    background-color:#acd300;
    border: 1px solid #acd300;
}
span{
float: left;
}
.three{
margin-right: 150px;
}
.two{
margin-right: 175px;
}
.four{
margin-right: 125px;
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
	margin-top: 12%;
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
.hr{
 background:#E0EBFF;
    height:3px;
    border:0;
}
.buy_btn{
margin-top: 5%;
margin-right: 20%;
}
.buy_btn1{
margin-left: 21%;
width: 75%;
height: 50px;
border: none;
border-radius: 15px;
background-color : #cad300;

}



</style>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	<section>

<h1 style="text-align: center;">My Page</h1>

		<span class="three" >아이디 :</span>  ${user.user_id }
		<hr class="hr">
		<span class="four">비밀번호 :</span>****** <input type ="button" class="button" onclick="getShow()" value="비밀번호변경">
		<hr class="hr">
		<div id="hide" style="display:none">
		<div id="msg"></div>
		<div id="demo"></div>
		<div id="demo2"></div>
		<hr class="hr">
		</div>
		<span class="two">이름 :</span>${user.user_name }
		<hr class="hr">
		<span class="three">이메일 :</span>${user.user_email }
		<hr class="hr">
		<span class="four">휴대전화 : </span> ${user.user_tel }<input type ="button" class="button" onclick="getShow3()" value="전화번호변경">
		<div id="hide3"  style="display:none">
		<div id="msg3"></div>
         전화번호
         <input type="text" name="user_tel" maxlength="3" style="width: 35px;">-
         <input type="text" name="user_tel2" maxlength="4" style="width: 45px;">-
         <input type="text" name="user_tel3" maxlength="4" style="width: 45px;"><br>
          <input type="button" class="buttontwo" value="변경 " onclick="telChange()" >
         <input type="button"  class="buttontwo" value="취소" onclick="getHide3()">
		</div>
		<hr class="hr">
		<span class="three">배송지 :</span> ${user.user_address } <input type ="button" class="button" onclick="getShow2()" value="배송지 번경">
		<div id="hide2" style="display:none">
         	<div id="msg2"></div>
         주소<br >
         <input type="text" id="user_post" placeholder="우편번호" name="user_post">
            <input type="button"  class="button" onclick="post_search()" value="우편번호 찾기"><br>
            <input type="text" id="user_address" placeholder="주소" style="width: 338px;" name="user_address"><br>
            <input type="text" id="user_address_detail" placeholder="상세주소" name="user_address_detail">
            <input type="text" id="user_extraAddress" placeholder="참고항목"><br>
        <input type="button" class="buttontwo" value="변경" onclick="addressChange()"> <input type="button" class="buttontwo" value="취소" onclick="getHide2()">
        <hr class="hr">
		</div>
		<div class="buy_btn">
     <button class="buy_btn1" onclick="userDelete()">회원 탈퇴</button>
     <button type="button" class="button" onclick="location.href='/review/review-findById.do?user_no=${user.user_no}'">쓴 리뷰보기</button>
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
///////회원 탈퇴///////
function userDelete() {
	const id= '${user.user_id}';
  const xhttp = new XMLHttpRequest();
  xhttp.onload = function() {
	  let data = this.responseText;
	  if(data==1){
 	alert("그동안 이용해주셔서 감사합니다.");
 	location.href="/";		  
	  }else{
		  alert("오류가 발생하였습니다.");
	  }
    }
  xhttp.open("POST", "/user/userdelete.do?id="+id, true);
  xhttp.send();
}


//////////////디브 보여주기////////////////////////
function getShow3(){
	document.getElementById("hide3").style.display = "block";
}

function getShow2(){
	document.getElementById("hide2").style.display = "block";
}

function getShow() {
	document.getElementById("hide").style.display = "block";
	  document.getElementById("demo").innerHTML = "<input type='text'  name='pw' placeholder='현재비밀번호'><br><input type='text'name='cpw' placeholder='변경하실 비밀번호'>"
		  document.getElementById("demo2").innerHTML = "<input type='button' class='buttontwo' value='변경' onclick='changePw()'>"+"&nbsp;"+"<input type='button' class='buttontwo' value='취소' onclick='getHide()'>"
	}
////////////////디브 숨기기 ///////////////////////	
function getHide(){
	document.getElementById("hide").style.display = "none";
}
function getHide2(){
	document.getElementById("hide2").style.display = "none";
}

function getHide3(){
	document.getElementById("hide3").style.display = "none";
}
/////////////////비밀번호 변경////////////////////////
function changePw() {
	const id= '${user.user_id}';
	const pw= document.querySelector("input[name='pw']").value;
	const cpw= document.querySelector("input[name='cpw']").value;
	  const xhttp = new XMLHttpRequest();
	  xhttp.onload = function() {
	    document.getElementById("msg").innerHTML = this.responseText;
	    }
	  xhttp.open("POST", "/user/changePw.do?user_id="+id+"&user_pw="+pw+"&user_cpw="+cpw, true);
	  xhttp.send();
	}	
////////////주소찾기/////////////////////
    function post_search() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("user_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("user_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('user_post').value = data.zonecode;
                document.getElementById("user_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("user_address_detail").focus();
            }
        }).open();
    }
///////////////////주소 변경/////////////

function addressChange() {
	let address =document.querySelector("#user_address").value;
	let detail =document.querySelector("#user_address_detail").value;
	let pos =document.querySelector("#user_post").value;
	const id= '${user.user_id}';
  const xhttp = new XMLHttpRequest();
  xhttp.onload = function() {
    document.getElementById("msg2").innerHTML = this.responseText;
    }
  xhttp.open("POST", "/user/address.do?user_address="+address+"&user_address_detail="+detail+"&user_post="+pos+"&id="+id, true);
  xhttp.send();
}
///////////////번호 변경////////////
function telChange() {
	let tel1 =document.querySelector("input[name='user_tel']").value;
	let tel2 =document.querySelector("input[name='user_tel2']").value;
	let tel3 =document.querySelector("input[name='user_tel3']").value;
	const id= '${user.user_id}';
  const xhttp = new XMLHttpRequest();
  xhttp.onload = function() {
    document.getElementById("msg3").innerHTML = this.responseText;
    }
  xhttp.open("POST", "/user/telchange.do?user_tel="+tel1+"&user_tel2="+tel2+"&user_tel3="+tel3+"&id="+id, true);
  xhttp.send();
}
</script>
</html>