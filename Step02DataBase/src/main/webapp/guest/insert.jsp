<%@page import="test.guest.dao.GuestDao"%>
<%@page import="test.guest.dto.GuestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. post 방식으로 전송되는 회원의 이름, 주소를 추출한다.
		request.setCharacterEncoding("utf-8");
		String writer = request.getParameter("writer");
		String pwd = request.getParameter("pwd");
		String content = request.getParameter("content");

		GuestDto dto = new GuestDto();
		dto.setWriter(writer);
		dto.setPwd(pwd);
		dto.setContent(content);
	// 2. DB에 저장한다.
		GuestDao dao = GuestDao.getInstance();
		boolean isSuccess = dao.insert(dto); // 작업의 성공여부가 리턴된다.
		
		String cPath = request.getContextPath();
		// 리다일렉트 응답하기
		response.sendRedirect(cPath+"/guest/list.jsp");
		
%> 
