<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.JoinCartMemberProdDAO"%>
<%@page import="vo.JoinCartMemberProdVO"%>
<%@page import="dao.CartDAO"%>
<%@page import="vo.ProductVO"%>
<%@page import="dao.ProductDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<title>Insert title here</title>
<link rel="stylesheet" href="../css/main.css" type="text/css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>
<script>
	$(function() {
		var jbOffset = $("#topMenu").offset();
		console.log(jbOffset);
		$(window).scroll(function() {

			if ($(document).scrollTop() > jbOffset.top) {
				$("#topMenu").addClass("jbFixed");
				$("#contents").addClass("bodyDown");
			} else {
				$("#topMenu").removeClass("jbFixed");
			}
		});

		var ck = document.getElementById("checkAll");
		ck.onclick = function(){

			var items  = document.getElementsByName('ck');
			//console.dir(items);
			for(var i =0 ;i<items.length;i++){
				var box = items[i];
				
				box.checked=ck.checked;
			}
		}
		
		$("#viewcart_list_deleteBtn").on("click",function(){
			document.frm.action="cartDeleteList.jsp";
			document.frm.method="get";
			document.frm.submit();
		})
	 	$("#cart_checkoutBtn").on("click",function(){
			document.frm.action="../checkout/checkout.jsp";
			document.frm.method="post";
			document.frm.submit();
		})
	 
	});
</script>
<style>
#viewcart_contents{
	margin: 0px auto;
	width: 1200px;
	
	
	margin-top: 50px;
	margin-bottom: 150px;
	
}
#viewcart_info{
	width: 1200px;
	height : 73px;
	border : 1px solid #ced4da;
	margin-top: 20px;
	margin-bottom: 20px;
	
}
#viewcart_info1{
	margin : 0px auto;
	width : 100px;
	height: 53px;
	text-align: center;
	border-right : 1px solid #ced4da;
	float: left;
	margin-top: 10px;
	margin-bottom: 10px;
}

#viewcart_info2{
margin : 0px auto;
	width : 1000px;
	height: 73px;
	
	
	display: inline-block;
}
.viewcart_info3class{
	
	width: 990px;
	height: 30px;
	margin-left : 20px;
	padding-top: 7px;
	border-bottom: 1px solid #ced4da;
	font-size: 12px;
}
#checkout_conditions{
	border: 1px solid gray;
	margin-top: 120px;
	
	margin-bottom: 80px;
}

#checkout_conditions_head{
	background: #f9f9f9;
	height: 35px;
	border-bottom: 1px solid grary;
	padding-top: 5px;
    padding-left: 5px;
}
#checkout_conditions_body{
	font-size: small;
    padding-left: 10px;
}
#checkout_conditions_body li{
	display: list-item;
}

#viewcart_deletebtndiv{
	width: 1200px;
	height: 40px;
}
#viewcart_deletebtndiv1{
	display: inline-block;
	width: 300px; 
	height: 30px;
	text-align: left;
	
	font-size: 12px;
}
#viewcart_deletebtndiv2{
	display: inline-block;
	width: 590px; 
	height: 30px;
	text-align: center;
	

	font-size: 12px;
}

#viewcart_deletebtndiv3{
	display: inline-block;
	width: 280px; 
	height: 30px;
	text-align: right;

	font-size: 12px;
}
.pagination{
	width: 100px;
}
</style>

