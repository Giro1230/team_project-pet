<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/mainstyle.css">
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

					<a href="main"><div id="logo"></div></a>

					<div id="login">
						${user.user_id }님 반갑습니다! <a href="/user/userLogout.do" class="lin">logout</a>||
						<a href="/user/user_MyPage" class="lin">mypage</a>|| <a
							href="/cart/cartlist.do?user_id=${user.user_id }" class="lin">cart</a>
						<a href="/board/boardlist.do">QnA</a>
						<a href="/payment/paymentList.do?user_id=${user.user_id }">주문목록</a>
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
							href="/user/user_Regassent" class="lin">join</a>||
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
			<section>
				<div class="w3-content w3-section" style="max-width: 100%">
					<img class="mySlides" src="/resources/images/main/section01.JPG"
						style="height: 450px; width: 100%;"> <img class="mySlides"
						src="/resources/images/main/section02.JPG"
						style="height: 450px; width: 100%;"> <img class="mySlides"
						src="/resources/images/main/section03.JPG"
						style="height: 450px; width: 100%;">
						<img class="mySlides"
						src="/resources/images/main/section04.jpg"
						style="height: 450px; width: 100%;"><img class="mySlides"
						src="/resources/images/main/section05.jpg"
						style="height: 450px; width: 100%;">
				</div>
			</section>
			<sectiontwo>
			<h1 class="best">
				# PRODUCT <span>CF</span>
			</h1>
			<ul>
				<li class="cf"><iframe style="vertical-align: middle;"
						width="450" height="315"
						src="https://www.youtube.com/embed/lQT379Z64fE"
						title="YouTube video player" frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
						allowfullscreen></iframe></li>
				<li class="cf"><iframe style="vertical-align: middle;"
						width="450" height="315"
						src="https://www.youtube.com/embed/iZTDMvDub4c"
						title="YouTube video player" frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
						allowfullscreen></iframe></li>
			</ul>
			</sectiontwo>
			<sectionthree>
			<h1 class="best">
				<span># BEST</span> PRODUCT
			</h1>
			<ul class="item_list">
				<li class="st_item">
					<ul>
						<li class="item1"><div class="m_item1"></div></li>
						<li class="item1_1"><a href="">[슈펫] 프릴햇레인커버</a></li>
						<li class="item1_2">39,000원</li>
					</ul>
				</li>
				<li class="st_item">
					<ul>
						<li class="item2"><div class="m_item2"></div></li>
						<li class="item1_1"><a href="">[슈펫] 햇레인커버</a></li>
						<li class="item1_2">29,000원</li>
					</ul>
				</li>
				<li class="st_item">
					<ul>
						<li class="item3"><div class="m_item3"></div></li>
						<li class="item1_1"><a href="">[슈펫] 강아지슬링백</a></li>
						<li class="item1_2">79,000원</li>
					</ul>
				</li>
				<li class="st_item">
					<ul>
						<li class="item4"><div class="m_item4"></div></li>
						<li class="item1_1"><a href="">[슈펫] 강아지카시트</a></li>
						<li class="item1_2">129,000원</li>
					</ul>
				</li>
			</ul>
			<ul class="item_list2">
				<li class="st_item">
					<ul>
						<li class="item5"><div class="m_item5"></div></li>
						<li class="item1_1"><a href="">[슈펫] 패딩하네스</a></li>
						<li class="item1_2">39,000원</li>
					</ul>
				</li>
				<li class="st_item">
					<ul>
						<li class="item6"><div class="m_item6"></div></li>
						<li class="item1_1"><a href="">[슈펫] 패딩자켓</a></li>
						<li class="item1_2">49,000원</li>
					</ul>
				</li>
				<li class="st_item">
					<ul>
						<li class="item7"><div class="m_item7"></div></li>
						<li class="item1_1"><a href="">[슈펫] 이너레인자켓</a></li>
						<li class="item1_2">69,000원</li>
					</ul>
				</li>
				<li class="st_item">
					<ul>
						<li class="item8"><div class="m_item8"></div></li>
						<li class="item1_1"><a href="">[슈펫] 강아지방석</a></li>
						<li class="item1_2">79,000원</li>
					</ul>
				</li>
				<li></li>
		</div>
		</ul>
		</sectionthree>
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
			<br>DELIVERY INFO 반품주소 : CJ 배송상품 - (13019) 경기도 사주시 시개동 오일로17번길
			36 사주시개<br> 로젠 배송 상품 - (00003)서울특별시 주시구 사주길 110-02 시개빌딩 1층 사주<br>
			배송조회 : CJ대한통운 1588-1255
		</div>
	</footer>
	<script>
		let img = 0;
		function search_on() {
			const search_btn = document.querySelector(".search_btn");
			const text = document.querySelector("input[name='search_text']");

			if (img % 2 == 0) {
				text.type = "text" + "<button>검색</button>";
				search_btn.style.backgroundImage = "url(resources/images/main/닫기.JPG)";
				search_btn.style.borderRadius = "50%";
			} else {
				text.type = "hidden";
				text.value = "";
				search_btn.style.backgroundImage = "url(resources/images/main/검색.JPG)";
			}
			img++;

		}

		///////////////////////////////사진 슬라이드///////////////////////////////////////////
		function next() {
			const section = document.querySelector("#section");
			section.style.backgroundImage = "url(resources/images/main/section02.JPG)"
		}

		var myIndex = 0;
		carousel();

		function carousel() {

			let x = document.getElementsByClassName("mySlides");
			for (let i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			myIndex++;
			if (myIndex > x.length) {
				myIndex = 1
			}
			x[myIndex - 1].style.display = "block";
			setTimeout(carousel, 2000); // Change image every 2 seconds
		}
	</script>
</body>
</html>