<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. post 방식으로 전송되는 회원의 이름, 주소를 추출한다.
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
	// 추가할 회원 정보를 MemberDto 객체에 담는다.
		MemberDto dto = new MemberDto();
		dto.setName(name);
		dto.setAddr(addr);
	// 2. DB에 저장한다.
		MemberDao dao = MemberDao.getInstance();
		boolean isSuccess = dao.insert(dto); // 작업의 성공여부가 리턴된다.
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
		<h1>알림</h1>
<% 	// 3. 응답한다.
		if (isSuccess) { %>
		<p>
		<strong><%=name %> 님의 정보가 저장되었습니다.</strong>
		<a href="list.jsp">회원 목록 보기</a>	
		</p>
	<% 	} else { %>
		<p>회원정보 저장 실패
		<a href="insertform.jsp">다시 작성</a>
		</p>
	 <%  }%> 
	</div>
</body>
</html>