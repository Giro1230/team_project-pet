<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<link rel="stylesheet" href="/resources/css/mainstyle.css">
	<style>
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
	</style>
</head>
<body>
<c:if test="${user.user_id != null }">
	<header>

		<div id="search">
			<li><input type="hidden" name="search_text"></li>
			<li><button class="search_btn" onclick="search_on()"></button></li>
		</div>

		<div id="logo"></div>

		<div id="login">
				${user.user_id }님 반갑습니다!
			<a href="/user/userLogout.do" class="lin">logout</a><br>
			<a href="/user/user_MyPage" class="lin">mypage</a>
			|| <a href="/cart/cart_list.do/${user.user_no}" class="lin">cart</a>

			|| <a href="/board/boardlist.do">QnA</a>

			<c:if test="${sessionScope.admin != null }">
				<a href="/admin/userList.do" style="font-size: small;">회원 관리</a>
			</c:if>
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
				href="/user/user_RegForm" class="lin">join</a>||
			<c:if test="${sessionScope.admin != null }">
				<a href="/admin/userList.do" style="font-size: small;">회원 관리</a>
			</c:if>
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
			<input type="hidden" value="${list.product_no }">
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
		<p>총 금액</p>
		<p id="totalPrice">0 원</p>
		<div id="buttons">
			<button id="buyButton" onclick="location.href='/payment/payment'">결제하기</button>
			<button id="homeButton" onclick="location.href='/'">메인으로</button>
		</div>
	</div>
</div>
</body>
<script>
	let img = 0;

	function search_on() {
		const search_btn = document.querySelector(".search_btn");
		const text = document.querySelector("input[name='search_text']");

		if (img % 2 == 0) {
			text.type = "text";
			search_btn.style.backgroundImage = "url(resources/images/main/닫기.JPG)";
			search_btn.style.borderRadius = "50%";
		} else {
			text.type = "hidden";
			text.value = "";
			search_btn.style.backgroundImage = "url(resources/images/main/검색.JPG)";
		}
		img++;

	}

	$('.check').change(function () {
		let rowData = [];
		let checkBox = $('input[type="checkbox"]:checked');
		let totalPrice = 0;

		checkBox.each(function(i) {
			let tr = checkBox.parent().parent().eq(i);
			let td = tr.children();


			let  obj = {
				cart_quantity :td.eq(5).text(),
				product_price :td.eq(6).text()
			}

			rowData.push(obj);
			

			obj.cart_quantity = parseInt(obj.cart_quantity.split(",").join(""), 10);
			obj.product_price = parseInt(obj.product_price.split(",").join(""), 10);

			totalPrice += obj.cart_quantity * obj.product_price;
		})
		$('#totalPrice').text(totalPrice + ' 원');
	});
	
	$('#buyButton').click(function () {
		let rowData = [];
		let checkBox = $('input[type="checkbox"]:checked');
		let cart = {
				user_no : ${user.user_no},
				oder : []
				}

		checkBox.each((i) => {
			let tr = checkBox.parent().parent().eq(i);
			let td = tr.children();

			cart.oder.push({ 
				cart_no : td.eq(0).val(),
				product_no : td.eq(1).val(),
				cart_quantity :td.eq(5).text()
			})
		});
		console.log(JSON.stringify(cart));
		
		const xml = new XMLHttpRequest();
		
		xml.open('post','/payment/payment.do',true);
		xml.setRequestHeader('Content-type', 'application/json');
		xml.send(JSON.stringify(cart));
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
</html>