<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>관리자 메인 페이지</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<link rel="stylesheet" href="../css/main.css" type="text/css" />
 <!-- <script type="text/javascript" src="../js/main.js"></script> --> 




<style>
#contents2 {
	width: 1800px;

	margin: 0px auto;
	margin-bottom: 150px;
	margin-top: 100px;
}

#admin_main_left {

	float: left;
	width: 200px;
	
	text-align: center;
	font-size: 15px;
	font-weight: bold;
	border-right: 3px solid blue;
	background: pink;
	color: white;
}

#admin_main_right {

	float: left;
	width: 1500px;
	
	border: 3px solid pink;
	
}

.admin_main_category:hover {
	color: white;
}

.admin_main_category:active {
	color: pink;
}

.admin_main_right_menu {
	width: 600px;
	height: 300px;
	
	float: left;
	margin-top: 50px;
	margin-left: 50px;
	text-align: center;
}
</style>

</head>
<body>

	<%@ include file="../common/header.jsp"%>

	<div id="contents2">

		<div id="admin_main_left">
			<br /> <br />
			<p>
				<a href="?a=1" class="admin_main_category"> 메인관리 </a>
			</p>
			<br />

			<p>
				<a href="?a=2" class="admin_main_category"> 회원관리 </a>
			</p>
			<br />

			<p>
				<a href="?a=3" class="admin_main_category"> 제품관리 </a>
			</p>
			<br />
		
			<p>
				<a href="?a=4" class="admin_main_category"> </a>
			</p>
			<br />

			<p>
				<a href="?a=5" class="admin_main_category"> </a>
			</p>
			<br />

		</div>


		<div id="admin_main_right">
			<%
				String a = request.getParameter("a");
				if (a == null || a.equals("1")) {
			%>
			<div class="admin_main_right_menu">
				<a href=""><img src="<%=WebURL%>/semiImages/member_manage.png" alt="" /></a>
			</div>
			<div class="admin_main_right_menu">
				<a href=""><img src="<%=WebURL%>/semiImages/product_manage.png" alt="" /></a>
			</div>
		<%-- 	<div class="admin_main_right_menu">
				<a href=""><img src="<%=WebURL%>/semiImages/logo.jpg" alt="" />판매현황</a>
			</div>
			<div class="admin_main_right_menu">
				<a href=""><img src="<%=WebURL%>/semiImages/logo.jpg" alt="" />게시판관리</a>
			</div> --%>
			<%
				}else if(a.equals("2")){
			%>
			
			<div class="container" style="width : 1400px ; margin-left: 0px">
				
				<h3>회원관리</h3>
				
					<%@ include file="./adminMember.jsp" %>
				
			</div>	
				
			<%
				}else if(a.equals("3")){
			%>
				<h3>제품관리</h3>
				
				<%@ include file="./adminProduct.jsp" %> 	
			<%
				}
			%>

		</div>

	</div>



	<%@ include file="../common/footer.jsp"%>
</body>
</html>