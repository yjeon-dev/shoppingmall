<%@page import="vo.MemberVO"%>

<%@page import="dao.ReceiveaddrDAO"%>
<%@page import="vo.ReceiveaddrVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
<%
	//회원번호
	//int mno = Integer.parseInt(request.getParameter("mno"));
	Object oaddObj = session.getAttribute("vo");
	MemberVO mvo = (MemberVO)oaddObj;
	
	//주소
	//주소
	  String addrpost = request.getParameter("oAddAdd_addNum");
	  String addrbasic = request.getParameter("oAddAdd_add1");
	  String addrdetail = request.getParameter("oAddAdd_add2");
	
	  ReceiveaddrVO vo = new ReceiveaddrVO();
	  vo.setMno(mvo.getMno());
	  vo.setReceiveaddrpost(addrpost);
	  vo.setReceiveaddrbasic(addrbasic);
	  vo.setReceiveaddrdetail(addrdetail);
	  vo.setStatus(2);
	  
	  System.out.println(vo);
	  System.out.println(vo.getMno());
	  
	  ReceiveaddrDAO dao = new ReceiveaddrDAO();
	  //배송지 추가등록
	  dao.insertOne(vo);
%> 

	<script>
	  alert("배송지가 등록되었습니다 ");
	  document.location.href = "oAddList.jsp";
	</script>
</body>
</html>