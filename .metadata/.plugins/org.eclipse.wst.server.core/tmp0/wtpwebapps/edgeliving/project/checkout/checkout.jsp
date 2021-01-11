<%@page import="jdk.management.resource.internal.TotalResourceContext"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="vo.ProductVO"%>
<%@page import="dao.MemberDAO"%>
<%@page import="dao.ProductDAO"%>
<%@page import="dao.CartDAO"%>
<%@page import="vo.CartVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 결제</title>
<link rel="stylesheet" href="../css/main.css" type="text/css" />
<!-- <link rel="stylesheet" href="../css/checkout.css" type="text/css" /> -->
<style>

#checkout_pay_complete{
	height: 100vh;
    width: 100%;
    position: fixed;
    left: 0;
    top: 0;
	background:rgba(0,0,0,0.5);
    display: none;
	
}
#checkout_pay_complete_msg{
	width: 30vh;
	height: 50vh;
	position: fixed;
	left:50em;
	top: 10em;
	background: white;
	border-radius: 20px;
}
#checkout_pay_complete_msg_brand{
	text-align: center;
	margin-top: 10px;	
	width: 100%;
}
#checkout_pay_complete_msg_price{
	text-align: center;
	margin-top: 60px;
	margin-bottom: 40px;
}
/* #checkout_pay_complete_msg_price{
	margin-left: 60px;
	margin-top: 70px;
	margin-bottom: 40px;
} */

#checkout_pay_complete_img{
	border-radius: 20px;
	margin-left: 45px;
    margin-top: 10px;
}
#checkout_pay_complete_msg_ok{
	margin-left: 60px;
}
#checkout_pay_complete_msg_cancel{
	margin-left: 15px;
}
h1,h2,h3,h4,h5,a,p{
	padding:0; margin:0;
	/* list-style:none; */
	display: inline;
	}

img{
	/* margin-top:5px; */
	display:inline-block;
	vertical-align: middle;
	padding-left: 10px;
	padding-right: 10px;
}
img:hover{
	cursor: pointer;
}
#previous{
	float: right;
}
select{
	height: 26px;
}
#checkout_addr input{
	padding-bottom: 5px;
	margin: 3px 0px 3px 0px;
	margin-right: 5px;
	margin-left: 5px;
}
.squareimg{
	vertical-align: middle;
}
p{
	text-align: right;
	padding-right: 10px;
}
tr{
	width: 100%;
	border-bottom: 1px solid gray;
}
#checkout_container {
	width: 1200px;
	margin: 0px auto;
	/* font-family :'나눔고딕', 'Malgun Gothic', sans-serif; */
	padding-top: 30px;
	font-size: 12px;
}
#checkout_title_area{
	padding-bottom: 20px;
}
.checkout_warntxt {
	color: #f76560;
	font-size: 12px;
	background: #ffe9df;
	height: 40px;
	padding-top: 10px;
	padding-left: 20px;	
	border: 1px solid #ff9393;
	border-left-style: none;
	border-right-style: none;
	vertical-align: middle;
}
.checkout_warntxt ul,li{
	display: inline;
}	

.checkout_warntxt_ul {
	list-style: none;
}

