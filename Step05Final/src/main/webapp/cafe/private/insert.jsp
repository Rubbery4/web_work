<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 제목
	String title = request.getParameter("title");
	// 내용
	String content = request.getParameter("content");
	// 작성자
	String writer = (String)session.getAttribute("id");
	// Dto에 담기
	CafeDto dto = new CafeDto();
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content);
	
	boolean isSuccess = CafeDao.getInstance().insert(dto);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1>알림</h1>
		<%if(isSuccess) { %>
			<p>글 작성 완료</p>	
			<a href="${pageContext.request.contextPath}/cafe/list.jsp">글 목록</a>
		<%} else {%>
			<p>글 작성 실패</p>
			<a href="cafe/list.jsp">글 목록</a>
		<%} %>
		<p></p>
	</div>
</body>
</html>