<%@page import="dao.MemberDAO"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");

String pw = request.getParameter("pw");

String name = request.getParameter("name");

String addrpost = request.getParameter("addNum");
String addrbasic = request.getParameter("add1");
String addrdetail = request.getParameter("add2");

String number = request.getParameter("number");
String num = request.getParameter("num");
String ber = request.getParameter("ber");

String phone1 = request.getParameter("number");
String pho = request.getParameter("pho");
String ne = request.getParameter("ne");

String email = request.getParameter("email");

String man = request.getParameter("man");
String woman = request.getParameter("woman");

String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
String yang = request.getParameter("yang");
String um = request.getParameter("um");

int autority = Integer.parseInt(request.getParameter("autority"));
int point = Integer.parseInt(request.getParameter("point"));

int mno = Integer.parseInt(request.getParameter("mno"));
//dob gender addrpost, addrbasic, autority,point,addrdetail,tel
String dob = year+"-"+month+"-"+day;
String gender = "남";
String phone = phone1 + "-" + pho+ "-" + ne;
String tel = number+"-"+num+"-"+ber;
	

	MemberVO vo = new MemberVO();
	
	vo.setMno(mno);
	vo.setId(id);
	vo.setPw(pw);
	vo.setMname(name);
	vo.setDob(dob);
	vo.setGender(gender);
	vo.setEmail(email);
	vo.setPhone(phone);
	vo.setAddrpost(addrpost);
	vo.setAddrbasic(addrbasic);
	vo.setAddrdetail(addrdetail);
	vo.setAuthority(autority);
	vo.setTel(tel);
	vo.setPoint(point);
	
	System.out.println(vo);
	System.out.println(vo.getId());
	
	MemberDAO dao = new MemberDAO();
	dao.modify(mno, vo);
	
	
	
	response.sendRedirect("./main.jsp");
	
	
	
	

%>