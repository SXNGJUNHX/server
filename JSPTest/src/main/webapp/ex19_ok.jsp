<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");

	/*  
	
		<form enctype="multipart/form-data">
		- request.getParameter() > 동작 불능
		- request.getParameterValues() > 동작 불능
		
		cos.jar > MultipartRequest 클래스를 request를 대신한다.
		
		MultipartRequest
		1. 기존의 request 객체를 Wrapping한 객체
		2. 파일 업로드 처리 구현
		
	*/

	//String txt = request.getParameter("txt");
	//String num = request.getParameter("num");
	
	//업로드된 파일을 저장할 경로 > 로컬 경로 사용(드라이브명으로 시작)
	//String path = "C:\\class\\code\\server\\JSPTest\\src\\main\\webapp\\files";
	
	String path = application.getRealPath("/files");

	//C:\class\code\server\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSPTest\files
	//System.out.println(path);
	
	//업로드 파일의 최대 크기 지정
	//- 바이트 단위
	int size = 1024 * 1024 * 100; //100MB
	
	
	//변수 선언
	String txt = "";		//문자
	String num = "";		//숫자
	String filename = "";	//첨부파일명
	String orgfilename = "";//첨부파일명
	
	try {
		
		//첨부 파일 > 외부 입출력 > 예외처리 필수
		//MultipartRequest 객체 생성 == 첨부 파일 처리 완료
		MultipartRequest multi = new MultipartRequest(
									request, 	//원래 request
									path,		//업로드 위치
									size,		//최대 크기
									"UTF-8",	//인코딩
									new DefaultFileRenamePolicy()
								);
		
		//일반 데이터 수신
		txt = multi.getParameter("txt");
		num = multi.getParameter("num");
		
		//업로드 파일명
		//- <input type="file" name="attach">
		
		//하드 디스크에 저장될 실제 파일명
		filename = multi.getFilesystemName("attach");
		
		//업로드한 원본 파일명
		orgfilename = multi.getOriginalFileName("attach");
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
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
	<!-- ex19_ok.jsp -->
	<h1>결과</h1>
	
	<div>
		문자: <%= txt %>
	</div>
	<div>
		숫자: <%= num %>
	</div>
	<div>
		파일: <%= filename %>
	</div>
	<div>
		파일: <%= orgfilename %>
	</div>
	
	<h2>파일 다운로드</h2>
	
	<!--  
		장점: 간단함
		단점: 파일명 다를 수 도 있음.
		     브라우저가 가능한 파일은 실행한다.
	-->
	<div>
		<a href="/jsp/files/<%= filename %>"><%= orgfilename %></a>
	</div>
	
	<!--  
		장점: 간단함. 모든 파일을 다운로드
		단점: 파일명 보장X
	-->
	<div>
		<a href="/jsp/files/<%= filename %>" download><%= orgfilename %></a>
	</div>
	
	<!--  
		장점: 무난 처리
		단점: download.jsp 작성 비용 발생
	-->
	<div>
		<a href="download.jsp?filename=<%= filename %>&orgfilename=<%= orgfilename %>"><%= orgfilename %></a>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script>
		
	</script>
</body>
</html>










