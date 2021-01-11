<%@page import="dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
//파라미터 값 가져오기
	String[] str = request.getParameterValues("ck");

	
	CartDAO dao = new CartDAO();
	String[] m = new String[str.length];
	for(int i=0;i<str.length;i++){
		m[i] = str[i];
		
	}
	
	
	dao.deleteList(m);
	response.sendRedirect("./viewcart.jsp");
	

%>