.checkout_sub_title {
	color: #353535;
	background: #f6f6f6;
	height: 60px;
	padding-top: 20px;
	padding-left: 10px;
	border: 1px solid #d7d5d5;
	/* overflow:hidden; */
	border-left-style: none;
	border-right-style: none;
	vertical-align: text-bottom;
	
}
.checkout_sub_title h3{
	float:left;
}
.checkout_sub_title p{
	float:right;
}
#checkout_list_table input{
	border-style: hidden;
}
#checkout_list_table{
	border-collapse: collapse;
	border-spacing: inherit;
}
#checkout_list_table_head{
	font-size: 12px;
	font-weight: 100;
}
#checkout_addr{
	margin-top: 50px;
	margin-bottom: 50px;

}
#checkout_addr>table{
	border-collapse: collapse;
	width: 100%;
}
#checkout_addr th{
	padding-right: 30px;
	border-collapse: collapse;
	font-weight: 200;
	text-align: left;	
	
}
#checkout_addr tr{
	border-bottom: 1px solid #bbbbbb;
	height: 50px;
}
.cellnumber{
	width: 90px;
}
/* #checkout_addr tr.{
	border-bottom: 1px solid gray;
} */
#checkout_total_area{
	width: 100%;
	height: 200px;
}
#checkout_order_total{
	width: 100%;
	
}
#checkout_order_total table{
	width: 100%;
	height: 100%;
	border-bottom: 2px solid black;
	border-top: 2px solid black;
	border-collapse: collapse;
	border-spacing: 0px;
}
#checkout_list_table_head{
	width: 100%;
	border-bottom: 1px solid gray;	

}

#checkout_list_table_head th, td{
	height: 50px;
	vertical-align: top;
	border-bottom: 1px solid gray;
}

#checkout_list_table_body{
	width: 100%;
}
#checkout_list_table_body tr{
	height: 90px;	
}
#checkout_list_table_body td{
	vertical-align: middle;
}
#checkout_list_table_foot{
	width: 100%;
}
#checkout_product_price{
	width: 50px;
	border-style: none;
}
#checkout_delievery_fee{
	width: 50px;
}

/* #checkout_list_table_foot input{
	width: 40px;
} */

#checkout_order_total tr{
	height: 90px;
	text-align: center;
}
#checkout_list_table_foot td{
	text-align: right;
}

#checkout_pay_area{
	width: 100%;
	height: 300px;
	border: 1px solid black;
}
#checkout_pay_method{
	height: 15%;
	width: 75%;
	float: left;
}
#checkout_pay_method_desc{
	width: 100em;
	margin-top: 50px;
}
#checkout_pay_method_card{
	width: 75%;
	height: 85%;	
	float: left;
}
#checkout_pay_method_phone{
	width: 75%;
	display: none;
}
#checkout_pay_method_smilepay{
	width: 75%;
	display: none;
}
#checkout_total{
	float: right;
	height: 100%;
	width: 25%;
	text-align: right;
	border-left: 1px solid black;
}
#checkout_total h4{
	margin-left: 80px;
    font-size: 12px;
    padding-right: 13px;
    
}
#checkout_total input{
	border-style: hidden;
    font-size: xx-large;
    margin-left: 30px;
    width: 200px;
    padding-left: 10px;
    margin-top: 20px;
    margin-right: 10px;
}
#checkout_total img{
	margin-left: 27px;
    margin-top: 30px;
}
#checkout_total_point{
	width: 100%;
	height: 30%;
	border-top: 1px solid black;
	margin-top: 22px;
}
#checkout_interest_free{
	border: 1px solid gray;
	margin-top: 50px;
	height: 120px;
}
#checkout_interest_free_head{
	background: #f9f9f9;
	height: 30%;
	border-bottom: 1px solid grary;
	padding-top: 5px;
    padding-left: 5px;

}
#checkout_interest_free_body{
	height: 80px;
	font-size: small;
    
    
}
#checkout_interest_free_body li{
	display: list-item;
	list-style-position: inside;
}
#checkout_conditions{
	border: 1px solid gray;
	margin-top: 50px;
	height: 635px;
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
	


