<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원 정보 추가</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<h1>회원 정보 추가</h1>
	<form action="insert.jsp" method="post">
		<div class="mb-1">
			<label for="name" class="form-label">이름</label>
			<input type="text" class="form-control" id="name" name="name" placeholder="이름 입력..." />
		</div>
		<div class="mb-1">
			<label for="addr" class="form-label">주소</label>
			<input type="text" class="form-control" id="addr" name="addr" placeholder="주소 입력..." />
		</div>
		<div class="text-end">
		<button type="submit" class="btn btn-success" >전송</button>
		</div>
	</form>
</body>
</html>