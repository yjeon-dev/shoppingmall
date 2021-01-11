<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String strmno = request.getParameter("pno");
	String query = request.getParameter("query");
	
	
	ProductDAO dao = new ProductDAO();
	if (strmno != null){
		
		int mno = Integer.parseInt(strmno);
		dao.deleteOne(mno);
	}
	
	//dao.close();
	response.sendRedirect("./main.jsp");
%>