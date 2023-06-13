<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL 반목문</h1>
	<c:forEach var="i" begin="1" end="10">
		<p>안녕 <strong>${i }</strong></p>
	</c:forEach>
</body>
</html>