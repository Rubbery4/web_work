<%@page import="test.guest.dao.GuestDto"%>
<%@page import="java.util.List"%>
<%@page import="test.guest.dto.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 1. 삭제할 회원의 번호를 얻어내서
request.setCharacterEncoding("utf-8");
int num = Integer.parseInt(request.getParameter("num"));
String pwd = request.getParameter("pwd");
// 2. DB 에서 삭제하고
GuestDao dao = GuestDao.getInstance();
boolean isSuccess = dao.delete(num, pwd);


String cPath = request.getContextPath();
// 리다일렉트 응답하기
response.sendRedirect(cPath+"/guest/list.jsp");

%>
