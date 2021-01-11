<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String strmno = request.getParameter("mno");
	String query = request.getParameter("query");
	
	
	MemberDAO dao = new MemberDAO();
	if (strmno != null){
		
		int mno = Integer.parseInt(strmno);
		dao.deleteOne(mno);
	}
	
	//dao.close();
	response.sendRedirect("./main.jsp");
%>