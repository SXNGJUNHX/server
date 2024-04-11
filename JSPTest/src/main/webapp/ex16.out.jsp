<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

 	int dan = 5;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
<style>
	
</style>
</head>
<body>
	<!-- ex16.out.jsp -->
	<h1>구구단(스크립틀릿 + 표현식)</h1>
	<%for (int i=1 ; i<=9; i++){ %>
		<div><%= dan %> x <%= i %> = <%= dan*i %></div>
	<%} %>
	
	<h1>구구단(스크립틀릿 + out)</h1>
	
	<% 
		for(int i=1; i<=9; i++){
			out.println(String.format("<div>%d x %d = %d</div>", dan, i ,dan*i));
		}
	%>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script>
		
	</script>
</body>
</html>