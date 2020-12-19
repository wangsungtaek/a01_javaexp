<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"></script>
<style type="text/css"></style>
</head>
<body>
<!-- 
jsp-api.jar, servlet-api.jar 을 lib 폴더안에 위치시킨다.
 -->
<%
	String name="왕성택";
	int age = 25;
	String prod="사과"; // DB에서 가져온 내용은 java로만 초기 할당할 수 있다.
//	index.jsp ==> indexServlet.java(java+html)
//	html로 최종 만들어서 client에 전달
%>
	<h2>이름:<%=name%></h2>
	<h3>html 코드도 개발하고..</h3>
	<h4>나이:<%=age%></h4>
	<h3>물건:<%=prod%></h3>
</body>
</html>