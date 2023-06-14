<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</head>
<body>
	<%--webapp/include/navbar.jsp 페이지 포함 시키기 --%>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="index" name="current"/>
	</jsp:include>
	<div class="container">
		<h1>인덱스 페이지 입니다</h1>
		<ul>
			<li><a href="${pageContext.request.contextPath}/users/signup_form.jsp">회원가입</a></li>
			<li><a href="${pageContext.request.contextPath}/users/loginform.jsp">로그인</a></li>
			<li><a href="${pageContext.request.contextPath}/private/game.jsp">게임하기</a></li>
			<li><a href="${pageContext.request.contextPath}/private/study.jsp">공부하기</a></li>
			<li><a href="file/list.jsp">자료실</a></li>
			<li><a href="file/list2.jsp?pageNum=1">자료실2</a></li>
			<li><a href="test/signup_form.jsp">form 테스트</a></li>
			<li><a href="cafe/list.jsp">글 목록보기</a></li>
		</ul>
	</div>
</body>
</html>