<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
<style>
	html, body {
		overflow: hidden;
	}
</style>
</head>
<body>
	<!-- ex05check.jsp -->
	<h2>아이디 중복검사</h2>
	
	<form method="GET" action="/ajax/ex05check.do">
	<table class="vertical">
		<tr>
			<th style="width: 120px;">아이디</th>
			<td>
				<input type="text" name="id" id="id" class="short" required>
				<input type="submit" value="검사">
			</td>
		</tr>
	</table>
	</form>
	<hr>
	<div>
		<input type="button" value="사용하기" id="btnUse">
		<input type="button" value="창닫기" id="btnClose">
	</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script>
		
	</script>
</body>
</html>










