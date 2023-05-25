<%@page import="test.guest.dto.GuestDto"%>
<%@page import="java.util.List"%>
<%@page import="test.guest.dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 삭제할 회원의 번호를 얻어내서
	request.setCharacterEncoding("utf-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String pwd = request.getParameter("pwd");
	// 2. DB 에서 삭제하고
	GuestDao dao = GuestDao.getInstance();
	boolean isSuccess = dao.delete(num, pwd);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	
		<%if(isSuccess){ %>
		<% 
		String cPath = request.getContextPath();
		response.sendRedirect(cPath+"/guest/list.jsp");
		%>
		<%}else{ %>
			<script>
			alert("비밀번호를 확인해주세요.");
			location.href="${pageContext.request.contextPath }/guest/list.jsp";
			</script>
		<%} %>
	
</body>
</html>