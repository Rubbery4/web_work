<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String id = (String)session.getAttribute("id");
int num = Integer.parseInt(request.getParameter("num"));
CafeDto dto = CafeDao.getInstance().getData(num);
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
		<h1>게시글 목록 입니다</h1>
		<a href="list.jsp">글 목록</a>
		<%-- 글 작성자와 로그인된 아이디와 같을때만 수정 링크 출력하기 --%>
		<%if(dto.getWriter().equals(id)) { %>
			<a href="private/updateform.jsp?num=<%=dto.getNum()%>">수정</a>
		<%} %>
		<%if(dto.getWriter().equals(id)) { %>
			<a href="private/delete.jsp?num=<%=dto.getNum()%>">삭제</a>
		<%} %>
		<table>
			<tr>
				<th>글번호</th>
				<td><%=dto.getNum() %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><%=dto.getWriter() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><%=dto.getTitle() %></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><%=dto.getContent() %></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td><%=dto.getViewCount() %></td>
			</tr>
			<tr>
				<th>등록일</th>
				<td><%=dto.getRegdate() %></td>
			</tr>
		</table>
	</div>
</body>
</html>