</head>
<body>
<%
	Object viewcartobj = session.getAttribute("vo");
	if(viewcartobj != null){
	MemberVO mVO2 = (MemberVO)viewcartobj;
	CartDAO cDAO = new CartDAO();
	JoinCartMemberProdDAO jDAO = new JoinCartMemberProdDAO();
	int mno = mVO2.getMno();
	int totalCount = cDAO.getTotalCount(mno);
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
	<%@ include file="../common/header.jsp"%>
	
	<%


			ArrayList<JoinCartMemberProdVO> list = jDAO.viewcartAll(startNo, endNo, mno);
		
	%>
	<div id="viewcart_contents">
		<h3>장바구니</h2>
		
		
		<div id="viewcart_info">
			<div id="viewcart_info1">
				<h6>혜택정보</h6>
			</div>
			<div id="viewcart_info2">
				<div class="viewcart_info3class">
				<%
					String strAutority = "일반회원";
					if(mVO2.getAuthority() == 1){
						strAutority = "일반회원";
					}else if(mVO2.getAuthority() == 99){
						strAutority = "관리자";
					}else{
						strAutority = "VIP";
					}
				%>
					<%=mVO2.getMname() %>님은 [<%=strAutority %>] 회원입니다.
				</div>
				<div class="viewcart_info3class">
					사용가능 포인트 : <%=mVO2.getPoint() %>원   
				</div>
			</div>
		</div>
		
		<div id="viewcart_list">
			<h5>상품 (<%=totalCount %>)</h5>
			<form  name="frm">
			<table class="table table-striped table-bordered"	style="width: 1200px; text-align: center">
				<tr style="font-size:14px; ">

					<th><input type="checkbox" id='checkAll' /></th>
					<th>이미지</th>
					<th>상품정보</th>
					<th>판매가</th>
					<th>수량</th>
					<th>적립금</th>
					<th>배송구분</th>
					<th>배송비</th>
					<th>합계</th>
					<th>주문하기</th>
					<th>삭제</th>
				</tr>	
			
				<%
				int iii = 0;
				DecimalFormat df = new DecimalFormat("#,###");
					for(JoinCartMemberProdVO vo : list){
						int price = (int)(vo.getPrice() * (1 - (vo.getDiscount() * 0.01)));
						int totalprice = vo.getCartqty() * price;
						
				%>
				<tr style="height: 80px; text-align: center ;" >
					<td style="width: 70px"><input type="checkbox" name="ck" value="<%=vo.getCartno()%>"/></td>
					<td style="width: 80px; height: 80px;"><img src="<%=vo.getThumbnailimg()%>" alt="<%=vo.getThumbnailimg()%>" width="50px" height="50px" /></td>
					<td style="width: 680px; font-size: 12px; text-align: left; padding-left: 10px;"><%=vo.getPname()%></td>
					<td style="width: 180px;font-size: 12px;"><%=df.format(price)%>원	</td>
					<td style="width: 100px;font-size: 12px;"><%=df.format(vo.getCartqty())%></td>
					<td style="width: 160px;font-size: 12px;"><%=df.format(price/100)%></td>
					<td style="width: 170px;font-size: 12px;">기본배송</td>
					<td style="width: 170px;font-size: 12px;">2,500원<br />조건</td>
					<td style="width: 170px;font-size: 12px;"><%=df.format(totalprice)%>원</td>
				
					<td style="width : 140px;font-size: 12px;">
					<input	type="button" value="주문하기" id="cart_checkoutBtn<%=iii%>" /></td>
					<td  style="width : 70px;;font-size: 12px;">
					<a	href="./cartDelete.jsp?cartno=<%=vo.getCartno()%>">
					<input type="button" value="삭제" id="cartdelete_btn"/></a></td>
					<input type="hidden" name="cartno" value="<%=vo.getCartno()%>" />
		</tr>
		<script>
			$(function(){
				$("#cart_checkoutBtn<%=iii%>").on("click",function(){
					document.frm.action="../checkout/checkout.jsp";
					document.frm.method="post";
					document.frm.submit();
				})
			 
			})
		</script>
				<%	
				iii++;
				}
				%>
			
			</table>
			
		</div>
		<div id="viewcart_deletebtndiv">
			<div id="viewcart_deletebtndiv1"><b style="font-size: 14px;">선택한 것을</b> <input type="button" value="삭제하기" id="viewcart_list_deleteBtn" /></div>
			<div id="viewcart_deletebtndiv2">
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<li class="page-item">
							<a class="page-link" href="viewcart.jsp?cp=1" aria-label="Previous">
        					<span aria-hidden="true">&laquo;</span>
     						 </a>
						</li>
			<%
					for (int i = startPage; i <= endPage; i++) {
				%> <!-- 누를때마다 커런트페이지가 바뀌도록  --> 
						<li class="page-item"><a class="page-link"	href="viewcart.jsp?cp=<%=i%>"><%=i%></a></li>
				 <%
 			
				}
			%>
					  <li class="page-item">
     					 <a class="page-link" href="viewcart.jsp?cp=<%=endPage %>" aria-label="Next">
       					 <span aria-hidden="true">&raquo;</span>
      					</a>
    		 		 </li>
				</ul>
			</nav>
		</div>
			<div id="viewcart_deletebtndiv3"><input type="button" value="장바구니 비우기" /></div>
		</div>
		</form>
	
		
		<div id="checkout_conditions">
			<div id="checkout_conditions_head">
				<h5>이용안내</h5>
			</div>
			<div id="checkout_conditions_body">
				<div id="checkout_conditions_1">
					<h6>장바구니 이용안내</h6>
					<ol>
						<li>해외배송 상품과 국내배송 상품은 함께 결제하실 수 없으니 장바구니 별로 따로 결제해 주시기 바랍니다.</li>
						<li>해외배송 가능 상품의 경우 국내배송 장바구니에 담았다가 해외배송 장바구니로 이동하여 결제하실 수 있습니다.</li>
						<li>선택하신 상품의 수량을 변경하시려면 수량변경 후 [변경] 버튼을 누르시면 됩니다.</li>
						<li>[쇼핑계속하기] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.</li>
						<li>장바구니와 관심상품을 이용하여 원하시는 상품만 주문하거나 관심상품으로 등록하실 수 있습니다.</li>
						<li>파일첨부 옵션은 동일상품을 장바구니에 추가할 경우 마지막에 업로드 한 파일로 교체됩니다.</li>
					</ol>
				</div>
				
				<div id="checkout_conditions_2">
					<h6>무이자할부 이용안내</h6>
					<ol>
						<li>상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만 선택하여 [주문하기] 버튼을 눌러 주문/결제 하시면 됩니다.</li>
						<li>[전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에 대한 주문/결제가 이루어집니다.</li>
						<li>단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을 받으실 수 없습니다.</li>
					</ol>	
				</div>
				
				
			</div>
		</div>
		<nav>
  
	</div>
	<%@ include file="../common/footer.jsp"%>
	<%
	}else{
		response.sendRedirect("../member/login.jsp");	
	}
	%>

</body>
</html>