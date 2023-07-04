<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/test_jquery/Step04_datetime.jsp</title>
<!-- 플러그인 css 로딩 -->
<link rel="stylesheet" href="css/jquery.datetimepicker.min.css" />

</head>
<body>

   <input type="text" id="one" placeholder="날짜 시간 선택"/>
   <input type="text" id="two" placeholder="날짜 선택"/>
   <input type="text" id="three" placeholder="시간 선택"/>
   
   <p>html5 에서 추가된 ui</p>
   <input type="date" />
   <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.0/dist/jquery.min.js"></script>
   <!-- 플러그인 javascript 로딩 -->
   <script src="js/jquery.datetimepicker.full.min.js"></script>
   <script>
   
   $.datetimepicker.setLocale("ko");
   
   
   $("#one").datetimepicker();
   $("#two").datetimepicker({
	   timepicker:false,
	   format:"Y.m.d"
   })
   $("#three").datetimepicker({
	   timepicker:false,
	   format:"H:i"
   })
   </script>
</body>
</html>


