<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// session scope 에 "id" 라는 키값으로 저장된 문자열이 있는지 읽어와 본다.
	String id = (String)session.getAttribute("id");
	// 로그인 했는지 안했는지 확인
%>
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
	<div class="container">
		<%if(id != null){ %>
			<p>
				<a href="${pageContext.request.contextPath }/users/private/info.jsp"><%=id %></a> 님 로그인중...
				<a href="${pageContext.request.contextPath }/users/logout.jsp">로그아웃</a>
			</p>
		<%} %>
		<h1>인덱스 페이지 입니다</h1>
		<ul>
			<li><a href="${pageContext.request.contextPath}/users/signup_form.jsp">회원가입</a></li>
			<li><a href="${pageContext.request.contextPath}/users/loginform.jsp">로그인</a></li>
			<li><a href="${pageContext.request.contextPath}/private/game.jsp">게임하기</a></li>
			<li><a href="${pageContext.request.contextPath}/private/study.jsp">공부하기</a></li>
			<li><a href="file/list.jsp">자료실</a></li>
		</ul>
	</div>
</body>
</html>