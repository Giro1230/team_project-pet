<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
  <head>
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
h1{
text-align: center;
margin-top: 50px;
margin-bottom: 50px;
}
section{
width: 45%;
height: 320px;
margin: 0 auto;


}
span{
width: 30%;
height: 50px;
float:left;

}
.price,.address,.name_tel,.post,.request,.buy_btn{
width: 69%;
height: 50px;
float: right;

}
.buy_btn{

margin-right: 15%;

}
.buy_btn1{
width: 100%;
height: 50px;
margin-top: 15px;
border: none;
border-radius: 15px;
background-color : #cad300;


}
#slt{
	width: 82%; height: 30px;
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
    <script src="https://js.tosspayments.com/v1/payment"></script>
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
			
		<h1>결제하기</h1>
		

    <section>
		<hr>
     <span>총 금액</span><div class="price"> ${totalprice }원</div>
    <span>배송지</span> <div class="address">${user.user_name }님의 집</div>
     <span>이름/연락처</span><div class="name_tel">${user.user_name } | ${user.user_tel }</div>
     <span>주소</span><div class="post">${user.user_address }</div>
    <span>요청사항</span> <div class="request"><select id="slt" onchange="change()">
     	<option >배송 시 요청사항을 선택해주세요</option>
     	<option>부재 시 경비실에 맡겨주세요</option>
     	<option>부재 시 택배함에 넣어주세요</option>
     	<option>부재 시 집 앞에 놔주세요</option>
     	<option>배송 전 연락바랍니다</option>
     	<option>파손의 위험이 있는 상품입니다. 배송 시 주의해주세요</option>
     	<option value="0">직접입력</option>
     </select>
     <input type="hidden" class="hidden_text" >
     </div>
     <button class="buy_btn1" id="payment-button">결제하기</button>
     <div class="buy_btn">
     <c:forEach var="nm" items="${names }">
    	<input type="hidden" class="na" value="${nm }">
     </c:forEach>
     <c:forEach var="qu" items="${quantitys }">
    	<input type="hidden" class="qu" value="${qu }">
     </c:forEach>
     <c:forEach var="pr" items="${prices }">
    	<input type="hidden" class="pr" value="${pr }">
     </c:forEach>
     <c:forEach var="cr" items="${cart_no }">
    	<input type="hidden" class="cr" value="${cr }">
     </c:forEach>
     </div>
    
   
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
    
	  	let name = document.querySelectorAll(".na");
	    let names = new Array();
	    let quantity = document.querySelectorAll(".qu");
	    let quantitys = new Array();
	    let price = document.querySelectorAll(".pr");
	    let prices = new Array();
	    let cart_no = document.querySelectorAll(".cr");
	    let cart_nos = new Array();
	    for(let i=0; i < name.length;i++){
	    	names.push(name[i].value);
	    }
	    for(let i=0; i < quantity.length;i++){
	    	quantitys.push(quantity[i].value);
	    }
	    for(let i=0; i < price.length;i++){
	    	prices.push(price[i].value);
	    }
	    for(let i=0; i < cart_no.length;i++){
	    	cart_nos.push(cart_no[i].value);
	    }
		let user_id = '${user.user_id}';
    const xhttp = new XMLHttpRequest();

    
	  xhttp.onload = function() {
	    data = this.responseText;
	  }
      var clientKey = 'test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq'
      var tossPayments = TossPayments(clientKey)
      var button = document.getElementById('payment-button') // 결제하기 버튼
      button.addEventListener('click', function () {
        tossPayments.requestPayment('카드', {
          amount: ${totalprice},
          orderId: 'yS00-c54JAx-WIoJDsVGa',
          orderName: '${names}',
          customerName: '박토스',
          successUrl: 'http://localhost:8020/payment/payment_success?names=' + names + '&prices=' +prices  + '&quantitys=' + quantitys + '&user_id=' + user_id + "&cart_nos=" + cart_nos,   		  
          failUrl: 'http://localhost:8020/payment/fail',
        })
      })
      
      

      
      function change(){
    	  let slt=document.querySelector("#slt").value;
    	  let hidden_text = document.querySelector(".hidden_text");
		
    	
    	  if(slt==0){
    		 hidden_text.type = "text";
    		 hidden_text.style = "width: 81%;height: 30px; "
    	 }else{
    		 hidden_text.type = "hidden";
    		 hidden_text.value = "";
    		 
    	 }
    	  
      }
    </script>
  </body>
</html>
