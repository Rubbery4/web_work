<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 아이디	
	String id = request.getParameter("id");
	// 비밀번호
	String pwd = request.getParameter("pwd");
	// 직업
	String job = request.getParameter("job");
	// 성별
	String gender = request.getParameter("gender");
	// 취미 (아무것도 체크하지 않았으면 null 이다)
	String[] hobby = request.getParameterValues("hobby");
	String hobbyResult="";
	if(hobby != null) {
		for(int i=0; i<hobby.length; i++) {
			// i 번째 방에 있는 선택된 취미를 불러온다.
			String tmp = hobby[i];
			hobbyResult = hobbyResult+tmp;
			if(i!=hobby.length-1) {
				hobbyResult += "/";
			}
		}
		// 문자열에서 특정문자("/") 로 구분해서 String[] 을 얻어내기
		String[] result = hobbyResult.split("/");
		
		// 문자열에 특정 문자가 포함되어 있는지 여부알아내기
		boolean isContain = hobbyResult.contains("xxx");	
	}
	// null 이면 체크를 안한것이고 null 이 아니면 체크를 한 것이다.
	String allowEmail = request.getParameter("allowEmail");
	String allowMessage = request.getParameter("allowMessage");
	/*
		textarea 에 입력한 문자열은 개행, tab, 공백기호가 모두 포함되어 있다.
		해당 문자열을 DB에 저장했다가 다시 불러와서 textarea 에 출력하고 싶으면
		textarea 의 innerText 에 출력하면 된다.
	*/
	String comment = request.getParameter("comment");
	
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
	<div class="container">
		<h1>회원가입 결과</h1>
		<p>회원님의 정보를 성공적으로 저장했습니다.</p>
		<p><%=hobbyResult %></p>
		        <form action="signup.jsp" method="post">
            <div class="form-floating mb-3">
                <input class="form-control" type="text" name="id" id="id" placeholder="id 입력" value="<%=id%>">
                <label for="id">아이디</label>
            </div>
            <div class="form-floating mb-3">
                <input class="form-control" type="password" name="pwd" id="pwd" placeholder="pwd 입력" value="<%=pwd %>">
                <label for="pwd">비밀번호</label>
            </div>
            <select class="form-select mb-3" name="job" id="job">
                <option value="">직업 선택</option>
                <option value="programmer" <%=job.equals("programmer") ? "selected":"" %>>프로그래머</option>
                <option value="doctor" <%=job.equals("doctor") ? "selected":"" %>>의사</option>
            </select>
            <fieldset>
                <legend>성별체크</legend>
                <!--radio 같은 경우에 name 속성이 같으면 그룹으로 묶인다-->
            <div class="form-check form-check-inline">
                <input class="form-check-input" value="man" type="radio" id="one" name="gender" <%=gender.equals("man") ? "checked":"" %>>
                <label class="form-check-label" for="one">남자</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" value="woman" type="radio" id="two" name="gender" <%=gender.equals("woman") ? "checked":"" %>>
                <label class="form-check-label" for="two">여자</label>
            </div>
            </fieldset>
            <fieldset>
                <legend>취미 체크</legend>
                <div class="form-check form-check-inline">
                    <input type="checkbox" value="piano" name="hobby" class="form-check-input" id="piano"
                    <%=hobbyResult.contains("piano")? "checked" : "" %>>
                    <label class="form-check-label" for="piano">피아노</label>
                </div>
                <div class="form-check form-check-inline">
                    <input type="checkbox" value="game" name="hobby" class="form-check-input" id="game"
                    <%=hobbyResult.contains("game")? "checked" : "" %>>
                    <label class="form-check-label" for="game">게임</label>
                </div>
                <div class="form-check form-check-inline">
                    <input type="checkbox" value="etc" name="hobby" class="form-check-input" id="etc"
                    <%=hobbyResult.contains("etc")? "checked" : "" %>>
                    <label class="form-check-label" for="etc">기타</label>
                </div>
            </fieldset>
                <div>
	            	<label class="form-label" for="comment">하고 싶은말</label>
	            	<textarea class="form-control" name="comment" id="comment" rows="10"><%=comment %></textarea>
            	</div>
            <fieldset>
                <legend>개인정보 활용 동의</legend>
            <div class="form-check form-switch">
                <input class="form-check-input" type="checkbox" id="allowAll">
                <label class="form-check-label" for="allowAll">전체 동의</label>
            </div>
            <div class="form-check form-switch">
                <input class="form-check-input allow" type="checkbox" value="email" 
                name="allowEmail" id="allowEmail" <%=allowEmail!= null ? "checked":"" %>>
                <label class="form-check-label" for="allowEmail">이메일 수신여부</label>
            </div>
            <div class="form-check form-switch">
                <input class="form-check-input allow" type="checkbox" value="message" 
                name="allowMessage" id="allowMessage" <%=allowMessage!= null ? "checked":"" %>>
                <label class="form-check-label" for="allowMessage">광고성 문자 수신 여부</label>
            </div>
            </fieldset>
            <button class="btn btn-outline-primary" type="submit">가입</button>
        </form>
	</div>
	<script>

	
	</script>
</body>
</html>