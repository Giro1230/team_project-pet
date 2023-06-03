<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
</head>
<body>
<h1>상품등록</h1>
<hr>
<form name="frm" action="/product/productReg.do" id="frm" enctype="multipart/form-data" method="post">
	<table border="1">
		<tr>
			<th>상품이름</th>
			<td><input type="text" id="product_name" name="product_name" ></td>
		</tr>
		<tr>
			<th>상품가격</th>
			<td><input type="text" id="product_price" name="product_price" ></td>
		</tr>
		<tr>
			<th>상품분류</th>
			<td><input type="text" id="product_tagval" name="product_tagval" ></td>
		</tr>
		<tr>
			<th>상품설명</th>
			<td><input type="text" id="product_content" name="product_content" ></td>
		</tr>
		<tr>
			<th>상품수량</th>
			<td><input type="text" id="product_quantity" name="product_quantity" ></td>
		</tr>
		<tr>
			<th>상품이미지</th>
			<td><input type="file" id="uploadFile" name="uploadFile" multiple></td>
		</tr>
		</table>
			<input type="submit" id="button" value="등록">
		</form>
		<hr>
		<div id="demo"></div>

<script>

</script>

</body>
</html>