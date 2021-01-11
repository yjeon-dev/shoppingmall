<%@page import="dao.CommentsDAO"%>
<%@page import="vo.CommentsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String strbno= request.getParameter("bno");
	String strmno= request.getParameter("mno");
	String comments= request.getParameter("comments");
	
	int bno = Integer.parseInt(strbno);
	int mno = Integer.parseInt(strmno);
	
	CommentsVO vo = new CommentsVO();
	
	vo.setBno(bno);
	vo.setMno(mno);
	vo.setCdesc(comments);
	
	CommentsDAO dao = new CommentsDAO();
	dao.add(vo);
	
	response.sendRedirect("./question_list_board.jsp");
	
%>