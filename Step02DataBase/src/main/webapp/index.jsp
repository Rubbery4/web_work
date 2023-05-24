<%@page import="test.util.DBcpBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
</head>
<body>
	<div class="container">
		<h1>인덱스 페이지 입니다.</h1>
		<ul>
			<li><a href="member/list.jsp">회원 목록보기</a></li>
			<li><a href="todo/list.jsp">할일 목록보기</a></li>
			<li><a href="guest/list.jsp">방명록 목록보기</a></li>	
		</ul>
	</div>
</body>
</html>