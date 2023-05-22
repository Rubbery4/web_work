<%@page import="test.dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.my-table {
	border-collapse:collapse;
}
</style>
</head>
<body>
<%
	List<MemberDto> list=new ArrayList<>();
	list.add(new MemberDto(1, "김구라", "노량진"));
	list.add(new MemberDto(2, "해골", "행신동"));
	list.add(new MemberDto(3, "원숭이", "상도동"));
%>
<h1>회원 목록 입니다.</h1>
<table border="1" class="my-table">
	<tr>
		<th>번호</th>
		<th>이름</th>
		<th>주소</th>
	</tr>
<%for(int i=0; i<list.size(); i++) { %>
	<tr>
		<td><%=list.get(i).getNum()%></td>
		<td><%=list.get(i).getName()%></td>
		<td><%=list.get(i).getAddr()%></td>
	</tr>
<%} %>
</table>
</body>
</html>