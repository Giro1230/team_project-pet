<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	 height: 500px;
	margin-left: auto;
	margin-right: auto;
}
input{
	width: 150px; height: 25px;
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
span {
	color: #0A8A8A;
}
.all_assent {
	text-align: center;
	font-size: xx-large;
}
.assent_btn {
	width: 28px; height: 28px;
}
h3 {
margin-top: 50px;
margin-bottom: 50px;
	text-align: center;
}
th {
	font-size: large;
	float: left;
}
td {
	margin-left: 50px;
}
.btns{
margin:0 auto;
padding : 0 auto;
width: 420px;

}
.btn1, .btn2 {
	margin-top: 10px;
	border: none;
	border-radius: 15px;
}
.btn1 {
	width: 200px; height: 50px;
	background: #cad300;
	color: black;
}
.btn2 {
	width: 200px; height: 50px;
	background: #d2d2d2;
	color: black;
}
.chbox {
	width: 20px; height: 20px;
	margin-top: 5px;
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
	margin-top: 100px;
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	<div class="reg2"><img src="/resources/images/reg/회원가입2.JPG"></div>
	</div>
	<hr>
<section>
<h3><span>√</span> 항목은 필수! 입력 항목입니다.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3>

<form name="frm" action="/user/userRegForm.do" method="post">
   <table>
      <tr>
         <th>아이디 <span>√</span></th>
         <td><input type="text" name="user_id" min="6" maxlength="20">
         <input type="button" value="중복확인" onclick="idCheck()">
         <div id="idOk"></div> 
         </td>
      </tr>
      <tr>
         <th>비밀번호<span>√</span></th>
         <td><input type="password" name="user_pw" min="6" maxlength="20"></td>
      </tr>
      <tr>
         <th>비밀번호 확인<span>√</span></th>
         <td><input type="password" name="user_pw_check" >
         <input type="button" value="확인하기" onclick="return pwOk()">
         <div id="pw_check"></div>
         </td>
      </tr>
      <tr>
         <th>이름<span>√</span></th>
         <td><input type="text" name="user_name"></td>
      </tr>
      <tr>
         <th>이메일<span>√</span></th>
         <td><input type="text" name="user_email">@<input type="text" name="user_email2" >
         <select name="user_email3" id="user_emails" onchange="changeEmail()">
         <option value="0">직접입력</option>
         <option value="naver.com">naver.com</option>
         <option value="nate.com">nate.com</option>
         <option value="gmail.com">gmail.com</option>
         </select>
         <div id="email_susin"><p><input type="checkbox" class="chbox" name="user_email_check" value="Y">
         정보메일을 수신하겠습니다.</p></div>
         <p style="font-size: small; margin-top: 5px;">"이메일 수신에 동의하시면 여러가지 할인혜택과 각종 이벤트 정보를 받아보실 수 있습니다."</p>
         <p style="font-size: small; margin-top: 5px;">"회원거입관련, 주문배송관련 등의 메일은 수신동의와 상관없이 모든 회원에게 발송됩니다."</p>
         </td>
      </tr>
      <tr>
         <th>전화번호<span>√</span></th>
         <td><input type="text" name="user_tel" maxlength="3" style="width: 35px;">&nbsp;-
         <input type="text" name="user_tel2" maxlength="4" style="width: 45px;">&nbsp;-
         <input type="text" name="user_tel3" maxlength="4" style="width: 45px;">
         <div id="tel_susin"><p><input type="checkbox" class="chbox" name="user_tel_check" value="Y">
         SMS를 수신하겠습니다.</p></div>
         <p style="font-size: small;">"SMS 수신에 동의하시면 여러가지 할인혜택과 각종 이벤트 정보를 받아보실 수 있습니다."</p>
         <p style="font-size: small;">"회원거입관련, 주문배송관련 등의 SMS은 수신동의와 상관없이 모든 회원에게 발송됩니다."</p>
         </td>
      </tr>
      <tr>
         <th>주소</th>
         <td><input type="text" id="user_post" placeholder="우편번호" name="user_post">
            <input type="button" onclick="post_search()" value="우편번호 찾기"><br>
            <input type="text" id="user_address" placeholder="주소" style="width: 310px;" name="user_address"><br>
            <input type="text" id="user_address_detail" placeholder="상세주소" name="user_address_detail">
            <input type="text" id="user_extraAddress" placeholder="참고항목"></td>
      </tr>
   </table>
   <div class="btns">
   <input class="btn1" type="submit" value="입력완료" onclick="return check()">
   <input class="btn2" type="reset" value="취소하기">
   </div>
</form>
</section>
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

   document.querySelector("input[name='user_email2']").value = document.querySelector("input[name='user_email3']").value;

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
    /////////////////////////아이디 체크/////////////////////////////////////
    function idCheck() {
        if (document.frm.user_id.value == "") {
           alert("아이디를 입력하세요");
           document.frm.user_id.focus();
           return false;
        }
        let param = document.frm.user_id.value;
        const xhttp = new XMLHttpRequest();
        xhttp.onload = function() {
           document.getElementById("idOk").innerHTML = this.responseText;
        }
        xhttp.open("GET", "/user/idOverCheck?id=" + param, true);
        xhttp.send();
     }
    ////////////////////////////비밀번호 확인////////////////////////////////
    function pwOk(){
       if(document.frm.user_pw.value != document.frm.user_pw_check.value){
          document.querySelector("#pw_check").innerHTML = "<span style='color:red';>비밀번호를 다시입력해주세요</span>";
          document.frm.user_pw_check.focus();
          return false;
       }else {
          document.querySelector("#pw_check").innerHTML = "<span style='color:green';>비밀번호 확인성공</span>";
          return true;
       }
    }
    ////////////////////////////이메일 체인지////////////////////////////////
   
   function changeEmail(){
     const email = document.querySelector("input[name='user_email2']").value;
     const cemail = document.querySelector("#user_emails").value;
       if(cemail == "0"){
          document.querySelector("input[name='user_email2']").value = "";
       }else {
          document.querySelector("input[name='user_email2']").value = cemail;
       }
    }
////////////////////////////취소하기///////////////////////////////

   /////////////////////////유효성 검사/////////////////////////////////////
    function check(){
       if(document.frm.user_id.value == ""){
          alert("아이디를 입력해주세요(필수)");
          document.frm.user_id.focus();
          return false;
       }else if(document.frm.user_pw.value == ""){
          alert("비밀번호를 입력해주세요(필수)");
          document.frm.user_pw.focus();
          return false;
       }else if(document.frm.user_pwCheck.value == ""){
          alert("비밀번호 확인을 입력해주세요(필수)");
          document.frm.user_pwCheck.focus();
          return false;
       }else if(document.frm.user_name.value == ""){
          alert("이름을 입력해주세요(필수)");
          document.frm.user_name.focus();
          return false;
       }else if(document.frm.user_email.value == ""){
          alert("이메일을 입력해주세요(필수)");
          document.frm.user_email.focus();
          return false;
       }else if(document.frm.user_email2.value == ""){
          alert("이메일을 입력해주세요(필수)");
          document.frm.user_email2.focus();
          return false;
       }else if(document.frm.user_tel.value == ""){
          alert("전화번호를 입력해주세요(필수)");
          document.frm.user_tel.focus();
          return false;
       }else if(document.frm.user_tel2.value == ""){
          alert("전화번호를 입력해주세요(필수)");
          document.frm.user_tel2.focus();
          return false;
       }else if(document.frm.user_tel3.value == ""){
          alert("전화번호를 입력해주세요(필수)");
          document.frm.user_tel3.focus();
          return false;
       }else{
          return true;
       }
    }
</script>
</body>
</html>