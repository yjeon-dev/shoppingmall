
<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  String id = request.getParameter("register_id");
  String pw = request.getParameter("register_pw");
  String mname = request.getParameter("register_name");
  
  String addrpost = request.getParameter("register_addNum");
  String addrbasic = request.getParameter("register_add1");
  String addrdetail = request.getParameter("register_add2");
  
  String number = request.getParameter("register_number");
  String pho = request.getParameter("register_pho");
  String ne = request.getParameter("register_ne");
  
  String email = request.getParameter("register_email");
  
  String gender = request.getParameter("register_gender");

  
  String dob = request.getParameter("register_datepicker");
  String year = request.getParameter("register_year");
  String month = request.getParameter("register_month");
  String day = request.getParameter("register_day");
  String yang = request.getParameter("register_yang");
  String um = request.getParameter("register_um");

  //dob gender addrpost, addrbasic, autority,point,addrdetail,tel
 // String dob =  year+"-"+month+"-"+day;
  //String gender = "남";
  String phone = number +"-"+ pho+"-"+ne;
  String tel =  number +"-"+ pho+"-"+ne;
  int autority = 0;
  int point = 0;
  MemberDAO mDAO = new MemberDAO();
  MemberVO vo = new MemberVO();
  
  mDAO.insertOne(id, pw, mname, dob, gender, email, phone, addrpost, addrbasic, autority, point, addrdetail, tel);
  
  session.setAttribute("mname", mname);
  response.sendRedirect("registerComplete.jsp");




%>