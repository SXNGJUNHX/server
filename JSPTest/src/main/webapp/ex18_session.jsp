<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
<style>
	div > a {
		display: block;
	}
</style>
</head>
<body>
	<!-- ex18_session.jsp -->
	<h1>세션, Session</h1>
	
	<div>
		<a href="ex18_set.jsp">세션값 저장하기</a>
		<a href="ex18_del.jsp">세션값 삭제하기</a>
		<a href="ex18_reset.jsp">세션 초기화하기</a>
		<a href="ex18_interval.jsp">세션 만료 시간 설정하기</a>
	</div>
	
	<hr>
	
	<h2>세션 정보</h2>
	
	<div>
		Session ID: <%= session.getId() %>
	</div>
	<div>
		Session CreationTime: 
		<% 
			Calendar time = Calendar.getInstance();
			time.setTimeInMillis(session.getCreationTime());
			out.println(String.format("%tF %tT", time, time));
		%>
	</div>
	<div>
		Session Max Inactive Interval:
			<%= session.getMaxInactiveInterval() %>
	</div>
	<div>
		Session isNew: <%= session.isNew() %>
	</div>
	<div>
		Session Data: <%= session.getAttribute("data") %>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script>
		
	</script>
</body>
</html>










