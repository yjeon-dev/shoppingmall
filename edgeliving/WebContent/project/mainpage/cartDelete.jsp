<%@page import="dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
	String cartno = request.getParameter("cartno");
	
	
	CartDAO dao = new CartDAO();
	if (cartno != null){
		
		
		dao.delete(cartno);
	}
	
	//dao.close();
	response.sendRedirect("./viewcart.jsp");
%>