<%@page import="test.guest.dao.GuestDto"%>
<%@page import="java.util.List"%>
<%@page import="test.guest.dto.GuestDao"%>
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
	<div class="container">
		<h1>알림</h1>
		<%if(isSuccess){ %>
			<p>
				<strong></strong> 방명록 삭제 했습니다.
				<a href="list.jsp">목록보기</a>
			</p>
		<%}else{ %>
			<p>
				삭제 실패!
				<a href="list.jsp">목록보기</a>
			</p>
		<%} %>
	</div>
</body>
</html>