<%@page import="vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
   
    	//String homeURL = "http://192.168.0.4:8080/edgeliving/project";
    	String homeURL = "/edgeliving/project";
    	//String homeURL = "http://192.168.0.4:8080/edgeliving/project";
    	String WebURL = "/edgeliving";
    
    %>
<div id="header">
		<div class="header1" >
			<a href="<%=homeURL%>/index.jsp"><img src="<%=WebURL %>/semiImages/logo.png" alt="logo.png"  id="mainlogo"/>
			
			</a>
		</div>

		<div class="header1">
			<div>
				<strong>인기검색어</strong> <a href="<%=homeURL %>/product/prodlist_search.jsp?search=자크라디" class="search_a">자크라디</a> &nbsp;
				<a href="<%=homeURL %>/product/prodlist_search.jsp?search=임페리얼" class="search_a">임페리얼 포셀린</a> &nbsp; 
				<a href="<%=homeURL %>/product/prodlist_search.jsp?search=보니타하우스"	class="search_a">보니타하우스</a> &nbsp;
			</div>
			<br />
			
				<form action="<%=homeURL %>/product/prodlist_search.jsp" id="search_form" name="search_frm" onsubmit="return checkSearch()">
			 		<input type="text" value="" name="search" size="40" id="header_search_text"/>
			 		<input type="submit" value="검색" />
			 	</form>
			
		</div>
		<script>
		
		function checkSearch(){
			if(search_frm.search.value == "") {

			    alert("값을 입력해 주세요.");

			    search_frm.search.focus();

			    return false;

			  }else{
				  return true;
			  }
		}
			

		 

		  

		
			
		</script>
		<%

		Object obj = session.getAttribute("vo");
		
		MemberVO mVO = (MemberVO)obj;
		//
		if(obj == null){
			
		 
		
		%>
		<div class="header1" id="topAtag" >
			 <a href="<%=homeURL %>/member/login.jsp" class="header_a2">로그인</a>
			<a href="<%=homeURL %>/member/register.jsp" class="header_a2">회원가입</a> <a href="<%=homeURL %>/member/login.jsp" class="header_a2">장바구니</a>
			<a href="<%=homeURL %>/member/login.jsp" class="header_a2">주문조회</a> <a href="<%=homeURL %>/board/customer_center.jsp" class="header_a2">고객센터</a>
		</div>

		<%
		}else{
			
			if(mVO.getAuthority() < 99){
				%>
					<div class="header1" id="topAtag" >
			 <a href="<%=homeURL %>/member/logout.jsp" class="header_a2">로그아웃</a>
			 <a href="<%=homeURL %>/myPage/myPage.jsp"  class="header_a2">마이페이지</a>
			 <a href="<%=homeURL %>/mainpage/viewcart.jsp" class="header_a2">장바구니</a>
			<a href="<%=homeURL %>/checkout/orderlist.jsp" class="header_a2">주문조회</a> <a href="<%=homeURL %>/board/customer_center.jsp" class="header_a2">고객센터</a>
		</div>
				<%
				
			}else{
				%>
			<div class="header1" id="topAtag" >
			 <a href="<%=homeURL %>/member/logout.jsp" class="header_a2">로그아웃</a>
			 <a href="<%=homeURL %>/myPage/myPage.jsp"  class="header_a2">마이페이지</a>
			 <a href="<%=homeURL %>/mainpage/viewcart.jsp" class="header_a2">장바구니</a>
			<a href="<%=homeURL %>/checkout/orderlist.jsp" class="header_a2">주문조회</a> <a href="<%=homeURL %>/board/customer_center.jsp" class="header_a2">고객센터</a>
			<a href="<%=homeURL %>/admin/main.jsp" class="header_a2">관리자페이지</a>
			<%-- <a href="<%=homeURL %>/member/memberModify.jsp" class="header_a2">정보수정</a> --%>
		</div>
				<%
			}
		}
		%>
		<div >
			<ul id="topMenu">
				<li><a href="/edgeliving/project/product/prodlist.jsp?cate_no=0" class="menu" id="allCategory">전체상품</a></li>
				<li><a href="/edgeliving/project/product/prodlist.jsp?cate_no=1" class="menu" id="newProd">신상품</a></li>
				<li><a href="/edgeliving/project/product/prodlist.jsp?cate_no=2" class="menu" id="best50">베스트40</a></li>
				<li><a href="/edgeliving/project/brand/brand.jsp" class="menu" id="brand">브랜드</a></li>
				<li><a href="/edgeliving/project/board/review.jsp" class="menu" id ="review">생생후기</a></li>
			</ul>
		</div>
	</div>

	<div id="contents">
	
	
	</div>
