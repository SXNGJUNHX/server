<%@page import="com.test.memo.MemoDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.memo.MemoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%

	//1. DB 작업 > select
	//2. 결과셋 > 화면 출력
	
	MemoDAO dao = new MemoDAO();
	
	ArrayList<MemoDTO> list = dao.list();
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Memo</title>
<%@ include file="/inc/asset.jsp" %>	
<style>
	
</style>
</head>
<body>
	<!-- list.jsp -->
	<%@ include file="/inc/header.jsp" %>
	
	<h1>Memo <small>목록보기</small></h1>
	
	<div id="list">
		<% for (MemoDTO dto : list) { %>
		<div class="item">
			<div>메모 내용입니다.</div>
			<div>
				<span>홍길동</span>
				<span>2024-04-04 14:11:58</span>
			</div>
			<div>
				<button type="button" class="edit" onclick="">수정하기</button>
				<button type="button" class="del" onclick="">삭제하기</button>
			</div>
		</div><!-- .item -->
		<% } %>
		
	</div>
	<hr>
	<div>
		<button type="button" class="add" onclick="location.href='/memo/add.jsp';">쓰기</button>
	</div>
	
	<script>
		
	</script>
</body>
</html>










