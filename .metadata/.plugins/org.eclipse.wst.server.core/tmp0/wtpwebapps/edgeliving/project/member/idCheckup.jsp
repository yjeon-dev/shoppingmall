<%@page import="dao.MemberDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*      아이디 중복검사 jsp */
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String result="";
	if(id!=null){
		MemberDAO mdao = new MemberDAO();
		result = mdao.IDisExists(id);
	}else{
		result="false";
	}
	out.println(result);

%>
