<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//POST > 한글 인코딩
	request.setCharacterEncoding("UTF-8");
	
	//request.getParameter()
	//1. 입력하면 > 입력값 반환
	//2. 입력 안하면 > "" 반환
	//3. 컨트롤X, 키 오류 > null 반환
	
	//텍스트 박스
	String txt1 = request.getParameter("txt1");

	System.out.println(txt1 == null);
	System.out.println(txt1 == "");
	
	//암호 상자
	String txt2 = request.getParameter("txt2");
	
	//멀티 텍스트
	String txt3 = request.getParameter("txt3");
	txt3 = txt3.replace("\r\n", "<br>");
	
	//체크 박스
	//1. value 작성 X
	//	- 체크O > "on" 전송
	//	- 체크X > null 전송
	//2. value 작성 O
	//	- 체크O > value 전송
	//	- 체크X > null 전송
	String cb1 = request.getParameter("cb1");
	
	
	//체크 박스들
	String cb2 = request.getParameter("cb2");
	String cb3 = request.getParameter("cb3");
	String cb4 = request.getParameter("cb4");
	
	String temp = "";
	
	temp += cb2 + ",";
	temp += cb3 + ",";
	temp += cb4 + ",";
	
	//체크박스들
	//String cb5 = request.getParameter("cb5");
	String[] cb5 = request.getParameterValues("cb5");
	
	//라디오 버튼
	String rb = request.getParameter("rb");
	
	//셀렉트 박스
	String sel1 = request.getParameter("sel1");
	
	String[] sel2 = request.getParameterValues("sel2");
	
	//히든 태그(=눈에 안보이는 텍스트 박스)
	String id = request.getParameter("id");
	
	//기타 등등
	String regdate = request.getParameter("regdate");
	String color = request.getParameter("color");
	
	String left =  request.getParameter("left");
	String top =  request.getParameter("top");
		
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
<body class="narrow">
	<!-- ex11_ok.jsp -->
	<h1>결과</h1>
	
	<h2>텍스트 박스</h2>
	<div><%= txt1 %></div>
	
	<h2>암호 상자</h2>
	<div><%= txt2 %></div>
	
	<h2>멀티 텍스트</h2>
	<div><%= txt3 %></div>
	
	<h2>체크 박스</h2>
	<div><%= cb1 %></div>
	
	<h2>체크 박스들</h2>
	<div><%= temp %></div>
	
	<h2>체크 박스들</h2>
	<div><%= Arrays.toString(cb5) %></div>
	
	<h2>라디오 버튼</h2>
	<div><%= rb %></div>
	
	<h3>셀렉트 버튼</h3>
	<div><%= sel1 %></div>
	<div><%= Arrays.toString(sel2) %></div>
	
	<h2>히든 태그</h2>
	<div><%= id %></div>
	
	<h2>기타 등등</h2>
	<div style="background-color: <%= color %>;"><%= regdate %></div>
	
	<div><%= left %></div>
	<div><%= top %></div>
	
	
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script>
		
	</script>
</body>
</html>










