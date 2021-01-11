<%@page import="dao.BoardsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	String[] str = request.getParameterValues("ck");
	BoardsDAO dao = new BoardsDAO();

	int[] m = new int[str.length];
	for (int i = 0; i < str.length; i++) {
		m[i] = Integer.parseInt(str[i]);
	}
	dao.deleteList(str);

	response.sendRedirect("review.jsp");
%>