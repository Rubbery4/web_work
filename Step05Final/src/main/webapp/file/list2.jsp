<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

int num = Integer.parseInt(request.getParameter("pageNum"));

FileDao dao = FileDao.getInstance();
List<FileDto> list2 = dao.getList2(num);
// 로그인된 아이디( 로그인이 되어있지 않으면 null)
String id = (String)session.getAttribute("id");


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
		<a href="${pageContext.request.contextPath}/file/private/upload_form.jsp">업로드 하기</a>
		<br />
		<a href="${pageContext.request.contextPath}/file/private/upload_form2.jsp">ajax 업로드 하기</a>
		<h1>자료실 목록입니다.</h1>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>파일명</th>
					<th>등록일</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
			<%for(FileDto tmp:list2) { %>
				<tr>
					<td><%=tmp.getNum() %></td>
					<td><%=tmp.getWriter() %></td>
					<td><%=tmp.getTitle() %></td>
					<td>
					<a href="download.jsp?num=<%=tmp.getNum() %>"><%=tmp.getOrgFileName() %></a>
					</td>
					<td><%=tmp.getRegdate() %></td>
					
					<td>
						<%-- 글 작성자와 로그인된 아이디와 같을때만 삭제 링크 출력하기 --%>
						<%if(tmp.getWriter().equals(id)) { %>
							<a href="delete.jsp?num=<%=tmp.getNum()%>">삭제</a>
						<%} %>
					</td>
				</tr>
				<%} %>
			</tbody>
		</table>
		<ul class="pagination">
			<%for(int i=1; i<=10; i++) { %>
				<li class="page-item">
					<a class="page-link" href="list2.jsp?pageNum=<%=i %>"><%=i %></a>
				</li>
			<%} %>
		</ul>
	</div>
</body>
</html>