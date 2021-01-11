<%@page import="vo.ProductVO"%>
<%@page import="dao.ProductDAO"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 추가</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">   </script>
<script>
	$(function(){
		
		$("#cartbtn_ok").on("click",function(){
			
		});
		

		$("#cartbtn_cancle").on("click",function(){
			console.log("gd");
			self.close();
		});
		
	});
		
	
</script>
</head>
<body>
	<%
		String strpno = request.getParameter("pno");
		String strqty = request.getParameter("qty");
		String strtotalprice = request.getParameter("totalprice");
		Object cartDialogobj = session.getAttribute("vo");
		MemberVO mVO = (MemberVO)cartDialogobj;
		int pno = Integer.parseInt(strpno);
		
		if(cartDialogobj != null){
			ProductDAO cartDialog_pDAO = new ProductDAO();
			ProductVO cartDialog_pVO = cartDialog_pDAO.getOne(pno);
	%>
	<form action="cartOk.jsp">
			<div style="width:500px;  height: 50px; background: #444444; text-align: center">
				<h3 style="color: white;">장바구니</h3>
			</div>
			<div style="width: 500px; text-align: center; ">
				<img src="<%=cartDialog_pVO.getThumbNailImg() %>" alt="gd" style="width : 170px; height: 170px; padding-top: 15px; "/>
				<p> 제품명 : <%=cartDialog_pVO.getPname() %></p>
				<p> 수량 : <%= strqty %>개</p>
				<p> 총 가격 : <%=strtotalprice %>원</p>
			</div>
			<div style="margin-left: 50px;">
				<input id="cartbtn_ok" type="submit" value="장바구니 추가" style="width: 160px; padding: 10px 10px 10px 10px; background: white"/>
				<input id="cartbtn_cancle" type="button" value="취소" style="width: 160px; padding: 10px 10px 10px 10px; background: white; margin-left: 70px;" /> 
			</div>
			
			<input type="hidden" name="pno" value="<%=strpno %>" />
			<input type="hidden" name="qty" value="<%=strqty %>" />
	</form>
	<%				
		}else{
	%>
	<script>
	$(function(){
		alert("로그인 하셔야 이용하실 수 있습니다.")
		self.close();
				
	});
	</script>
	<%	
		}
	%>
	
</body>
</html>