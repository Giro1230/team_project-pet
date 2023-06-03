<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%
  String rno = request.getParameter("rno");
  String content = request.getParameter("content");

  // 받아온 파라미터 값을 이용하여 처리할 작업 수행
  // ...
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="hidden" name="rno" value="<%=rno %>"><input type="hidden" name="cotent" value="<%=content %>">
<form action="/reply/update" method="get">
<textarea id="text" rows="5" cols="50"></textarea>
</form>
 <input type="button" onclick="submit()" value="작성">
</body>
<script>
function submit() {

    var value = "1";

    // 부모창으로 값을 전달
    window.opener.handlePopupResult(value);
    form.submit();
    window.close();
    
  }
</script>
</html>