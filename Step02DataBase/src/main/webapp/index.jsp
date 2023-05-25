<%@page import="test.util.DBcpBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String cPath = request.getContextPath();
%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>index.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</head>
<body>
	<%-- /include/navbar.jsp 페이지에게 이 부분만 응답하도록 한다. 
		include 되는 jsp 페이지에 파라미터를 전달할수도 있다.
	--%>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="index" name="current"/>
	</jsp:include>
	<div class="container">
		<h1>인덱스 페이지 입니다.</h1>
		<!-- context 경로 -->
		<!--${pageContext.request.contextPath}-->
		<ul>
			<li><a href="${pageContext.request.contextPath}/member/list.jsp">회원 목록보기</a></li>
			<!--<li><a href="todo/list.jsp">할일 목록보기</a></li>-->
			<li><a href="${pageContext.request.contextPath}/guest/list.jsp">방명록 목록보기</a></li>	
		</ul>
	</div>
</body>
</html>