<%@page import="java.io.File"%>
<%@page import="test.file.dao.FileDao"%>
<%@page import="test.file.dto.FileDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//파라미터로 저날되는 삭제할 파일의 번호를 읽어온다.
	int num = Integer.parseInt(request.getParameter("num"));
	
	//DB에서 해당 파일의 정보를 읽어온다.
	FileDto dto = FileDao.getInstance().getData(num);
	
	//로그인 된 아이디와 글 작성자가 같을때만 삭제 되도록 한다.
	String id = (String)session.getAttribute("id");
	//만일 글 작성자가 로그인 된 아이디와 같지 않으면
	if(!dto.getWriter().equals(id)){
		//(에러코드, 에러 메세지);
		System.out.println(!dto.getWriter().equals("id"));
		response.sendError(HttpServletResponse.SC_FORBIDDEN, "니 누구니?");
		return;
	}
	
	//파일 시스템에서 해당 파일을 삭제한다.
	String path = application.getRealPath("/upload")
	+File.separator+dto.getSaveFileName();
	new File(path).delete();
	
	System.out.println(application.getRealPath("/upload"));
	System.out.println(File.separator);
	System.out.println(dto.getSaveFileName());
	
	//DB에서 해당 파일의 정보를 삭제한다.
	FileDao.getInstance().delete(num);
	
	//응답
	String cPath = request.getContextPath();
	response.sendRedirect(cPath+"/file/list.jsp");
%>
