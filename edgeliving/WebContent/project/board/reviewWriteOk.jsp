<%@page import="dao.ReviewDAO"%>
<%@page import="vo.ReviewVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	
	String strrate = request.getParameter("rate");
	String prodreview = request.getParameter("contents");
	String orderno = request.getParameter("orderno");
	
	int rate = Integer.parseInt(strrate);
	
	System.out.println(rate);
	System.out.println(prodreview);
	System.out.println(orderno);
	
	ReviewVO vo = new ReviewVO();
	vo.setOrderNo(orderno);
	vo.setProdReview(prodreview);
	vo.setRate(rate);
	
	ReviewDAO dao = new ReviewDAO();
	dao.insertOne(vo);
	
	response.sendRedirect("../index.jsp");
	 %>