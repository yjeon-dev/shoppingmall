<%@page import="vo.JoinReviewOrderMemProdVO"%>
<%@page import="dao.ReviewDAO"%>
<%@page import="dao.JoinReviewOrderMemProdDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<title>생생후기</title>
<link rel="stylesheet" href="../css/main.css" type="text/css"/>
	 <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">   </script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script type="text/javascript" src="./js/main.js"></script>
    
    <script>
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
	.review_thumbnail{
		width: 70px;
		height: 70px;
	}
	#review_contents{
		margin: 0px auto;
		width: 1200px;
	}
	#review_header{
		margin: 0px auto;
		width : 500px;
		text-align: center;
		margin-top: 110px;
		margin-bottom: 80px;
	}
	.star-rating { width:100px; }
	.star-rating,.star-rating span { display:inline-block; height:20px; overflow:hidden; background:url(../../semiImages/star.png)no-repeat; }
	.star-rating span{ background-position:left bottom; line-height:0; vertical-align:top; }
	</style>
</head>
<body>
<%
	
	JoinReviewOrderMemProdDAO jDAO = new JoinReviewOrderMemProdDAO();
	ReviewDAO rDAO = new ReviewDAO();
	int totalCount = rDAO.getTotalCount();
	int recordPerPage = 10;
	int totalPage = (totalCount % recordPerPage == 0)
			? totalCount / recordPerPage
			: totalCount / recordPerPage + 1;

	String cp = request.getParameter("cp");
	int currentPage = 0;
	if (cp != null) {
		currentPage = Integer.parseInt(cp);
	} else {
		currentPage = 1;
	}

	int startNo = (currentPage - 1) * recordPerPage + 1;
	int endNo = currentPage * recordPerPage;
	int startPage = 1;
	int endPage = totalPage;

	//시작페이지 끝페이지의 미세조정
	if (currentPage <= 5) {
		startPage = 1;
	} else if (currentPage >= 6) {
		startPage = currentPage - 4;
	}
	//끝페이지의 미세조정
	//현재페이지가 17이면 맨마지막페이지가18
	if (totalPage - currentPage <= 5) {
		endPage = totalPage;
	} else if (totalPage - currentPage > 5) {
		if (currentPage <= 5) {
			if (totalPage > 10) {
				endPage = 10;
			} else {
				endPage = totalPage;
			}
		} else {
			endPage = currentPage + 4;
		}

	}
%>
<%
	ArrayList<JoinReviewOrderMemProdVO> list = jDAO.reviewAll(startNo, endNo);
%>
	<%@ include file="../common/header.jsp"%>
	
	<div id="review_contents">
		<div id="review_header">
			<h3>생생후기</h3>
			<h6>상품 사용 후기입니다.</h6>
		</div>
		<table class="table table-striped table-bordered"	style="width: 1200px; text-align: center;vertical-align: middle;font-size: 12px;">
			<tr>
				<th>번호</th>
				<th>이미지</th>
				<th>품명</th>
				<th>후기내용</th>
				<th>작성자</th>
				<th>평점</th>
				<th>등록일</th>
			</tr>
			<%
				for(JoinReviewOrderMemProdVO vo : list){
			%>
			<tr style="height:80px;">
				<td style="width:60px"><%=vo.getReviewno() %></td>
				<td style="width:80px; height: 80px;"><img src="<%=vo.getThumbnailimg() %>" alt="" class="review_thumbnail"/></td>
				<td style="width:150px"><%=vo.getPname() %></td>
				<td style="width:500px"><%=vo.getProdreview() %></td>
				<td style="width:130px"><%=vo.getId() %></td>
				<%-- <td style="width:200px"><%=vo.getRate() %></td> --%>
				<td style="width:80px; text-align: left;" ><span class="star-rating"><span style="width:<%=vo.getRate()*20%>%"></span></span></td>
				<td style="width:200px"><%=vo.getReviewdate() %></td>		
				
			</tr>
			<%	
				}
			
			%>
		
		</table>	
			<nav aria-label="Page navigation example">
					<ul class="pagination" style="width:100px">
						<li class="page-item">
							<a class="page-link" href="review.jsp?cp=1" aria-label="Previous">
        					<span aria-hidden="true">&laquo;</span>
     						 </a>
						</li>
			<%
					for (int i = startPage; i <= endPage; i++) {
				%> <!-- 누를때마다 커런트페이지가 바뀌도록  --> 
						<li class="page-item"><a class="page-link"	href="review.jsp?cp=<%=i%>"><%=i%></a></li>
				 <%
 			
				}
			%>
					  <li class="page-item">
     					 <a class="page-link" href="review.jsp?cp=<%=endPage %>" aria-label="Next">
       					 <span aria-hidden="true">&raquo;</span>
      					</a>
    		 		 </li>
				</ul>
			</nav>
	</div>
	
	<%@ include file="../common/footer.jsp"%>
</body>
</html>