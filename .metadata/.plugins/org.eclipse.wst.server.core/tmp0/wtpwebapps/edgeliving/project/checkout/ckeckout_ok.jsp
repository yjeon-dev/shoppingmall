<%@page import="dao.OrdersDAO"%>
<%@page import="vo.OrdersVO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 한글설정... 
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	
	Object checkOkOBj = session.getAttribute("vo");
	MemberVO mVO = (MemberVO)checkOkOBj;
	
	
	String strpno2 = request.getParameter("pno2");
	String  strcheckout_name = request.getParameter("checkout_name");
	String  strnumber= request.getParameter("number");
	String  strcellnumber2 = request.getParameter("cellnumber2");
	String  strcellnumber3= request.getParameter("cellnumber3");
	String  strpost1= request.getParameter("post1");
	String  strorderaddr1= request.getParameter("orderaddr1");
	String  strqty2= request.getParameter("qty2");
	String  strprice2= request.getParameter("price2");
	String  strdc2= request.getParameter("dc2");
	String  strorderaddr2= request.getParameter("orderaddr2");
	String  strreceivemsg= request.getParameter("receivemsg");
	
	
	int mno = mVO.getMno();
	int pno = Integer.parseInt(strpno2); // pno2
	SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMddHHmmss");
	Date time = new Date();
	String wdate = format1.format(time);
	
	
	String orderno = ""+wdate+mVO.getMno()+pno+"od";
	String ordername = strcheckout_name; //addrchoice
	String orderphone = strnumber+"-"+strcellnumber2+"-"+strcellnumber3;  // number+cellnumber2+cellnumber3
	String orderrecievepost = strpost1; //post1
	String orderrecievebasic = strorderaddr1; //orderaddr1

	int orderqty = Integer.parseInt(strqty2); //qty2
	int orderprice= Integer.parseInt(strprice2);    //price2
	int orderdc =Integer.parseInt(strdc2); //  dc2
	int orderstatus= 0; // 0 
	
	String ordertel = strnumber+"-"+strcellnumber2+"-"+strcellnumber3; // number+cellnumber2+cellnumber3
	String orderreceivedetail = strorderaddr2; //orderaddr2
	String ordermsg = strreceivemsg; //receivemsg

	OrdersVO vo = new OrdersVO();
	vo.setOrderno(orderno);
	vo.setOrdername(ordername);
	vo.setOrderphone(orderphone);
	vo.setOrderreceivepost(orderrecievepost);
	vo.setOrderreceivebasic(orderrecievebasic);
	vo.setOrderqty(orderqty);
	vo.setOrderprice(orderprice);
	vo.setOrderdc(orderdc);
	vo.setOrderstatus(orderstatus);
	vo.setMno(mno);
	vo.setPno(pno);
	vo.setOrdertel(ordertel);
	vo.setOrderreceivedetail(orderreceivedetail);
	vo.setOrdermsg(ordermsg);
	
	OrdersDAO dao = new OrdersDAO();
	dao.insertOne(vo);
	
	response.sendRedirect("../index.jsp");
%>