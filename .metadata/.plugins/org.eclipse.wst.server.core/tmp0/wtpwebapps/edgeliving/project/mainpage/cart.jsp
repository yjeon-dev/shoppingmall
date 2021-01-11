semiImages<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <%
    
    	Object obj = session.getAttribute("cart");
    
    	if(obj == null){
    		ArrayList<Integer> cart = new ArrayList <Integer>();
    		
    		session.setAttribute("cart", cart);
    		obj = session.getAttribute("cart");	
    	}
    	
    	ArrayList<Integer> cart = (ArrayList<Integer>)obj;
    
    	//db 연결하기
    	String pno = request.getParameter("no");
    
    	int p = Integer.parseInt(pno);
    	
    	cart.add(p);
    	
    	System.out.println("cart" + cart);
    	
    	response.sendRedirect("productdetail.jsp?pno="+p);
    	
    %>