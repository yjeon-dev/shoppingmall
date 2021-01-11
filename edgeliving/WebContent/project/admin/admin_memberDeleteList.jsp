<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
//파라미터 값 가져오기
String[] str = request.getParameterValues("ck");

	
	MemberDAO dao = new MemberDAO();
	int[] m = new int[str.length];
	for(int i=0;i<str.length;i++){
		m[i] = Integer.parseInt(str[i]);
		
	}
	
	
	dao.deleteList(m);
	response.sendRedirect("./main.jsp");
	

%>