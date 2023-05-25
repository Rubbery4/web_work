<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
<!-- 이 주석은 웹브라우저에게 출력되지만 웹브라우저가 무시하는 주석 -->
<%--이 주석은 jsp 페이지가 무시하는 주석(웹브라우저에 출력되지 않는다) --%>
	<div class="container">
	<h1>방명록 작성</h1>
	<form action="insert.jsp" method="post">
		<div class="row">
		<div class="col-sm-6">
			<label for="writer">작성자</label>
			<input class="form-control" type="text" id="writer" name="writer"/>
		</div>
		<div class="col-sm-6">
			<label for="pwd">비밀번호</label>
			<input class="form-control" type="password" id="pwd" name="pwd"/>
		</div>
		</div>
		<div>
			<label for="content">내용</label>
			<br />
			<textarea class="form-control" name="content" id="content" cols="25" rows="5"></textarea>
		</div>
		<br />
		<div class="text-end">
			<button class="btn btn-outline-secondary" type="submit">등록</button>
		</div>
	
	</form>
	</div>
</body>
</html>