<%@page import="test.guest.dao.GuestDao"%>
<%@page import="test.guest.dto.GuestDto"%>
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
	<script>
		<%if(isSuccess){ %>
		<% 
		String cPath = request.getContextPath();
		response.sendRedirect(cPath+"/guest/list.jsp");
		%>
		<%}else{ %>
			alert("수정 실패");
			location.href="${pageContext.request.contextPath }/guest/updateform.jsp?num=<%=num%>";
		<%} %>
	</script>
</body>
</html>