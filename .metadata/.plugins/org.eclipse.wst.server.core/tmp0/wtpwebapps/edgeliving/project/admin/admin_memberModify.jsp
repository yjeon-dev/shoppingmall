<%@page import="vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String strmno = request.getParameter("mno");
	
	
	
	MemberDAO dao = new MemberDAO();
	MemberVO vo = null;
	if (strmno != null){
		
		int mno = Integer.parseInt(strmno);
		vo = dao.getOne(mno);
				
		
	}else{
		
	response.sendRedirect("./main.jsp");
	}
	
	//dao.close();
%>