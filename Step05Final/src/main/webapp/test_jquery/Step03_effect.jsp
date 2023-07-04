<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<style>
	.box{
		width: 100px;
		height: 100px;
		background-color: yellow;
		border: 1px solid red;
	}
</style>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
</head>
<body>
	<button id="hideBtn">숨기기</button>
	<button id="showBtn">보이기</button>
	<button id="toggleBtn">토글</button>
	<div class="box"></div>
	<script>
		/*
			숨기기 버튼을 누르면 box div 가 숨겨지고, 보이기 버튼을 누르면 보여지도록 jquery
			를 활용해서 프로그래밍 해 보세요.
		*/
		$("#hideBtn").on("click", function() {
			//$(".box").css("display", "none");
			$(".box").hide();
		});
		$("#showBtn").on("click", function(){
			//$(".box").css("display", "")
			$(".box").show();
		}); 
		$("#toggleBtn").on("click", function(){
			$(".box").toggle();
		})
	</script>
</body>
</html>