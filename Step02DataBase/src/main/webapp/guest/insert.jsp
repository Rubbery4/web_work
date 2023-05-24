<%@page import="test.guest.dto.GuestDao"%>
<%@page import="test.guest.dao.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. post 방식으로 전송되는 회원의 이름, 주소를 추출한다.
		request.setCharacterEncoding("utf-8");
		String writer = request.getParameter("writer");
		String pwd = request.getParameter("pwd");
		String content = request.getParameter("content");

		GuestDto dto = new GuestDto();
		dto.setWriter(writer);
		dto.setPwd(pwd);
		dto.setContent(content);
	// 2. DB에 저장한다.
		GuestDao dao = GuestDao.getInstance();
		boolean isSuccess = dao.insert(dto); // 작업의 성공여부가 리턴된다.
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
		<strong><%=writer %> 님의 방명록이 작성되었습니다.</strong>
		<a class="alert-link" href="list.jsp">방명록 목록 보기</a>	
		</p>
	<% 	} else { %>
		<p class="alert alert-warning">방명록 저장 실패
		<a class="alert-link" href="insertform.jsp">다시 작성</a>
		</p>
	 <%  }%> 
</body>
</html>