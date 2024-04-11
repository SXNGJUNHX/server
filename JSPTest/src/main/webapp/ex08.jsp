<%@page import="com.test.jsp.Myutil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	int a = 10;

	/* public void test() {
		
	} */
	
	/* class Test {
		
	} */

%>    
<%!

	//선언부
	public int b = 20;

/* 
	public int sum(int a, int b) {
		return a + b;
	}
*/	

	//class test
	Myutil myutil = new Myutil();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- ex08.jsp -->
	
	<div>10 + 20 = <%= myutil.sum(10,20) %></div>
	<div>30 + 40 = <%= myutil.sum(30,40) %></div>
	
</body>
</html>












