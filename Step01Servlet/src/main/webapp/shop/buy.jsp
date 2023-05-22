<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 몇번 상품 몇개 인지를 HttpServletRequest 객체를 이용해서 얻어낸 다음
	// 아래의 html 요소에 출력해 보세요.
	// 요청 인코딩 설정(한글깨지지 않도록)(get 방식에선 필요가 없음)
	request.setCharacterEncoding("utf-8");
	// 전달되는 파라미터가 숫자인 경우에 실제 숫자로 바꿔야 되는 경우가 많다.
	// 그런경우 Integer 클래스 혹은 Double 클래스의 parseInt(), parseDouble() static 메소드를 활용하면 된다.
	int num = Integer.parseInt(request.getParameter("num"));
	int amount = Integer.parseInt(request.getParameter("amount"));
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/shop/buy.jsp</title>
</head>
<body>
	<p>
		<strong><%=num %></strong> 번 상품 <strong><%=amount %></strong> 개를 주문 했습니다.
	</p>
</body>
</html>