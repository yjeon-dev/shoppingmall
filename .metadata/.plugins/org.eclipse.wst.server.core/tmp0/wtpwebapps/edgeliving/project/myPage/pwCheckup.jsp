<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8");
String pw = request.getParameter("pw");

String result="";
Object pwCheckobj = session.getAttribute("vo");
MemberVO mVO2 = (MemberVO)pwCheckobj;
int mno=mVO2.getMno();
String pw2 = mVO2.getPw();

if(pw!=null){
	if(pw.equals(pw2)){
		result="true";
	}else{
		result="false";
	}
		
	/* MemberDAO mdao = new MemberDAO();
	MemberVO mVO = mdao.selectOne(id, pw);
	result = ""+mdao.getOne(mno); */
}else{
	result="false"; 
}
out.println(result);



%>