</style>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<%
		String cartno = request.getParameter("cartno");
		System.out.println(cartno);
		CartDAO cDAO2 = null;
		CartVO cVO2 = null;
		int pno = 0;
		int mno = 0;
		ProductDAO pDAO2 = null;
		MemberDAO mDAO2 = null;
		ProductVO pVO2 = null;
		MemberVO mVO2 = null;
		Object checkoutObj = null;
		int qty = 0;
		int price = 0;
		int price2 = 0;
		int totalprice = 0;

		// 1/9길준영 추가
		String mname = null;
		String addrpost = null;
		String addrbasic = null;
		String addrdetail = null;
		String phone = null;
		String email1 = null;
		String email2 = null;
		String cellnumber0 = null;
		String cellnumber1 = null;
		String cellnumber2 = null;
		String cellnumber3 = null;
		//int mnovo = Integer.parseInt(request.getParameter("mno"));
		checkoutObj = session.getAttribute("vo");
		if(checkoutObj != null){
			
		
		if (cartno != null) {
			cDAO2 = new CartDAO();
			cVO2 = cDAO2.getOne(cartno);
			pno = cVO2.getPno();
			mno = cVO2.getMno();
			System.out.println(mno);
			pDAO2 = new ProductDAO();
			mDAO2 = new MemberDAO();
			pVO2 = pDAO2.getOne(pno);
			mVO2 = mDAO2.getOne(mno);
			price = (int) (pVO2.getPrice() * (1 - (pVO2.getDiscount() * 0.01)));
			price2 = pVO2.getPrice();
			totalprice = cVO2.getCartquty() * price;
			// 1/9 길준영 추가
			mname = mVO2.getMname();
			addrpost = mVO2.getAddrpost();
			addrbasic = mVO2.getAddrbasic();
			addrdetail = mVO2.getAddrdetail();
			email1 = mVO2.getEmail().substring(0, mVO2.getEmail().indexOf("@"));
			email2 = mVO2.getEmail().substring(mVO2.getEmail().indexOf("@") + 1, mVO2.getEmail().length());

			/////////번호 스플릿해서 빼옴//////////////
			cellnumber0 = mVO2.getPhone();
			String[] cell = new String[3];
			for (int i = 0; i < 3; i++) {
				cell[i] = cellnumber0.split("-")[i];
			}
			cellnumber1 = cell[0];
			cellnumber2 = cell[1];
			cellnumber3 = cell[2];
		} else {

			checkoutObj = session.getAttribute("vo");
			MemberVO mVO3 = (MemberVO) checkoutObj;
			String strpno = request.getParameter("pno");
			String strqty = request.getParameter("qty");
			qty = Integer.parseInt(strqty);
			mno = mVO3.getMno();
			pno = Integer.parseInt(strpno);
			pDAO2 = new ProductDAO();
			mDAO2 = new MemberDAO();
			pVO2 = pDAO2.getOne(pno);
			mVO2 = mDAO2.getOne(mno);
			price = (int) (pVO2.getPrice() * (1 - (pVO2.getDiscount() * 0.01)));
			price2 = pVO2.getPrice();
			totalprice = qty * price;

			// 1/9 길준영 추가
			mname = mVO2.getMname();
			addrpost = mVO2.getAddrpost();
			addrbasic = mVO2.getAddrbasic();
			addrdetail = mVO2.getAddrdetail();
			email1 = mVO2.getEmail().substring(0, mVO2.getEmail().indexOf("@"));
			email2 = mVO2.getEmail().substring(mVO2.getEmail().indexOf("@") + 1, mVO2.getEmail().length());

			/////////번호 스플릿해서 빼옴//////////////
			cellnumber0 = mVO2.getPhone();
			String[] cell = new String[3];
			for (int i = 0; i < 3; i++) {
				cell[i] = cellnumber0.split("-")[i];
			}
			cellnumber1 = cell[0];
			cellnumber2 = cell[1];
			cellnumber3 = cell[2];

		}
	%>


	<script>
	window.onload=function(){
		var checkout_postcode = document.getElementById("checkout_postcode");
		checkout_postcode.onclick=openKakaoPostcode;
		//var checkout_pay = document.getElementById("checkout_pay");
		//checkout_pay.onclick=checkout_pay;
		$("#checkout_pay_complete_msg_cancel").on("click",function(){
			document.getElementById("checkout_pay_complete").style.display="none";
		});

		$("#checkout_pay").on("click",function(){
			
		document.getElementById("checkout_pay_complete").style.display = "block";
		})
		
		$("#checkout_pay_complete_msg_ok").on("click",function(){
			console.log("gdgd");
			document.frm.action="ckeckout_ok.jsp";
			document.frm.method="post";
			document.frm.submit();
		})
		
	}
	function openKakaoPostcode(){
		//경량 데이터 교환 방식 
		// JSON : JavaScript Object Notation
		//{name : value, name1 : value}
		new daum.Postcode({
			oncomplete: function(data){
				//console.dir(data);
				//팝업에서 검색결과 항목을 클릭했을때
				//실행할 코드를 작성하는 부분
				document.getElementById("post1").value=data.zonecode;
				document.getElementById("orderaddr1").value=data.address;
			}
	}).open();
	}
	
	function newaddr2(){
		document.getElementById("checkout_name").value=""
		document.getElementById("post1").value="";
		document.getElementById("orderaddr1").value="";
		document.getElementById("orderaddr2").value="";
		document.getElementById("email1").value="";
		document.getElementById("email2").value="";
		document.getElementById("cellnumber2").value="";
		document.getElementById("cellnumber3").value="";
		
		}
	function basicaddr2(){
		document.getElementById("checkout_name").value="<%=mname%>";
		document.getElementById("post1").value="<%=addrpost%>";
		document.getElementById("orderaddr1").value="<%=addrbasic%>";
		document.getElementById("orderaddr2").value="<%=addrdetail%>";
		document.getElementById("email1").value="<%=email1%>";
		document.getElementById("email2").value="<%=email2%>";
		document.getElementById("cellnumber2").value="<%=cellnumber2%>";
		document.getElementById("cellnumber3").value="<%=cellnumber3%>";
		}

		//////////이메일 도메인 선택 함수//////////////////////////////////////////////		
		function selectdomain(obj) {
			var domain = document.getElementById("domain");
			document.getElementById("email2").value = obj.value;
		}

		//////////////결제 함수////////////////////////////////////////////////////
	/* 	function checkout_pay() {

			document.getElementById("checkout_pay_complete").style.display = "block";
		} */
///////////////// 1/10 오후 길준영 추가/////////////////////////////////////////
		$(document).ready(function(){
			$('input[name="checkout_method"]').change(function(){
		        if($('#card').prop('checked')){
		        	document.getElementById("checkout_pay_method_card").style.display="block";
		    		document.getElementById("checkout_pay_method_phone").style.display="none";
		    		document.getElementById("checkout_pay_method_smilepay").style.display="none";
		        }else if($('#phone').prop('checked')){
		        	document.getElementById("checkout_pay_method_card").style.display="none";
		    		document.getElementById("checkout_pay_method_phone").style.display="block";
		    		document.getElementById("checkout_pay_method_smilepay").style.display="none";
		        }else if($('#smilepay').prop('checked')){
		        	document.getElementById("checkout_pay_method_card").style.display="none";
		    		document.getElementById("checkout_pay_method_phone").style.display="none";
		    		document.getElementById("checkout_pay_method_smilepay").style.display="block";
		        }
		        });
				});
	</script>
	<%
		DecimalFormat df = new DecimalFormat("#,###");
	%>

	<%@ include file="../common/header.jsp"%>

	<form action="ckeckout_ok.jsp" method="post" name="frm">
		<!-- 히든으로 보내줄것들 -->
		<input type="hidden" name="pno2" value=<%=pno%> /> 
		<input	type="hidden" name="price2" value=<%=price2%> /> 
		<input	type="hidden" name="dc2" value=<%=pVO2.getDiscount()%> />

	
		<!-- checkout_pay_complete end -->

		<div id="checkout_container">
			<div id="checkout_title_area">
				<h2>주문서작성</h2>
			</div>
			<div class="checkout_warntxt">
				<ul class="checkout_warntxt_ul">
					<li><img src="../../semiImages/checkout_warntxt.gif" alt="느낌표" />상품의
						옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</li>
				</ul>
			</div>



			<div id="checkout_list">
				<div class="checkout_sub_title">
					<h4>국내배송상품 주문내역</h4>
				</div>
				<div id="checkout_list_table">
					<table>
						<thead id="checkout_list_table_head">
							<tr height="50px">
								<th width="15%">이미지</th>
								<th width="50%">상품정보</th>
								<th width="5%">판매가</th>
								<th width="5%">수량</th>
								<th width="5%">적립금</th>
								<th width="10%">배송구분</th>
								<th width="5%">배송비</th>
								<th width="5%">합계</th>
							</tr>
						</thead>
						<tbody id="checkout_list_table_body">
							<tr>

								<th width="15%"><img src="<%=pVO2.getThumbNailImg()%>"
									alt="" style="width: 70px; height: 70px;" /></th>
								<th width="50%"><%=pVO2.getBrandName()%> <br /> <%=pVO2.getPname()%></th>
								<th width="5%"><%=df.format(price)%>원</th>
								<%
									if (cartno != null) {
								%>
								<th width="5%"><%=df.format(cVO2.getCartquty())%> <input
									type="hidden" name="qty2" value="<%=cVO2.getCartquty()%>" />
								</th>

								<th width="5%"><%=df.format((price / 100) * cVO2.getCartquty())%></th>
								<th width="10%">기본배송</th>
								<th width="5%">2,500원</th>
								<th width="5%"><%=df.format(price * cVO2.getCartquty() + 2500)%>원
								</th>
								<%
									} else {
								%>
								<th width="5%"><%=qty%> <input type="hidden" name="qty2"
									value="<%=qty%>" /></th>

								<th width="5%"><%=df.format((price / 100) * qty)%></th>
								<th width="10%">기본배송</th>
								<th width="5%">2,500원</th>
								<th width="5%"><%=df.format(price * qty + 2500)%>원</th>
								<%
									}
								%>

							</tr>
						</tbody>
						<tfoot id="checkout_list_table_foot">
							<tr>
								<td colspan="9">
									<%
										if (cartno != null) {
									%> 상품구매금액<input type="text" name="" id="checkout_product_price"
									value="<%=df.format(price * cVO2.getCartquty())%>" /> + 배송비<input
									type="text" name="" id="checkout_delievery_fee" value="2,500" />
									= 합계 : <input type="text" name="" id=""
									value="<%=df.format(price * cVO2.getCartquty() + 2500)%>" /><strong>원</strong>
									<%
										} else {
									%> 상품구매금액<input type="text" name="" id="checkout_product_price"
									value="<%=df.format(price * qty)%>" /> + 배송비<input type="text"
									name="" id="checkout_delievery_fee" value="2,500" /> = 합계 : <input
									type="text" name="" id=""
									value="<%=df.format(price * qty + 2500)%>" /><strong>원</strong> <%
 	}
 %>

								</td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>

			<!-- <div class="checkout_warntxt">
			<ul class="checkout_warntxt_ul">
				<li><img src="../../semiImages/checkout_warntxt.gif" alt="느낌표" />상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</li>
			</ul>
			</div> -->

			<div id="checkout_addr">
				<div class="checkout_sub_title">
					<h4>배송 정보</h4>
					<p>
						<img src="../../semiImages/checkout_require.gif" alt="" /> 필수정보입력
					</p>


				</div>
				<table>
					<tr>
						<th>배송지 선택</th>
						<td><input type="radio" id="basicaddr" name="addrchoice" value="basicaddr" checked onclick="basicaddr2();" />회원 정보와 동일
						<input	type="radio" id="newaddr" name="addrchoice" value="newaddr"	onclick="newaddr2();" />새로운 배송지
						<img class="squareimg"	src="../../semiImages/checkout_addrchoice.gif" alt="주소록보기" style="padding-left: 10px" />
						</td>
					</tr>
					<tr>
						<th>받으시는 분<img src="../../semiImages/checkout_require.gif"
							alt="" /></th>
						<td><input type="text" name="checkout_name" id="checkout_name"
							value="<%=mname%>" /></td>
					</tr>
					<tr>
						<th>주소<img src="../../semiImages/checkout_require.gif" alt="" /></th>
						<td><input type="text" name="post1" id="post1"
							value="<%=addrpost%>" /><img class="squareimg"
							src="../../semiImages/checkout_postcode.gif" alt=""
							id="checkout_postcode" /><br /> <input type="text"
							name="orderaddr1" id="orderaddr1" value="<%=addrbasic%>"
							size="35px" />기본주소<br /> <input type="text" name="orderaddr2"
							id="orderaddr2" value="<%=addrdetail%>" size="35px" />나머지주소</td>
					</tr>
					<tr>
						<th>휴대전화<img src="../../semiImages/checkout_require.gif"
							alt="" /></th>
						<td><select name="number" id="op">
								<option value="010">010</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
						</select> - 
						<input type="text" name="cellnumber2" id="cellnumber2"	class="cellnumber" value="<%=cellnumber2%>" /> - 
						<input	type="text" name="cellnumber3" id="cellnumber3"	class="cellnumber" value="<%=cellnumber3%>" />
						</td>
					</tr>
					<tr>
						<th>이메일<img src="../../semiImages/checkout_require.gif"
							alt="" /></th>
						<td><input type="text" name="" id="email1"
							value="<%=email1%>" /> @ <input type="text" name="" id="email2"
							value="<%=email2%>" /> <select
							onchange="javascript:selectdomain(this);" name="email"
							id="domain">
								<option value="이메일선택" selected>-이메일 선택-</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="yahoo.com">yahoo.com</option>
								<option value="gmail.com">gmail.com</option>
						</select> <br />
							<p>
								이메일을 통해 주문처리 과정을 보내드립니다. <br /> 이메일 주소란에는 반드시 수신가능한 이메일 주소를 입력해
								주세요.
							</p></td>
					</tr>
					<tr>
						<th>배송메시지</th>
						<td><textarea name="receivemsg" id="receivemsg" cols="100" rows="4"
								placeholder="배송시 "></textarea></td>
					</tr>
				</table>
			</div>
			<div class="checkout_sub_title">
				<h4>결제 예정 금액</h4>
			</div>
			<div id="checkout_total_area">
				<div id="checkout_order_total">
					<table>
						<thead>
							<tr>
								<th width="33.33%">총 주문 금액</th>
								<th width="33.33%">총 할인 + 부가결제 금액</th>
								<th width="33.33%">총 결제 예정 금액</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<%
									if (cartno != null) {
								%>
								<td><%=df.format(price)%>원</td>
								<td>0원</td>
								<td><%=df.format(price * cVO2.getCartquty() + 2500)%>원</td>
								<%
									} else {
								%>
								<td><%=df.format(price)%>원</td>
								<td>0원</td>
								<td><%=df.format(price * qty + 2500)%>원</td>
								<%
									}
								%>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="checkout_sub_title">
				<h4>결제수단</h4>
				<input type="checkbox" name="checkbox111" id="checkbox111" />결제수단과 입력 정보를 다음에도 사용
			</div>
			<div id="checkout_pay_area">
				<div id="checkout_pay_method">
					<input type="radio" name="checkout_method" id="card" checked value="신용카드"/>신용카드
					<input type="radio" name="checkout_method" id="phone" value="휴대폰 결제"/>휴대폰 결제 
					<input type="radio" name="checkout_method" id="smilepay" value="스마일 페이"/>스마일 페이
				<div id="checkout_pay_method_desc">
				<div id="checkout_pay_method_card">
					<strong>이름 : </strong><input type="text" style="margin-left: 24px" /><br /><br />
					<strong>카드번호 : </strong><input type="text" /> - <input type="text" /><br />
					<br /> <strong>유효기간 : </strong><input type="text" /> - <input
						type="text" /><br />
					<br /> <strong>비빌번호 : </strong><input type="password" name=""
						id="" />
				</div>
				<div id="checkout_pay_method_phone">
					<strong>이름 : </strong><input type="text"  style="margin-left:35px"/><br /><br />
					<strong>휴대폰번호 : </strong><input type="text" /> - <input
						type="text" /><input type="button" value="휴대폰 인증"
						style="margin-left:10px" /><br />
					<br /> <strong>인증 번호 : </strong><input type="text" style="margin-left:10px"/> - <input
						type="text" /><br />
					<br />
				</div>
				<div id="checkout_pay_method_smilepay">
					<strong>이름 : </strong><input type="text" style="margin-left: 31px" /><br /><br />
					<strong>스마일페이: </strong><input type="text" /> - <input type="text" /><br />
					<br /> <strong>유효기간 : </strong><input type="text" style="margin-left: 5px"/> - <input
						type="text" /><br />
					<br /> <strong>비빌번호 : </strong><input type="password" name=""
						id="" />
				</div>
				</div>
				</div>
				<div id="checkout_total">
						
					<h4>
						<span>최종 결제 금액</span>
					</h4>
					<input type="text" style="text-align:right "id="checkout_total_payment" value=
					"<%if (cartno != null) {%><%=df.format(price * cVO2.getCartquty() + 2500)%>원<%} else {%><%=df.format(price * qty + 2500)%>원<%}%>" /><br />
					<img src="../../semiImages/checkout_pay.gif" alt="결제이미지"
						id="checkout_pay" onclick="checkout_pay();" />
					<div id="checkout_total_point"><strong>예정 적립 포인트
						<%if(cartno!=null) {%>
						<%=df.format((price / 100) * cVO2.getCartquty())%>
						<%
						}else{
						%>
						<%=
						df.format((price / 100) * qty)
						%>								
						<%
						}
						%>원</strong>
					</div>
				</div>
			</div>
	
			
		</div>
						<div id="checkout_pay_complete">
		<!-- checkout_pay_area end -->
				<div id="checkout_pay_complete_msg">
				<img src="<%=pVO2.getThumbNailImg()%>" alt=""
					style="width: 200px; height: auto;" id="checkout_pay_complete_img" /><br />
				<div id="checkout_pay_complete_msg_brand">
					<strong><%=pVO2.getBrandName()%></strong><br />
				</div>
				
			
				<div id="checkout_pay_complete_msg_price">
					<%
						if (cartno != null) {
					%>
					<strong>상품구매금액</strong> :
					<%=df.format(price * cVO2.getCartquty())%>
					<br /> <strong>배송비</strong> : 2500 <br /> <strong>합계</strong> :
					<%=df.format(price * cVO2.getCartquty() + 2500)%><strong>원</strong> <br />
					<%
						} else {
					%>
					<strong>상품구매금액</strong> :<%=df.format(price * qty)%>" /><br /> <strong>배송비</strong>
					:<%=df.format(price * qty + 2500)%>"/><strong>원</strong>
					<%
						}
					%>
				</div>
				<div id="checkout_pay_complete_msg_confirm_button">
<!-- 					<input type="submit" value="결제확인" id="checkout_pay_complete_msg_ok" /> -->
					<input type="button" value="결제확인" id="checkout_pay_complete_msg_ok" />
					<input type="button" value="취소하기"
						id="checkout_pay_complete_msg_cancel" />
				</div>




			</div>
		</div>
	</form>
	<div id="checkout_interest_free">
		<div id="checkout_interest_free_head">
			<h4>무이자 할부 이용안내</h4>
		</div>
		<div id="checkout_interest_free_body">
			<ul>
				<li>무이자할부가 적용되지 않은 상품과 무이자할부가 가능한 상품을 동시에 구매할 경우 전체 주문 상품 금액에
					대해 무이자할부가 적용되지 않습니다.</li>
				<li>무이자할부를 원하시는 경우 장바구니에서 무이자할부 상품만 선택하여 주문하여 주시기 바랍니다.</li>
			</ul>
		</div>
	</div>

	<div id="checkout_conditions">
		<div id="checkout_conditions_head">
			<h4>이용안내</h4>
		</div>
		<div id="checkout_conditions_body">
			<div id="checkout_conditions_1">
				<h5>WindowXP 서비스팩2를 설치하신후 결제가 정상적인 단계로 처리되지 않는경우, 아래의 절차에 따라
					해결하시기 바랍니다.</h5>
				<ol>
					<li>안심클릭 결제모듈이 설치되지 않은 경우 ActiveX 수동설치</li>
					<li>Service Pack 2에 대한 Microsoft사의 상세안내</li>
				</ol>
			</div>

			<div id="checkout_conditions_2">
				<h5>아래의 쇼핑몰일 경우에는 모든 브라우저 사용이 가능합니다.</h5>
				<ol>
					<li>KG이니시스, KCP, LG U+를 사용하는 쇼핑몰일 경우</li>
					<li>결제가능브라우저 : 크롬,파이어폭스,사파리,오페라 브라우저에서 결제 가능<br />(단, window
						os 사용자에 한하며 리눅스/mac os 사용자는 사용불가)
					</li>
					<li>최초 결제 시도시에는 플러그인을 추가 설치 후 반드시 브라우저 종료 후 재시작해야만 결제가 가능합니다.
						<br />(무통장, 휴대폰결제 포함)
					</li>
				</ol>
			</div>

			<div id="checkout_conditions_3">
				<h5>세금계산서 발행 안내</h5>
				<ol>
					<li>부가가치세법 제 54조에 의거하여 세금계산서는 배송완료일로부터 다음달 10일까지만 요청하실 수 있습니다.</li>
					<li>세금계산서는 사업자만 신청하실 수 있습니다.</li>
					<li>배송이 완료된 주문에 한하여 세금계산서 발행신청이 가능합니다.</li>
					<li>[세금계산서 신청]버튼을 눌러 세금계산서 신청양식을 작성한 후 팩스로 사업자등록증사본을 보내셔야
						세금계산서 발생이 가능합니다.</li>
					<li>[세금계산서 인쇄]버튼을 누르면 발행된 세금계산서를 인쇄하실 수 있습니다.</li>
				</ol>
			</div>

			<div id="checkout_conditions_4">
				<h5>부가가치세법 변경에 따른 신용카드매출전표 및 세금계산서 변경안내</h5>
				<ol>
					<li>변경된 부가가치세법에 의거, 2004.7.1 이후 신용카드로 결제하신 주문에 대해서는 세금계산서 발행이
						불가하며</li>
					<li>신용카드매출전표로 부가가치세 신고를 하셔야 합니다.(부가가치세법 시행령 57조)</li>
					<li>상기 부가가치세법 변경내용에 따라 신용카드 이외의 결제건에 대해서만 세금계산서 발행이 가능함을 양지하여
						주시기 바랍니다.</li>
				</ol>
			</div>

			<div id="checkout_conditions_5">
				<h5>현금영수증 이용안내</h5>
				<ol>
					<li>현금영수증은 1원 이상의 현금성거래(무통장입금, 실시간계좌이체, 에스크로, 예치금)에 대해 발행이
						됩니다.</li>
					<li>현금영수증 발행 금액에는 배송비는 포함되고, 적립금사용액은 포함되지 않습니다.</li>
					<li>발행신청 기간제한 현금영수증은 입금확인일로 부터 48시간안에 발행을 해야 합니다.</li>
					<li>현금영수증 발행 취소의 경우는 시간 제한이 없습니다. (국세청의 정책에 따라 변경 될 수 있습니다.)</li>
					<li>현금영수증이나 세금계산서 중 하나만 발행 가능 합니다.</li>
				</ol>
			</div>
		</div>
	</div>


	
	<!-- container end -->


	<%@ include file="../common/footer.jsp"%>
	<%
		}else{
			response.sendRedirect("../index.jsp");
		}
	%>
</body>
</html>