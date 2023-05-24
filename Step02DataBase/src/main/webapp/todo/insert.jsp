<%@page import="test.todo.dto.TodoDto"%>
<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. post 방식으로 전송되는 회원의 이름, 주소를 추출한다.
		request.setCharacterEncoding("utf-8");
		String work = request.getParameter("work");
		String state = request.getParameter("state");
	// 추가할 회원 정보를 todoDto 객체에 담는다.
		TodoDto dto = new TodoDto();
		dto.setWork(work);
		dto.setState(state);
	// 2. DB에 저장한다.
		TodoDao dao = TodoDao.getInstance();
		boolean isSuccess = dao.insert(dto); // 작업의 성공여부가 리턴된다.
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta work="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.js delivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<h1>알림</h1>
<% 	// 3. 응답한다.
		if (isSuccess) { %>
		<p>
		<strong><%=work %> 님의 정보가 저장되었습니다.</strong>
		<a href="list.jsp">할일 목록 보기</a>	
		</p>
	<% 	} else { %>
		<p>회원정보 저장 실패
		<a href="insertform.jsp">다시 작성</a>
		</p>
	 <%  }%> 
	</div>
</body>
</html>