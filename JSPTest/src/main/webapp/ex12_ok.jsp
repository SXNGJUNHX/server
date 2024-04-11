<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String width = request.getParameter("width");
	String height = request.getParameter("height");
	String color = request.getParameter("color");
	String txt = request.getParameter("txt");
	int count = Integer.parseInt(request.getParameter("count"));
	
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
	<h1>결과</h1>
	<% for(int i=0; i<count; i++) {%>
	<div style="width:<%= width %>px; height: <%= height %>px; background-color: <%= color %>; border: 1px solid black; margin: 10px;"><%= txt %></div>
	<%} %>
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script>
		
	</script>
</body>
</html>