<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<div class="contatiner">
		<h3>파일 업로드 폼2 입니다.</h3>
		<!-- 
			파일 업로드 폼 작성법
			1. method="post"
			2. enctype="multipart/form-data"
			3. <input type="file"/>
			- enctype = "multipart/form-data" 가 설정된 폼을 전송하면
			  폼전송된 내용을 추출할때 HttpServletRequest 객체로 추출을 할 수 없다.
			  MultipartRequest 객체를 이용해서 추출해야 한다.
		 -->
		<form action="upload2.jsp" method="post" enctype="multipart/form-data" id="myForm">
			<div>
				<label for="title">제목</label>
				<input type="text" name="title" id="title"/>
			</div>
			<div>
				<label for="myFile">첨부파일</label>
				<input type="file" name="myFile" id="myFile" />
			</div>
			<button type="submit">업로드</button>
		</form>
	</div>
	<script src="${pageContext.request.contextPath}/js/gura_util.js"></script>
	<script>
		// 폼에 submit 이벤트가일어 났을때 실행할 함수 등록
		document.querySelector("#myForm").addEventListener("submit", (e)=>{
			// 폼 전송 막기
			e.preventDefault();
			// 폼에 입력하거나 선택한 정보를 javascript로 직접 전송하기
			let data = new FormData(e.target); // e.target은 form 의  참조값이다
			/*
			// fetch() 함수가 리턴하는 Promise 객체를
			promise = fetch("upload2.jsp", {
				method:"post",
				body:data
			})
			.then(res=>res.text())
			.then(data=>{
				// data는 upload2.jsp 페이지가 응답한 JSON 형식의 문자열이다.
				console.log(data);
				// JSON.parse() 함수를 이용해서 문자열을 실제 object or array 로 변환할수 있다.
				const result= JSON.parse(data);
				// result 는 object
				console.log(result)
			});
			*/
			/*
			promise = fetch("upload2.jsp", {
				method:"post",
				body:data
			})
			.then(res=>res.json())
			.then(data=>{
				// data는 object
				console.log(data);
			});
			*/
			// gura_util.js 안에 있는 함수를 활용하면 아래와 같다
			ajaxFormPromise(e.target)
			.then(res=>res.json())
			.then(data=>{
				// data는 object
				console.log(data);
		});
	</script>
</body>
</html>