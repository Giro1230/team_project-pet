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

li {
	list-style: none;
}

table {
	width: 400px;
	height: 30px;
	margin-left: auto;
	margin-right: auto;
}

th {
	text-align: center;
	display: flex;
}

p {
	font-size: large;
	margin-top: 5px;
}

.reg {
	width: 100%;
	height: 120px;
	margin-top: 30px;
}

.reg1 {
	width: 20%;
	height: 120px;
	float: left;
	font-size: xx-large;
	margin-left: 10%;
	color: #cad300;
}

.reg2 {
	width: 70%;
	height: 120px;
	margin-left: 60%;
}

span {
	font-size: x-large;
	color: #0A8A8A;
}

.assent {
	width: 80%;
	height: 800px;
	text-align: center;
	margin: 0 auto;
	margin-top: 50px;
	font-size: xx-large;
}

.all_assent {
	width: 28px;
	height: 28px;
	margin-top: 10px;
	margin-bottom: 20px;
}

.one_assent {
	margin-top: 5px;
	width: 23px;
	height: 23px;
}

.assent_01 {
	font-size: medium;
	height: 100px;
	width: 500px;
	overflow: auto;
	margin-bottom: 20px;
	border: 1px solid black;
}

.sp {
	font-size: xx-large;
}

.bbtn, .nbtn {
	width: 200px;
	height: 60px;
	border-radius: 15px;
	border: none;
}

.bbtn {
	background: #d2d2d2;
	color: black;
	font-size: xx-large;
}

.nbtn {
	background: #cad300;
	color: black;
	font-size: xx-large;
}

.ent {
	color: gray;
	font-size: large;
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

#body_wrapper {
	min-height: 100%;
	position: relative;
}

#body_content {
	margin-top: 100px;
	padding-bottom: 150px;;
}

footer {
	width: 100%;
	height: 150px;;
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
	width: 40%;
	height: 150px;
	padding: 1px 0 1px 30px;
	text-align: center;
	font-family: 'Roboto', 'Notokr Local', 'Noto Sans KR', 'Malgun Gothic',
		sans-serif;
	line-height: 25px;
	font-size: small;
	margin-left: 50px;
	text-align: left;
}

.footer_3 {
	width: 40%;
	height: 150px;
	padding: 1px 0 1px 30px;
	text-align: center;
	font-family: 'Roboto', 'Notokr Local', 'Noto Sans KR', 'Malgun Gothic',
		sans-serif;
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
					<div class="reg2">
						<img src="/resources/images/reg/회원가입1.JPG">
					</div>
				</div>
				<hr>


				<div class="assent">
					<input class="all_assent" type="checkbox" onchange="all_check()"><span
						class="sp">필수</span> 약관 전체 동의

					<table>
						<tr>
							<th><input type="checkbox" class="one_assent" id="assent01">
							<p>쇼핑몰 이용약관</p>
								<span>(필수)</span></th>
							<th>
								<div class="assent_01">
									여러분을 환영합니다.<br> 사주시개 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본
									약관은 다양한 사주시개 서비스의 이용과 관련하여 사주시개 서비스를 제공하는 사주시개 주식회사(이하 ‘사주시개’)와
									이를 이용하는 사주시개 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 사주시개
									서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다. 사주시개 서비스를 이용하시거나 사주시개 서비스
									회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어
									주의 깊게 살펴봐 주시기 바랍니다.
								</div>
							</th>
						</tr>
						<tr>
							<th><input type="checkbox" class="one_assent" id="assent02">
							<p>개인정보 처리방침</p>
								<span>(필수)</span></th>
							<th>
								<div class="assent_01">개인정보보호법에 따라 사주시개에 회원가입 신청하시는 분께
									수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부
									시 불이익에 관한 사항을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다. 수집하는 개인정보 이용자는
									회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 네이버 서비스를 회원과 동일하게 이용할 수 있습니다.
									이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우,
									사주기개는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.</div>
							</th>
						</tr>
						<tr>
							<th><input type="checkbox" class="one_assent" id="assent03">
							<p>위치기반서비스 이용약관 동의</p>
								<span class="ent">(선택)</span></th>
							<th>
								<div class="assent_01">위치기반서비스 이용약관에 동의하시면, 위치를 활용한 광고 정보
									수신 등을 포함하는 사주시개 위치기반 서비스를 이용할 수 있습니다. 제 1 조 (목적) 이 약관은 사주시개
									주식회사 (이하 “회사”)가 제공하는 위치기반서비스와 관련하여 회사와 개인위치정보주체와의 권리, 의무 및
									책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다. 제 2 조 (약관 외 준칙) 이 약관에 명시되지 않은
									사항은 위치정보의 보호 및 이용 등에 관한 법률, 개인정보보호법, 정보통신망 이용촉진 및 정보보호 등에 관한
									법률, 전기통신기본법, 전기통신사업법 등 관계법령과 회사의 이용약관 및 개인정보처리방침, 회사가 별도로 정한 지침
									등에 의합니다.</div>
							</th>
						</tr>
						<tr>
							<th><input type="checkbox" class="one_assent" id="assent04">
							<p>프로모션 정보 수신 동의</p>
								<span class="ent">(선택)</span></th>
							<th>
								<div class="assent_01">사주시개에서 제공하는 이벤트/혜택 등 다양한 정보를
									휴대전화(사주시개앱 알림 또는 문자), 이메일로 받아보실 수 있습니다. 일부 서비스(별도 회원 체계로 운영하거나
									사주시개 가입 이후 추가 가입하여 이용하는 서비스 등)의 경우, 개별 서비스에 대해 별도 수신 동의를 받을 수
									있으며, 이때에도 수신 동의에 대해 별도로 안내하고 동의를 받습니다.</div>
							</th>
						</tr>
					</table>
					<button class="nbtn" onclick="return next()">확인</button>
					<button class="bbtn" onclick="location.href='/'">취소</button>
				</div>
			</div>
		</div>
	</div>
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
			<br>DELIVERY INFO 반품주소 : CJ 배송상품 - (13019) 경기도 하남시 하사창동 춘궁로91번길
			36 슈펫<br> 로젠 배송 상품 - (03084)서울특별시 종로구 동숭길 130-5 무애빌딩 1층 슈펫<br>
			배송조회1 : CJ대한통운 1588-1255
		</div>
	</footer>

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
		////////////////////////약관 동의 필수 유효성/////////////////////
		function next() {
			const assent01 = document.querySelector("#assent01");
			const assent02 = document.querySelector("#assent02");

			if ((assent01.checked != true) || (assent02.checked != true)) {
				alert("필수! 이용 약관에 동의하셔야 합니다.");
				return false;
			} else {
				location.href = "/user/user_RegForm";
				return true;
			}

		}
		////////////////약관 필수 동의////////////////////////
		function all_check() {

			const assent01 = document.querySelector("#assent01");
			const assent02 = document.querySelector("#assent02");
			const all_assent = document.querySelector(".all_assent");

			if (all_assent.checked == true) {
				assent01.checked = true;
				assent02.checked = true;
			} else {
				assent01.checked = false;
				assent02.checked = false;
			}
		}
	</script>
</body>
</html>