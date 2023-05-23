<%@page import="test.todo.dao.TodoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		이페이지에 요청이 될때 <a href="delete.jsp?num=x"></a> 형식의 링크를 눌러서
		GET 방식 요청이 되는 것이다.
		따라서 GET 방식 요청 파라미터로 삭제할 회원의 번호가 전달이 된다.
		해당 파라미터를 추출해서 DB 에서 삭제 하면 된다.
	*/
	// 1. 삭제할 회원의 번호를 얻어내서
		request.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(request.getParameter("num"));
	// 2. DB 에서 삭제하고
		TodoDao dao = TodoDao.getInstance();
		boolean isSuccess = dao.delete(num);	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta work="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<h1>알림</h1>
<% 	// 3. 응답한다.
		if (isSuccess) { %>
		<p>
		<strong><%=num %> 할일 정보가 삭제 되었습니다.</strong>
		<a href="list.jsp">할일 목록</a>	
		</p>
	<% 	} else { %>
		<p>회원정보 삭제 실패
		<a href="list.jsp">할일 목록</a>
		</p>
	 <%  }%> 
</body>
</html>