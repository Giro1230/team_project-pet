<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
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
		.cart-table-buy-button{
			margin: 0 auto;
			width: 50%;
		}

		button{
			border: none;
			font-size: 20px;
			width: 200px;
			height: 50px;
			border-radius: 15px;
		}

		.items{
			margin-top: 30px;
		}

		.items-head{
			border-bottom: 1px solid #333333;
			height: 30px;
		}

		.items-head div{
			float: left;
			margin-left: auto;
			width: 16.2%;
			height: 30px;
			text-align: center;
		}

		.items-body{
			margin-top: 20px;
			clear: none;
			height: 130px;
			border-bottom: 1px solid #333333;
		}

		.items-body :first-line{
			border-top: 1px solid #333333;
		}

		.items-body div{
			float: left;
			width: 16.2%;
			height: 100px;
			text-align: center;
		}

		.items-body div:first-child{
			padding: 0 50% 0 0 ;
		}

		.items-footer{
			float: right;
			margin-top: 20px;
		}

		.items-footer :nth-child(2){
			float: right;
		}

		.items-footer #buttons{
			margin-top: 30px;
		}

		.items-footer #buttons button{
			margin-left: 10px;
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
	
<div class="cart-table-buy-button">
	<div class="items">

		<div class="items-head">
			<div id="items-selectAllButton"><input type="button" id="sub" value="일괄 체크"></div>
			<div id="items-img-head">상품이미지</div>
			<div id="items-name-head">상품이름</div>
			<div id="items-quantity-head">상품수량</div>
			<div id="items-price-head">상품가격</div>
			<div id="items-deleteButton-head">삭제</div>
		</div>

		<c:forEach var="list" items="${list}">
		<div class="items-body">
			<input type="hidden" value="${list.cart_no }">
			<div><input type="checkbox" class="check"></div>
			<div>
				<c:if test="${list.product_tagval == 1 }">
					<img src="/resources/images/feedsnack/${list.product_img }" width="100px" height="100px">
				</c:if>
				<c:if test="${list.product_tagval == 2 }">
					<img src="/resources/images/supplement/${list.product_img }" width="100px" height="100px">
				</c:if>
				<c:if test="${list.product_tagval == 3 }">
					<img src="/resources/images/toystraining/${list.product_img }" width="100px" height="100px">
				</c:if>
				<c:if test="${list.product_tagval == 4 }">
					<img src="/resources/images/house/${list.product_img }" width="100px" height="100px">
				</c:if>
				<c:if test="${list.product_tagval == 5 }">
					<img src="/resources/images/beautybathproducts/${list.product_img }" width="100px" height="100px">
				</c:if>
				<c:if test="${list.product_tagval == 6 }">
					<img src="/resources/images/hygiene/${list.product_img }" width="100px" height="100px">
				</c:if>
			</div>
			<div>${list.product_name }</div>
			<div>${list.cart_quantity }</div>
			<div>${list.product_price }</div>
			<div><input type="button" value="삭제" class="deleteButton"></div>
		</div>
		</c:forEach>
	</div>
	<div class="items-footer">
		<div>
			<p>총 금액</p>
			<p id="totalPrice">0 원</p>
		</div>
		<div id="buttons">
			<button type="button" id="check">결제하기</button>
			<button id="homeButton" onclick="location.href='/'">메인으로</button>
		</div>
	</div>
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



	<script>
		$("#check").on("click",function() {

							alert('${product.img}');
							let chd = $(".check:checked");
							alert(chd.length);

							let names = new Array();
							let prices = new Array();
							let quantitys = new Array();
							let cart_nos = new Array();
							for (let i = 0; i < chd.length; i++) {
								cart_nos
										.push(chd[i].parentElement.previousElementSibling.value);
								names
										.push(chd[i].parentElement.nextElementSibling.nextElementSibling.innerText);
								prices
										.push(chd[i].parentElement.nextElementSibling.nextElementSibling.nextElementSibling.nextElementSibling.innerText);
								quantitys
										.push(chd[i].parentElement.nextElementSibling.nextElementSibling.nextElementSibling.innerText);
							}
							alert(names + prices + quantitys);
							location.href = "/payment/cart?names=" + names
									+ "&prices=" + prices + "&quantitys="
									+ quantitys + '&cart_nos=' + cart_nos;
						});

		/* let chd = document.querySelector("#check");
		chd.addEventListener("click",function check(){
			alert("aaa");
		});
		function check(){
			alert("aaa");
			let chd = document.querySelector("#checkd:checked");
			alert(chd.length);
			//alert(e.target.value); */
		/* 		let arr = $(".check");
		
		 let list = new Array();
		 for(let i = 0; i < arr.length; i++){
		 if(arr[i].checked){	
		
		 }
		 }
		 } */
		 
		 $('.check').change(function () {
				let rowData = [];
				let checkBox = $('input[type="checkbox"]:checked');
				let totalPrice = 0;

				checkBox.each(function(i) {
					let tr = checkBox.parent().parent().eq(i);
					let td = tr.children();


					let  obj = {
						cart_quantity :td.eq(4).text(),
						product_price :td.eq(5).text()
					}

					rowData.push(obj);
					

					obj.cart_quantity = parseInt(obj.cart_quantity.split(",").join(""), 10);
					obj.product_price = parseInt(obj.product_price.split(",").join(""), 10);

					totalPrice += obj.cart_quantity * obj.product_price;
				})
				$('#totalPrice').text(totalPrice + ' 원');
			});
		 
		 $('.deleteButton').click(function (){
				let tr = $(this).parent().parent();
				let td = tr.children();

				let cart_no = td.eq(0).val();

				const xml = new XMLHttpRequest();

				xml.onload = function () {
					let text = this.responseText;
					
					if(text == 1){
						alert('삭제에 성공하였습니다.');
						location.reload();
					} else {
						alert('삭제에 실패하였습니다.');
					}
				}

				xml.open('get','/cart/cart-delete.do?cart_no='+cart_no,true);
				xml.send();
			});
	</script>
</body>
</html>