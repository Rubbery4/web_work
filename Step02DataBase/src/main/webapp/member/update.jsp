<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 수정할 회원의 번호를 얻어내서
		request.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(request.getParameter("num"));
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
	// 2. DB 에서 수정하고
		MemberDto dto = new MemberDto(num, name, addr);
		MemberDao dao = MemberDao.getInstance();
		boolean isSuccess = dao.update(dto);	
	// 3. 결과를 응답	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container mt-5">
		<h1>알림</h1>
<% 	// 3. 응답한다.
		if (isSuccess) { %>
		<p class="alert alert-success">
		<strong><%=num %> 번 회원의 정보가 수정 되었습니다.</strong>
		<a class="alert-link" href="list.jsp">회원 목록</a>	
		</p>
	<% 	} else { %>
		<p class="alert alert-danger">회원정보 수정 실패
		<a class="alert-link" href="list.jsp">회원 목록</a>
		</p>
	 <%  }%> 
</body>
</html>