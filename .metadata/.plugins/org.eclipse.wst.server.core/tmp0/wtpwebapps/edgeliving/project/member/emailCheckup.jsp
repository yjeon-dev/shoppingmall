
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	/* 이메일 중복검사 jsp */
	request.setCharacterEncoding("UTF-8");
	String email = request.getParameter("email");
	String result="";
	if(email!=null){
		MemberDAO mdao = new MemberDAO();
		result = mdao.EmailIsExists(email);
	}else{
		result="false";
	}
	out.println(result);

%>
