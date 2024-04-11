
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//Oracle > select > 회원 정보

	ArrayList<String> names = new ArrayList<String>();
	
	names.add("홍길동");
	names.add("아무개");
	names.add("하하하");
	names.add("호호호");
	names.add("후후후");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
</head>
<body>
	<!-- ex07_script -->
	<h1>회원 목록</h1>
	
	<table>
		<tr>
			<th>번호</th>
			<th>이름</th>
		</tr>
		<% for(int i=0; i<names.size(); i++) {%>
		<tr>
			<th><%= i + 1 %></th>
			<th onclick="info('<%= names.get(i) %>');"><%=names.get(i) %></th>
		</tr>
		<%} %>	
	</table>
	<script>
		function info(name){
			alert(name);
		}
	</script>
</body>
</html>





















