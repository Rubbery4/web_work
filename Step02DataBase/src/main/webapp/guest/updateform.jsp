<%@page import="test.guest.dao.GuestDao"%>
<%@page import="test.guest.dto.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

int num = Integer.parseInt(request.getParameter("num"));

GuestDto dto=GuestDao.getInstance().getData(num);
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
	<div class="container">
		<h1>회원 정보 수정 양식</h1>
		<form action="update.jsp" method="post">
			<div class="mb-1">
				<input class="visually-hidden" type="text" id="num" name="num" value="<%=dto.getNum() %>" readonly/>
			</div class="mb-1">
			<div>
			<div>
				<label class="form-label" for="writer">작성자</label>
				<input class="form-control" type="text" id="writer" name="writer" value="<%=dto.getWriter() %>"/>
			</div class="mb-1">
			<div >
				<label for="content">내용</label>
				<textarea class="form-control" name="content" id="content" cols="30" rows="10"><%=dto.getContent() %></textarea>
			</div class="mb-3">
			<div>
				<label class="form-label" for="pwd">비밀번호</label>
				<input class="form-control" type="password" id="pwd" name="pwd"/>
			</div class="mb-1">
			<br />
			<div class="text-end">
			<button class="btn btn-outline-primary" type="submit">수정확인</button>
			<button class="btn btn-outline-warning" type="reset">취소</button>
			</div>
		</form>
	</div>
	
</body>
</html>