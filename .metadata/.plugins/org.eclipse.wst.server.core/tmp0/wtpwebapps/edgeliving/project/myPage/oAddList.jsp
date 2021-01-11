<%@page import="vo.ReceiveaddrVO"%>
<%@page import="dao.ReceiveaddrDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송 주소록 관리 페이지</title>
<link rel="stylesheet" href="../css/main.css" type="text/css" />
<link rel="stylesheet" href="../css/oAddList.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="../js/httpRequest.js">
</script>
<script>
	
</script>
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
		MemberVO mvo = (MemberVO)m;
		ReceiveaddrDAO dao = new ReceiveaddrDAO();
		int mno = mvo.getMno();
		ArrayList<ReceiveaddrVO> list = dao.getOne2(mno);
		
%>	
	<div class="oAddList_path">
	<a href="../index.jsp">홈</a>>
	<a href="myPage.jsp">마이쇼핑</a>>
	<strong>배송 주소록 관리 페이지</strong>
	</div>
	<div>
	<b style="margin-left:15%; font-size:20px;">배송 주소록 관리</b>
	<p>자주 쓰는 배송지를 등록 관리하실 수 있습니다.</p>
	</div>
	
	<table>
	<tr>
		<th id="oAddList_addrpost">우편번호</th>
		<th id="oAddList_addrbasic">기본주소</th>
		<th id="oAddList_addrdetail">상세주소</th>
		<th id="oAddList_modify"></a>수정</th>
		
	</tr>
	<%
	//총 배송지 목록 전체 출력
	for(ReceiveaddrVO vo1 : list){
		 
	
	%>
	
	<tr>
		
		<td><%=vo1.getReceiveaddrpost() %></td>
		<td><img src="./image/basic.gif" alt="기본이미지" style="display:none;" /><%=vo1.getReceiveaddrbasic()%></td>
		<td><%=vo1.getReceiveaddrdetail() %></td>
		<td><a href="oAddModify.jsp?rno=<%=vo1.getRno()%>"><img src="./image/btn_address_modify.gif" alt="수정버튼" id="oAddList_modifyBtn"/></a></td>
	</tr>
	<%} %>
	</table>
	<a href="oAddAdd.jsp"><input type="button" value="배송지등록" id="oAddList_addBtn" /></a><br />
	
	<div id="oAddList_ca">
	<div id="oAddList_caution"><b style="margin-left:10px; font-size:13px;">배송주소록 유의사항</b></div>
	<div id="oAddList_cautionList">
	<ul>
		<li>배송 주소록은 최대 10개까지 등록할 수 있으며, 별도로 등록하지 않을 경우 최근 배송 주소록 기준으로 자동 업데이트 됩니다.</li>
		<li>자동 업데이트를 원하지 않을 경우 주소록 고정 선택을 선택하시면 선택된 주소록은 업데이트 대상에서 제외됩니다.</li>
		<li>기본 배송지는 1개만 저장됩니다. 다른 배송지를 기본 배송지로 설정하시면 기본 배송지가 변경됩니다.</li>
	</ul>
	</div>
	</div>
	<%
} %>
<%@ include file="../common/footer.jsp"%>
</body>
</html>