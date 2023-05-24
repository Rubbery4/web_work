<%@page import="java.util.List"%>
<%@page import="test.guest.dto.GuestDao"%>
<%@page import="test.guest.dao.GuestDto"%>
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
</head>
<body>
	<div class="container">
	<h1>방명록 목록</h1>
	<div class="text-end">
		<a href="insertform.jsp">방명록 추가</a>
	</div>
	<%for(GuestDto tmp:list) {%>
	<div>
		<hr size="1" width="2000"/>
		<p><%=tmp.getWriter() %></p>
		<div>
		<p><%=tmp.getContent() %></p>
		</div>
		<div>
		<p><%=tmp.getRegdate() %></p>
		<a href="updateform.jsp?num=<%=tmp.getNum() %>">수정</a>
		<form action="delete.jsp?num=<%=tmp.getNum() %>&pwd=<%=tmp.getPwd() %>" method="get">
			<label for="pwd">비밀번호</label>
			<input class="visually-hidden" type="text" id="num" name="num" value="<%=tmp.getNum() %>" />
			<input type="text" id="pwd" name="pwd"/>
			<button type="submit">삭제</button>
		</form>
		</div>
		<hr size="1" width="2000"/>
	</div>
	<%} %>
	
	
	
	</div>
</body>
</html>