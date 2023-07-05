<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>/test_jquery/Step04_fotorama.jsp</title>
<!-- 플로그인 css -->
<link  href="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">
<style>
	.container{
		width:768px;
		margin: 0 auto;
	}
	.fortorama img {
		max-width: 100px;
	}
	
</style>
</head>
<body>
<!-- jquery 로딩 -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
<!-- 플로그인 javascript 로딩 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>

<div class="container">
	<h1>fotorama 를 이용한 이미지 슬라이더 만들기</h1>
	<div class="fotorama"
	data-allowfullscreen="true"
	data-nav="thumbs"
	data-autoplay="true">
		<img data-caption="상품1" src="${pageContext.request.contextPath}/vue2/images/top01.jpg"/>
		<img data-caption="상품2" src="${pageContext.request.contextPath}/vue2/images/top02.jpg"/>
		<img data-caption="상품3" src="${pageContext.request.contextPath}/vue2/images/top03.jpg"/>
		<img data-caption="상품4" src="${pageContext.request.contextPath}/vue2/images/top04.jpg"/>
		<img data-caption="상품5" src="${pageContext.request.contextPath}/vue2/images/top05.jpg"/>
	</div>
</div>






</body>
</html>