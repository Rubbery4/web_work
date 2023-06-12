<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	// 1. GET 방식 파라미터로 전달되는 삭제할 파일의 글번호 읽어오기
	int num = Integer.parseInt(request.getParameter("num"));
	String id = (String)session.getAttribute("id");
	// 2. DB 에서 삭제하기
	boolean isSuccess = CafeDao.getInstance().delete(num);
	// 3. 응답하기
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
		<%if(isSuccess){%>
			alert("삭제 했습니다.");
			location.href="${pageContext.request.contextPath}/cafe/list.jsp";
		<%} else {%>
			alert("삭제실패")
			location.href="${pageContext.request.contextPath}/cafe/detail.jsp"
		<%} %>
	</script>
</body>
</html>