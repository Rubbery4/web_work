<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
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
		<form action="update.jsp" method="post">
         <div>
            <label for="title">제목</label>
            <input type="text" name="title" id="title" value="<%=dto.getTitle() %>" />
         </div>
         <div>
            <label for="content">내용</label>
            <textarea name="content" id="content" cols="30" rows="10"><%=dto.getContent()%></textarea>
         </div>
         <button type="submit">수정확인</button>
         <button type="reset">취소</button>
      </form>  
	</div>
</body>
</html>