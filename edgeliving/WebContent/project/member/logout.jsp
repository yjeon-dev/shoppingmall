<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

    <%
    String homeURL = "/edgeliving/project";
    session.removeAttribute("vo");
    response.sendRedirect(homeURL+"/index.jsp");
    %>