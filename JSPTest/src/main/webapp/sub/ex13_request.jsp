<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<!-- http://localhost:8090/jps/sub/ex13_request.jsp -->
	<!-- ex13_request.jsp -->
	<h1>request > 요청 정보 확인</h1>
	
	<p>요청 URL: <%= request.getRequestURI() %></p>
	<p>요청 서버 도메인: <%= request.getServerName() %></p>
	<p>요청 서버 포트: <%= request.getServerPort() %></p>
	<p>쿼리 문자열: <%= request.getQueryString() %></p>
	<p>요청 방식: <%= request.getMethod() %></p>
	<p>컨텍스트 경로: <%= request.getContextPath() %></p>
	
	<div>
		<a href="./ex12_form.jsp">12번 예제</a>
	</div>
	<div>
		<!-- "/jsp" == "webapp" -->
		<a href="<%= request.getContextPath() %>/ex12_form.jsp">12번 예제</a>
	</div>
	
	<p>클라이언트 주소: <%= request.getRemoteAddr() %></p>
		
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script>
		
	</script>
</body>
</html>