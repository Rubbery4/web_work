<%@page import="test.file.dto.FileDto"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@page import="test.file.dao.FileDao"%>
<%@ page language="java" contentType="application/octet-stream; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	// 1. GET 방식 파라미터로 전달되는 파일의 번호를 읽어온다.
	int num = Integer.parseInt(request.getParameter("num"));
	
	// 삭제할 파일의 정보를 DB에서 읽어오기
	FileDto dto = FileDao.getInstance().getData(num);
	
	// 로그인된 아이디와 글의 작성자가 일치하는지 확인하기
	String id = (String)session.getAttribute("id");
	if(!dto.getWriter().equals(id)) {
		// 에러 응답하기
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "남의 파일을 지울수 없습니다.");
		return;
	}
	
	
	String path=application.getRealPath("/upload") + File.separator+dto.getSaveFileName();
	
	   //해당 경로를 access 할수 있는 파일 객체 생성
	   File f=new File(path);
	   if(f.exists()){ 
	      f.delete(); // 파일 삭제 
	   }
	   FileDao.getInstance().delete(num);
		// context 경로 얻어내기 (context 경로는 추후에 수정되거나 제거될 예정이기 떄문에 메소드로 얻어낸다.)
		String cPath = request.getContextPath();
		// 리다일렉트 응답하기
		response.sendRedirect(cPath+"/file/list.jsp");
		
%>

