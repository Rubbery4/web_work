<%@page import="test.cafe.dao2.CafeDao2"%>
<%@page import="test.cafe.dao.CafeDao"%>
<%@page import="test.cafe.dto.CafeDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
	CafeDto dto = new CafeDto();
	
	int num = Integer.parseInt(request.getParameter("num"));
	dto.setNum(num);
	
	String title = request.getParameter("title");
	dto.setTitle(title);
	
	String content = request.getParmeter("content");
	dto.setContent(content);
		
 --%>
<jsp:useBean id="dto" class="test.cafe.dto.CafeDto"/>
<jsp:setProperty property="num" name="dto"/>
<jsp:setProperty property="title" name="dto"/>
<jsp:setProperty property="content" name="dto"/>
    
<%
	// 위의 jsp 액션태그로 생성된 CafeDto 객체에 담긴 글 내용을 수정반영하고
	boolean isSuccess = CafeDao2.getInstance().update(dto);
	// 응답하기
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
	<script>
		<%if(isSuccess){%>
			alert("수정 했습니다.");
			location.href="${pageContext.request.contextPath }/cafe/detail.jsp?num=<%=dto.getNum()%>";
		<%} else {%>
			alert("수정실패")
			location.href="updateform.jsp?num=<%=dto.getNum() %>";
		<%} %>
	</script>
</body>
</html>