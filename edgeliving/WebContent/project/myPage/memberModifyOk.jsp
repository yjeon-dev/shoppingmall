<%@page import="dao.MemberDAO"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정완료</title>
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
	//주소
	  String addrpost = request.getParameter("memberModify_addNum");
	  String addrbasic = request.getParameter("memberModify_add1");
	  String addrdetail = request.getParameter("memberModify_add2");
	//휴대폰 번호
	  String number = request.getParameter("memberModify_number");
	  String pho = request.getParameter("memberModify_pho");
	  String ne = request.getParameter("memberModify_ne");
	
	  String phone = number +"-"+ pho+"-"+ne;
	  
	  MemberVO vo = new MemberVO();
	  vo.setPw(pw);
	  vo.setAddrpost(addrpost);
	  vo.setAddrbasic(addrbasic);
	  vo.setAddrdetail(addrdetail);
	  vo.setPhone(phone);
	  
	  System.out.println(vo);
	  System.out.println(vo.getId());
	  
	  MemberDAO dao = new MemberDAO();
	  //회원정보변경
	  dao.modifyMember(mno, vo);
	  %>  
	  <script>
	  alert("회원 정보가 수정되었습니다. ");
	  document.location.href = "memberModify.jsp";
	  </script>

</body>
</html>