<%@page import="java.util.List"%>
<%@page import="test.guest.dao.GuestDao"%>
<%@page import="test.guest.dto.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	GuestDao dao = GuestDao.getInstance();
	List<GuestDto> list = dao.getList();
%> 
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</head>
	<%--navbar 출력하기 --%>
	<jsp:include page="/include/navbar.jsp">
			<jsp:param value="guest" name="current"/>
		</jsp:include>
<body>
		<div class="container">
		<h1>방명록 목록</h1>
		<div class="text-end">
			<a href="insertform.jsp">방명록 추가</a>
		</div>
		<%for(GuestDto tmp:list) {%>
		<div>
			<hr class="my-2" size="1" width="530"/>
			<p><%=tmp.getWriter() %></p>
			<div>
<pre><%=tmp.getContent() %></pre>
			</div>
			<div>
			<p><%=tmp.getRegdate() %></p>
			<a href="updateform.jsp?num=<%=tmp.getNum() %>">수정</a>
			<form action="delete.jsp?num=<%=tmp.getNum() %>" method="post" id="f1">
				<input class="visually-hidden" type="hidden" id="num" name="num" value="<%=tmp.getNum() %>" />
				<div class="input-group mb-3">
				<input type="password" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요."/>
				<button type="submit">삭제</button>
				</div>
			</form>
			</div>
			<hr class="my-2" size="1" width="530"/>
		</div>
		<%} %>
		</div>
</body>
</html>