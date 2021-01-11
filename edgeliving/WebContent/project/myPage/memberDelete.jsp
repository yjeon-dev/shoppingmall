<%@page import="dao.MemberDAO"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
<%
//회원번호
int mno = Integer.parseInt(request.getParameter("mno"));

//비밀번호
String pw = request.getParameter("memberModify_newPwCheck");

MemberVO vo = new MemberVO();
MemberDAO dao = new MemberDAO();
//회원정보 삭제
dao.deleteOne(mno);
%>
<script>
	alert("탈퇴 되었습니다. ");
	document.location.href = "index.jsp";
</script>
</body>
</html>