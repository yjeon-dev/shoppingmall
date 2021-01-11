<%@page import="dao.CartDAO"%>
<%@page import="vo.CartVO"%>
<%@page import="java.util.Date"%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String strpno = request.getParameter("pno");
	String strqty = request.getParameter("qty");
	
	Object cartOkobj = session.getAttribute("vo");
	
	MemberVO mVO = (MemberVO)cartOkobj;
	
	if(cartOkobj != null){
		int pno = Integer.parseInt(strpno);
		int qty = Integer.parseInt(strqty);
  
		
		out.println("pno : " + strpno + "<br>");
		out.println("qty : " + qty + "<br>");
		out.println("mID : " + mVO.getId() + "<br>");
		out.println("mno : " + mVO.getMno() + "<br>");
		SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMddHHmmss");
		Date time = new Date();
		String wdate = format1.format(time);
		out.println("현재시각 : " + wdate);
		String cartno = ""+wdate+mVO.getMno()+pno;
		out.println("cartno : " + cartno);
		CartVO cartVo = new CartVO();
		cartVo.setCartno(cartno);
		cartVo.setMno(mVO.getMno());
		cartVo.setPno(pno);
		cartVo.setCartquty(qty);
		
		CartDAO cartDAO = new CartDAO();
		cartDAO.add(cartVo);
		
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">   </script>
		<script>
			$(function(){
				self.close();
			})
		</script>
<%
	}else{
		
	}
	
%>
