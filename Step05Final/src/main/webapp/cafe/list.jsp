<%@page import="test.cafe.dto.CafeDto"%>
<%@page import="java.util.List"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<CafeDto> list = CafeDao.getInstance().getList();
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
		<a href="private/insertform.jsp">새글 작성</a>
		<table>
			<thead>
				<tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>조회수</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
			
			<%for(CafeDto tmp:list) { %>
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getWriter() %></td>
					<td>
					<a href="detail.jsp?num=<%=tmp.getNum() %>"><%=tmp.getTitle() %></a>
					</td>
					<td><%=tmp.getViewCount() %></td>
					<td><%=tmp.getRegdate() %></td>
				</tr>
				<%} %>
			</tbody>
		</table>
	</div>
</body>
</html>