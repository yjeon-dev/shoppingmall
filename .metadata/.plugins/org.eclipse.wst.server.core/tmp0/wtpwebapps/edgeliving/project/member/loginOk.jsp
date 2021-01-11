
<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginOk.jsp</title>
</head>
<body>
	
	<%
//	String homeURL = "http://192.168.0.4/edgeliving/project";
	String homeURL = "/edgeliving/project";
		//1.parameter값 가져오기 id,pw
		String id = request.getParameter("login_id");
		String pw = request.getParameter("login_pw");
		//2.화면 출력

		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.login(id,pw);
		
		if(vo == null){
			out.println("id" + id + "<br>");
			out.println("id" + pw + "<br>");
			response.sendRedirect("./login.jsp");
	%>
		
		
	<% 
		 }else{
			//setAttribute(속성명,값);
			session.setAttribute("vo",vo);
			response.sendRedirect("../index.jsp");
		
		}

		//dao.close();	
	%>
		
		
	
	
	
	
	
</body>
</html>