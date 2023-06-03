<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>로그인 페이지</h1>
<hr>
<div id="demo"></div>

   <table border="1">
         <tr>
            <th>아이디</th>
            <td><input type="text" name="user_id" placeholder="아이디를 입력해주세요"></td>
         </tr>
         <tr>
            <th>비밀번호</th>
            <td><input type="password" name="user_pw" placeholder="비밀번호를 입력해주세요"></td>
         </tr>
   </table>
   <input type="button" value="로그인" onclick="loginCheck()">
   <input type="button" value="아이디찾기" onclick="location.href='/user/user_searchid'">
   <input type="button" value="비밀번호찾기" onclick="location.href='/user/user_searchPw'">


<script>
   function loginCheck(){
      const id = document.querySelector("input[name='user_id']").value;
      const pw = document.querySelector("input[name='user_pw']").value;
      
           const xhttp = new XMLHttpRequest();
           xhttp.onload = function() {
             let data = this.responseText;
            
             if(data == "1"){
                location.href="/";
             }else {
                document.getElementById("demo").innerHTML = "<span style='color:red';>회원정보가 일치하지 않습니다.</span>";
             }
             }
           xhttp.open("POST", "/admin/login.do", true);
           xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
           xhttp.send("id="+id+"&pw="+pw);
   }
   </script>
</body>
</html>