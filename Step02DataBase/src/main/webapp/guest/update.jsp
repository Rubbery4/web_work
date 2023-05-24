<%@page import="test.guest.dto.GuestDao"%>
<%@page import="test.guest.dao.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 1. 수정할 회원의 번호를 얻어내서
request.setCharacterEncoding("utf-8");
int num = Integer.parseInt(request.getParameter("num"));
String writer = request.getParameter("writer");
String content = request.getParameter("content");
String pwd = request.getParameter("pwd");
// 2. DB 에서 수정하고
GuestDto dto = new GuestDto();
GuestDao dao = GuestDao.getInstance();
dto.setWriter(writer);
dto.setContent(content);
dto.setPwd(pwd);
dto.setNum(num);
boolean isSuccess = dao.update(dto);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<div class="container mt-5">
		<h1>알림</h1>
<% 	// 3. 응답한다.
		if (isSuccess) { %>
		<p class="alert alert-success">
		<strong><%=writer %> 번 회원의 정보가 수정 되었습니다.</strong>
		<a class="alert-link" href="list.jsp">회원 목록</a>	
		</p>
	<% 	} else { %>
		<p class="alert alert-danger">회원정보 수정 실패
		<a class="alert-link" href="list.jsp">회원 목록</a>
		</p>
	 <%  }%> 
</body>
</html>