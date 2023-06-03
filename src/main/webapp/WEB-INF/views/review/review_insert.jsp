<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/mainstyle.css">
    <style>
        #review-insertBox{
            width: 80%;
            margin: 8% auto;
        }

        #review-insertForm{
            width: 80%;
            margin: 20px auto;
        }

        #review_comment{
            width: 100%;
            border: none;
            border-top: 1px solid #333333;
            border-bottom: 1px solid #333333;
        }

        #score{
            float: left;
            margin: 15px 10px;
            font-size: 16px;
        }

        #review-btns{
            width: 80%;
            margin: 45px auto;
        }

        #review-btns button{
            width: 100px;
            height: 40px;
            float: right;
            margin-right: 10px;
        }

        #review-insertBtn{
            background-color: #cad300;
            border: none;
            border-radius: 15px;
        }

        #review-homeBtn{
            border: none;
            border-radius: 15px;
        }
    </style>
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

            <div id="review-insertBox">
                <h2>Review Insert</h2>
                <hr>
                <div id="review-insertForm">
                    <input type="hidden" id="product_name" value="${product_name}">
                    <label for="score">
                        <select id="score">
                            <option value="0">평점</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </label>
                    <label>
                        <textarea name="comment" id="review_comment" cols="80" rows="10"></textarea>
                    </label>
                </div>
                <div id="review-btns">
                    <button type="button" id="review-insertBtn" onclick="insert()">등록하기</button>
                    <button type="button" id="review-homeBtn" onclick="location.href='/'">홈으로</button>
                </div>
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
<script>
    const $ = (val) => document.querySelector(val);
    function insert(){
        alert('실행');

        let data = {
            user_no : ${user.user_no},
            product_name : $('#product_name').value,
            review_comment : $('#review_comment').value,
            review_score : $('#score').value
        }
        
        const xhttp = new XMLHttpRequest();
        xhttp.onload = function () {
            let data = this.responseText
            if (data == 1){
                alert('작성되었습니다.')
                location.href='/payment/paymentList.do?user_id=${user.user_id}';
            } else {
                alert('작성중 오류가 발생하였습니다.')
            }
        }

        xhttp.open('post','/review/insertReview.do',true);
        xhttp.setRequestHeader("Content-type", "application/json");
        xhttp.send(JSON.stringify(data));
    }
</script>
</body>

</html>
