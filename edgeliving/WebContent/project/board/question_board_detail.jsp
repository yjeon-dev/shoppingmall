<%@page import="vo.CommentsVO"%>
<%@page import="dao.CommentsDAO"%>
<%@page import="vo.JoinBoardsMemberProdVO"%>
<%@page import="vo.BoardsVO"%>
<%@page import="dao.JoinBoardsMemberProdDAO"%>
<%@page import="dao.BoardsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<title>상품 Q&A</title>
<link rel="stylesheet" href="../css/main.css" type="text/css" />
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>

<script type="text/javascript">
	
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

 #btn_guide {
	width: 110px;
	height: 40px;
	margin-right: 30px;
	font-size: 15px;
}

#btn_product {
	width: 110px;
	height: 40px;
	font-size: 15px;
} 


#btn_guide:hover, #btn_product:hover {
	background: pink;
	font-weight: bold;
}


	#whole_table{
	border: 1px solid black;

/* text-align: center; */
	}

	#whole_table {
	width: 800px;
	margin: auto;
	}


	#whole_table {
	border-collapse: collapse;
	/* text-align: center; */
	}

	#head_title{
	
	margin-left: 500px;
	

}s


</style>



<body>


	<%@ include file="../common/header.jsp"%>
	<div class="blank"></div>

	<div id="titlearea">
		<h3 id="title">customer service</h3>
		<a href="userguide_list_board.jsp"><input type="button" value="이용안내FAQ" id="btn_guide" /></a>
 		<a href="question_list_board.jsp"><input type="button" value="상품Q&A" id="btn_product" /></a>

	</div>


	<table class="table table-striped table-bordered" style="width:900px;" id="whole_table">
	

		<%
		
		String b = request.getParameter("bno");
		
		if (b != null) {
			//숫자로 형변환
			int bno = Integer.parseInt(b);
		


		JoinBoardsMemberProdDAO jDAO = new JoinBoardsMemberProdDAO();
		
		int boardgroup = 3;
		JoinBoardsMemberProdVO jvo = jDAO.getOne(boardgroup, bno);
		System.out.println("vo"+ jvo);
	
		%>
	
		<div id="head_title">
			<p id="head_title2"><h4>상품 Q&A | 상품Q&A입니다</h4></p>
		</div>
		
		
	
		<tr>
			<th style= "width: 150px;">제목</th>
			<td><%=jvo.getBtitle() %></td>
		</tr>
		
		
		<tr>
			<th>작성자</th>
			<td><%=jvo.getId() %></td>
		</tr>
		
		<tr>
			<th>작성일</th>
			<td><%=jvo.getBdate() %></td>
		</tr>
		
		
		<tr>
			<th>내용</th>
			<td><%=jvo.getBdesc() %></td>
		</tr>
		
		<tr>
			<th>답변</th>
			<%
			CommentsDAO coDAO = new CommentsDAO();
			CommentsVO coVo = coDAO.getOne(bno);
			
			if(mVO == null){
			%>
			<td><%=coVo.getCdesc() %></td>
			<%	
			}else{
				
			
			
				if(mVO.getAuthority() >= 99){
			%>
				<td>
					<form action="question_board_detail_comment.jsp">
						<input type="hidden" name="bno" value="<%=jvo.getBno() %>" />
						<input type="hidden" name="mno" value="<%=jvo.getMno() %>" />
						<textarea name="comments" id="" cols="90" rows="10"></textarea>
						<input type="submit" value="작성" />
					</form>
				</td>
			<%
				}else{
					
			%>
				<td><%=coVo.getCdesc() %></td>
			<%				
				}
			}
			%>
			
		</tr>
		
		<tr>
		<td colspan="2"><a href="question_list_board.jsp"><input type="button" value="목록" /></a></td>	
		</tr>
		<tr>
			
		</tr>
		
	</table>
	
	




	<div class="blank"></div>
	
	<%@ include file="../common/footer.jsp"%>
	<% } %>
</body>
</html>