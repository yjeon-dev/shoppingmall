<%@page import="dao.MemberDAO"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
		

	String findId_name = request.getParameter("findId_name");
	String findId_email = request.getParameter("findId_email");
	
	MemberDAO dao = new MemberDAO();
	
	MemberVO vo = dao.findId(findId_name, findId_email);
	
	
	if(vo.getMname().equals(findId_name) && vo.getEmail().equals(findId_email)){
		out.println("회원님의 아이디는 : " + vo.getId()+" 입니다.");
	/* }else if(vo.getMname() == null || vo.getEmail() == null){
		out.println("아이디 혹은 이메일을 확인하여 주십시요");
	} */
	}else{
		out.println("아이디 혹은 이메일을 확인하여 주십시요");
	}
	
	
%>