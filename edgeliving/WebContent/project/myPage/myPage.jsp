<%@page import="dao.OrdersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="../css/main.css" type="text/css" />
<link rel="stylesheet" href="../css/myPage.css" type="text/css" />
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	
	<%
	Object m = session.getAttribute("vo");
	if(m==null){ 
		out.println("오류");
		response.sendRedirect("./login.jsp");
	}else{
		//로그인이 되어 있는 상태라면
		// 세션에 저장된 아이디를 가져와서
		// 그 아이디 해당하는 수정할 회원정보를 가져온다.
		MemberVO vo = (MemberVO)m;
		
		OrdersDAO oDAO = new OrdersDAO();
		int orderstatus1 = oDAO.getTotalCount(vo.getMno(), 0);
		int orderstatus2 = oDAO.getTotalCount(vo.getMno(), 1);
		int orderstatus3 = oDAO.getTotalCount(vo.getMno(), 2);
		int orderstatus4 = oDAO.getTotalCount(vo.getMno(), 3);
	
%>
	<div class="myPage_path">
	<a href="../index.jsp">홈</a>>
	<strong>마이쇼핑</strong>
	</div>
	<h3 style="margin-left : 15%; margin-top : 5%;">마이쇼핑</h3>
	<div id="myPage_info">
		<img src="./image/member_img.gif" alt="회원프사" />
		<span></span>
		<div id="myPage_thanks"><b><%=vo.getMname() %></b>님 저희 쇼핑몰을 이용해주셔서 감사합니다. </div>
	</div>
	<br /><br />
	<div id="myPage_orderStatus">
	<div id="myPage_orderStatus1"><b>나의 주문처리 현황</b> <p class="myPage_ptag">(최근 3개월 기준)</p></div>
	
	<div id="myPage_orderStatus2">입금전 <div><%=orderstatus1 %></div></div>
	
	<div id="myPage_orderStatus3">배송준비중 <div><%=orderstatus2 %></div></div>
	
	<div id="myPage_orderStatus4">배송중 <div><%=orderstatus3 %></div></div>
	
	<div id="myPage_orderStatus5">배송완료 <div><%=orderstatus4 %></div></div>
	
	<div id="myPage_orderStatus6">
		<ul>
			<li>취소 : 0</li>
			<li>교환 : 0</li>
			<li>반품 : 0</li>
		</ul>
	</div>
	</div>
	<br /><br />
	<div id="myPage_order">
		<a href="../checkout/orderlist.jsp"><b>order</b></a> <p class="myPage_ptag3">주문내역 조회</p>
		<p class="myPage_ptag2">고객님께서 주문하신 상품의 주문내역을 확인하실 수 있습니다. </p>
		<p class="myPage_ptag2">비회원의 경우, 주문서의 주문번호와 비밀번호로 주문조회가 가능합니다.</p>
	</div>
	
	<div id="myPage_profile">
		<a href="myPagePwCheck.jsp"><b>profile</b></a> <p class="myPage_ptag3">회원 정보</p>
		<p class="myPage_ptag2">회원이신 고객님의 개인정보를 관리하는 공간입니다. </p>
		<p class="myPage_ptag2">개인정보를 최신 정보로 유지하시면 보다 간편히 쇼핑을 즐기실 수 있습니다.</p>
	</div>
	
	<div id="myPage_review">
		<a href="#"><b>review</b></a> <p class="myPage_ptag3">상품 리뷰 관리</p>
		<p class="myPage_ptag2">고객님께서 작성하신 상품 리뷰글을 관리하는 공간입니다.</p>
		<p class="myPage_ptag2">고객님께서 작성하신 리뷰를 한눈에 확인하실 수 있습니다.</p>
	</div>
	
	<div id="myPage_address">
		<a href="oAddList.jsp"><b>address</b></a> <p class="myPage_ptag3">배송 주소록 관리</p>
		<p class="myPage_ptag2">자주 사용하는 배송지를 등록하고 관리하실 수 있습니다.</p>
	</div>
	
	<br />
	<br />
	<br />
	<%
} %>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>