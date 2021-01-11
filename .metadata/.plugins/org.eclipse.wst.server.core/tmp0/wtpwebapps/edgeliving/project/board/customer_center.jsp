<%@page import="vo.JoinBoardsMemberProdVO"%>
<%@page import="dao.JoinBoardsMemberProdDAO"%>
<%@page import="dao.BoardsDAO"%>
<%@page import="vo.ReviewVO"%>
<%@page import="dao.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
<link rel="stylesheet" href="../css/main.css" type="text/css" />
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>

<script type="text/javascript">

$(function(){

	 var jbOffset = $("#topMenu").offset();
     console.log(jbOffset);
     $(window).scroll(function(){
        
        if($(document).scrollTop() > jbOffset.top){
           $("#topMenu").addClass("jbFixed");
           $("#contents").addClass("bodyDown");
        }else{
           $("#topMenu").removeClass("jbFixed");
        }
     });
});


</script>



<style>

	.blank {
	width: 1500px;
	height: 50px;
	}
	
	
	#titlearea {
	width: 1200px;
	height: 160px;
	text-align: center;
	margin: auto;
	margin-bottom : 100px;
 	border-bottom : 1px solid gray;
	font-size: 25px;
	color: gray;
	}
	
	
	#uparea {
	width: 800px;
	height: 200px;
	
	margin: auto;
	border: 1px solid red;
	margin-bottom : 50px;
	
	}
	
	
	#uparea {
	width: 800px;
	height: 200px;
	
	margin: auto;
	border: 1px solid gray;
	margin-bottom : 50px;
	
	}
	
	
	#bottomarea_detail {
	width: 800px;
	height: 300px;
	text-align: center;
	margin: auto;
	border: 1px solid gray;	
	} 
	
	
	#uparea_notice {
	margin: auto;
	}
	
	
	
	.sum_img {
		width: 90px;
		height: 90px;	
	}	
	
	.one_question {
		float: left;
		margin-left: 20px;
		width : 120px;
	
	}
	
	#btn_guide{
		width: 110px;
		height: 40px;
		margin-right: 30px;
	}
	
	#btn_product{
		width: 110px;
		height: 40px;
	}
	
  	#btn_guide:hover, #btn_product:hover {
   background: pink;
   font-weight: bold;
	}

	.underline {
	border-bottom: solid 1px gray;
	}
	
	ul {
    list-style: none;
   
 }
 
#bottomarea_notice{
	width: 900px;
	margin: auto;
}

 #bottom_name{
 	margin-left: 90px; 

}

	
</style>


<body>





 	<%@ include file="../common/header.jsp"%>
 	<div class="blank"></div>
 	
 	<div id="titlearea">
 		<h3 id="title">customer service</h3>
 		<a href="userguide_list_board.jsp"><input type="button" value="이용안내FAQ" id="btn_guide" /></a>
 		<a href="question_list_board.jsp"><input type="button" value="상품Q&A" id="btn_product" /></a>
 	
 	</div>


 	
 	<div id="uparea">
 		<table id="uparea_notice">
 		
   				
	<%-- 	<%
		
		String b = request.getParameter("bno");
		
		if (b != null) {
			//숫자로 형변환
			int bno = Integer.parseInt(b);
		


		JoinBoardsMemberProdDAO jDAO2 = new JoinBoardsMemberProdDAO();
		
		int boardgroup2 = 1;
		JoinBoardsMemberProdVO jvo2 = jDAO2.getOne(boardgroup2, bno);
		System.out.println("vo"+ jvo2);
	
		%>   --%>
 		
 
 		
		<tr>
			<td><h3>이용안내FAQ</h3></td>
			<td><a href="userguide_list_board.jsp">더보기 ></a> </td>
		</tr>
		


		


 			<tr>
 			 
 				<td class="underline" style="width:500px;"><%-- <a href="userguide_board_detail.jsp?bno=<%=jvo2.getBno() %>"> --%> Q. 당일배송</a></td>
 				
 				
 				<td class="underline">2019-12-20</td>
 			</tr>
 			<tr>
 				<td class="underline">Q. 결제문의</td>
 				<td class="underline">2019-10-11</td>
 			</tr>
 			<tr>
 				<td class="underline">Q. 배송문의</td>
 				<td class="underline">2019-08-01</td>
 			</tr>
 			<tr>
 				<td class="underline">Q. 반품&교환시 배송비는 얼마인가요?</td>
 				<td class="underline">2017-04-09</td>
 			</tr>
 			
 		</table>
 		
 		
<%--  		
<% } %>  --%>
	
 	</div>
 	
 	
 	<div id="bottomarea_detail">
 	
 		<%
	BoardsDAO bDAO = new BoardsDAO();

	JoinBoardsMemberProdDAO jDAO = new JoinBoardsMemberProdDAO();
	
	int boardgroup = 3;
	
	%>
 	
 	

 			
 			<table>
 				<tr>
 					<td><h3 id="bottom_name">상품Q&A</h3></td>
 					<td><a href="question_list_board.jsp">더보기 ></a></td>
 				</tr>
 			</table>
			
 			
 			<ul>
			 
			
 	
 		 	<%
		ArrayList<JoinBoardsMemberProdVO> list = jDAO.top5(boardgroup);
		for (JoinBoardsMemberProdVO vo : list) {
 			%>
 	
			
 			
 			<li class="one_question">
 			<!-- <a href="#"> -->
 			<%
 			if(vo.getPname().equals(" " )){
 			%>
 			<img src="../../semiImages/logo.png" alt="" class="sum_img"  /><br>
 			<%	
 			}else{
 			%>
 			<img src="<%=vo.getThumbnailimg() %>" alt="" class="sum_img"  /><br>
 			<%	
 			}
 			
 			%>
 			
 			
 			<%=vo.getBtitle() %><br>
 		<!-- 	</a> -->
 			<span><%=vo.getBdate() %></span>
 			<%
				}	
			%>
 			</li>
 		
 		
 		</ul>
			
 	</div>
 	
 	
 	
 	<div class="blank"></div>
 	<%@ include file="../common/footer.jsp"%>
</body>
</html>