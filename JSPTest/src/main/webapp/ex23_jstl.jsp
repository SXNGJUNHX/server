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
	
</style>
</head>
<body>
	<!-- ex23_jstl.jsp -->
	<h1>JSTL</h1>
	
	<h2>변수 선언</h2>
	
	<%
		int a = 10; //지역 변수
		pageContext.setAttribute("b", 20); //pageContext 변수
	%>
	
	<!-- JSTL 변수 == pageContext 변수 -->
	<c:set var="c" value="30" /> 
	
	<div>a: <%= a %></div>
	<div>a: ${a}</div>
	
	<div>b: <%= pageContext.getAttribute("b") %></div>
	<div>b: ${b}</div>
	
	<%-- <div>c: <%= c %></div> --%>
	<div>c: ${c}</div>
	<div>c: <%= pageContext.getAttribute("c") %></div>
	
	
	<h2>변수 수정하기</h2>
	<c:set var="c" value="50"></c:set>
	<div>c: ${c}</div>
	
	
	<h2>변수 삭제하기</h2>
	<c:remove var="c"/>
	<div>c: ${empty c}</div>
	
	
	<h2>조건문</h2>
	<c:set var="num" value="-10"/>
	<c:if test="${num > 0}">
		<div>${num}은 양수입니다.</div>
	</c:if>	
	<c:if test="${num <= 0}">
		<div>${num}은 음수입니다.</div>
	</c:if>	
	
	
	<h2>조건문</h2>
	<c:choose>
		<c:when test="${num > 0}">양수</c:when>
		<c:when test="${num < 0}">음수</c:when>
		<c:otherwise>영</c:otherwise>
	</c:choose>
	
	
	<h2>반복문(일반 for + 향상된 for)</h2>
	<% for(int i=0; i<=9; i++){ %>
		<div>숫자: <%= i %></div>
	<%} %>
	
	<!-- 음수 제어가 안된다 -->
	<%-- <c:forEach var="i" begin="9" end="0" step="-1"> --%>
	<c:forEach var="i" begin="0" end="9" step="1">
		<div>숫자: ${i}</div>
	</c:forEach>
	
	<%
	
	String[] names = {"가가가", "나나나", "다다다", "라라라" , "마마마"};
	pageContext.setAttribute("names", names);
	
	%>
	
	<table>
		<tr>
			<th>인덱스</th>
			<th>카운트</th>
			<th>데이터</th>
			<th>첫번째</th>
			<th>마지막</th>
			<td>이름</td>
		</tr>
		<c:forEach var="name" items="${names}" varStatus="status">
			<tr>
				<!-- 0시작 -->
				<th>${status.index}</th>
				<!-- 1시작 -->
				<th>${status.count}</th>
				<th>${status.current}</th>
				<th>${status.first}</th>
				<th>${status.last}</th>
				<td>${name}</td>
			</tr>
		</c:forEach>
	</table>
	
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script>
		
	</script>
</body>
</html>









