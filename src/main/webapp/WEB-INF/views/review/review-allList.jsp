<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/review.css">
    <link rel="stylesheet" href="/resources/css/mainstyle.css">
</head>
<body>
<div id="body_wrapper">
    <div id="body-content">
        <div id="body-content">
            <c:if test="${user.user_id != null and user.user_grade != -1}">
                <header>

                    <div id="search">
                        <li><input type="hidden" name="search_text"></li>
                        <li><button class="search_btn" onclick="search_on()"></button></li>
                    </div>

                    <a href="main"><div id="logo"></div></a>

                    <div id="login">
                            ${user.user_id }님 반갑습니다! <a href="/user/userLogout.do" class="lin">logout</a>||
                        <a href="/user/user_MyPage" class="lin">mypage</a>|| <a
                            href="/payment/cart.do?user_no=${user.user_no }" class="lin">cart</a>
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

                    <div id="logo"></div>

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
            </div>

            <div id="review-box">
                <div class="review">
                    <div class="review-userId">아이디</div>
                    <div class="review-productName">물품</div>
                    <div class="review-comment">내용</div>
                    <div class="review-score">평점</div>
                    <div class="review-date">날짜</div>
                    <div class="review-buttons">버튼</div>
                </div>
                <c:forEach var="list" items="${AllList}">
                    <div class="review">
                        <input type="hidden" id="review_no" value="${list.review_no}">
                        <div class="review-userId">${list.user_id}</div>
                        <div class="review-productName">${list.product_name}</div>
                        <div class="review-comment">${list.review_comment}</div>
                        <div class="review-score">${list.review_score}</div>
                        <div class="review-date">${list.review_date}</div>
                        <button type="button" class="review-updateBtn" onclick="clickUpdateBox(${list.review_no})">수정</button>
                        <button type="button" class="review-deleteBtn" onclick="clickDeleteBtn(${list.review_no})">삭제</button>
                    </div>
                    <div class="review-updateBox${list.review_no}" style="display: none">
                        <div class="review-userId${list.review_no}">${list.user_id}</div>
                        <div class="review-productName${list.review_no}">${list.product_name}</div>
                        <div class="review-comment${list.review_no}"><textarea name="comment" cols="30" rows="3">${list.review_comment}</textarea></div>
                        <div class="review-score${list.review_no}">
                            <select name="score">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                        </div>
                        <div class="review-date">${list.review_date}</div>
                        <button type="button" class="review-updateBtn" onclick="clickUpdate(${list.review_no})">수정</button>
                        <button type="button" class="review-displayNone" onclick="clickNoneBox(${list.review_no})">취소</button>
                    </div>
                </c:forEach>
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
        <br>DELIVERY INFO 반품주소 : CJ 배송상품 - (13019) 경기도 사주시 시개동 오일로17번길
        36 사주시개<br> 로젠 배송 상품 - (00003)서울특별시 주시구 사주길 110-02 시개빌딩 1층 사주<br>
        배송조회 : CJ대한통운 1588-1255
    </div>
</footer>
</body>

<script>
    function clickDeleteBtn(value) {
        const review_no = value;
        alert(review_no);

        const xHttp = new XMLHttpRequest();
        xHttp.onload = function () {
            let data = this.responseText;

            if (data == 1){
                alert("삭제 되었습니다.")
                location.reload();
            } else {
                alert("삭제중 오류가 발생하였습니다.")
            }
        }
        xHttp.open("post","/review/delete.do?review_no=" + review_no,true);
        xHttp.send();
    }

    function clickUpdateBox(value) {
        const box = document.querySelector('.review-updateBox'+value);
        box.style.display = 'flex';
    }

    function clickNoneBox(value) {
        const box = document.querySelector('.review-updateBox'+value);
        box.style.display = 'none';
    }

    function clickUpdate(value) {
        let review = {
            review_no : value,
            review_comment : document.querySelector('textarea[name="comment"]').value,
            review_score : document.querySelector('select[name="score"]').value,
        }

        alert(review.review_no);
        alert(review.review_comment);
        alert(review.review_score);

        const xHttp = new XMLHttpRequest();
        xHttp.onload = function () {
            let data = this.responseText;

            if (data == 1){
                alert("수정 되었습니다.")
                location.reload();
            } else {
                alert("수정중 오류가 발생하였습니다.")
            }
        }
        xHttp.open("post","/review/update.do",true);
        xHttp.setRequestHeader("Content-type", "application/json");
        xHttp.send(JSON.stringify(review));

        location.href = "/payment/paymentList.do?user_id=${user.user_id}";
    }
</script>
</html>
