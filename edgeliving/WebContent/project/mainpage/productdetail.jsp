<%@page import="java.text.DecimalFormat"%>
<%@page import="vo.ProductVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품정보</title>
<link rel="stylesheet" href="../css/main.css" type="text/css" />
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>

<%
 
   String p = request.getParameter("pno");
   DecimalFormat df = new DecimalFormat("#,###");
   
   if(p!=null){
      int pno = Integer.parseInt(p);
      
      ProductDAO dao = new ProductDAO();
      ProductVO vo = dao.getOne(pno);
      

%>


<style type="text/css">

  	#container{
	width: 1500px;
	margin: auto;
	}
	
	
	.blank {
	width: 1500px;
	height: 30px;
}

	#productdetail_thumbnailImg {
		width: 400px;
		height:400px;
		float: left;
		margin-left: 100px;
		margin-right: 50px;
				
	}
	
	
	
	
	#big_table {
	border-top: 2px solid gray;
	border-bottom: 2px solid gray;
	width: 600px;
	font-size: 13px;
	float: left;
	
	}
	
	.boxarea1{
		width: 100px;
		height:100px;
		border: 1px solid gray;
		float: left;
		margin-left: 100px;
		padding-top: 30px;
		font-size: 15px;
		text-align: center;
		
	}
	
	.boxarea2{
		width: 100px;
		height: 100px;
		border: 1px solid gray;
		float: left;
		margin-left: 100px;
		padding-top: 30px;
		font-size: 15px;
		text-align: center;
		
	}
	
	
	.block{
		width: 100px;
		height: 100px;
		font-size: 15px;
		text-align: center;
	
	}
	
	.boxarea2:hover, .boxarea1:hover{
		background : pink;
	}

	#buy, #cart, #wish {
	width: 150px;
	height: 50px;
	
	}
	
	#buy {
	background: #222222;
	width : 200px;
	color: white;
	}

#buy:hover, #cart:hover, #wish:hover {
   background: pink;
   font-weight: bold;
}
	
	
	#detail_img_table{
	width: 1200px;
	height: 100px;
	margin: auto;
	border-bottom: 2px solid gray;

	
	}
	#detail_img{
	margin: auto;
	}
	
	#detail_img_division{
	width:1000px;
	text-align:center;
	margin: auto;
	
	}
	
	#plus, #minus{
		width: 25px;
		height: 18px;
		font-size: 10px;
		font-weight: bold;
	}

	.table_middle_row {
	border-bottom: 2px solid gray;
	}

	#totalprice{
	font-weight: bold;
	font-size: 15px;
	text-align: right;
	
	}
   
</style>




<script type="text/javascript">
   
   
	$(function(){

		
		
		$("#buy").on("click",function(){
			document.frm.action="../checkout/checkout.jsp";
			document.frm.method="post";
			document.frm.submit();
		})
	   <%
	   Object proddetailObj = session.getAttribute("vo");
	   %>
	 
	   
	   $("#cart").on("click", function(){
		   
			
         	var pnoval = $("#pno").val();
         	var qtyval = $("#num").val();
         	var totalpriceval = $("#totalprice").val();
		   	window.open("./cartDialog.jsp?pno="+pnoval+"&qty="+qtyval+"&totalprice="+totalpriceval,"new","width=550,height=500,top=200,left=200");
			
     });

	   
      
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




<body>
   <%@ include file="../common/header.jsp"%>
   <div class="blank"></div>
   
   

   <form name="frm">
      <input type="hidden" name="pno" id="pno" value="<%=vo.getPno() %>"  />
   
   
   
   
   
   <div id="container">
      <div id="pic">
      <img src="<%=vo.getThumbNailImg() %>" alt="<%=vo.getPname() %>" id="productdetail_thumbnailImg" />
      
      
      </div>
      
      <div id="info">
         <table id="big_table">
            <tr>
               <td colspan="3"><h2><%=vo.getPname() %></h2><p class="table_middle_row"></p></td>
            </tr>
            
            <tr>
               <td>소비자가<br></td>
               <td><del><%=df.format(vo.getPrice()) %>원</del><br></td>
               <td></td>
            </tr>
         
            
            <tr>
               <td><h3>판매가</h3></td>
               <td><h3><%=df.format(Math.round((vo.getPrice()*(1-vo.getDiscount()*0.01))/100) *100)%>원</h3></td>
               <td></td>
            </tr>
            
            <tr>
               <td>제조사</td>
               <td><%=vo.getBrandName() %></td>
            </tr>
            
            <tr>
               <td>대분류</td>
               <td><%=vo.getLargeCategory() %></td>
            </tr>
            
            <tr>
               <td>배송비</td>
               <td>2,500원 (30,000원 이상 구매 시 무료)</td>
            </tr>
            
            
            
            
            <tr>
               
               <%
                  int length = vo.getPname().length();
                  if(length >= 19 ){
               %>
                  <td><%= vo.getPname().substring(0,15) + "..." %><br></td>
               <%            
                  }else{
               %>
                  <td><%=vo.getPname()%><br></td>
               <%      
                  }
               %>
               
               
               <td>

               <table>
                  <tr>
                  <td rowspan="3">
                   <input type="text" name="qty" id="num" size="1" value=1 /><br> 
                  <!-- <input type="text" name="qty" id="qty" size="1" value=1 /><br> -->
                  </td>   
                  </tr>
                  <tr>
                  <td colspan="3" >
                  <input type="button" value="△" id="plus" onclick="add()" /><br>
                  <input type="button" value="▽" id="minus" onclick="minus2()" />  
                   <br>
                  </td>
                  </tr>
               
               
               
               </table>
               
               </td>
               
               
               <td></td>
            </tr>
            
               <script>
               
                  function  add(num){
                  var num = document.getElementById("num");
                  num.value = num.value*1+1;
                  
                  var totalprice = document.getElementById("totalprice");
                  totalprice.value = (totalprice.value/(num.value*1-1)*(num.value));
                  
                  
               }
                  
                  function btn_like2(){
                	
              			alert("<%=vo.getPname()%>을 \r\n추천하셨습니다.");
              			<%
              			int pnopno = vo.getPno();
              			dao.raiseLike(pnopno); %>
              			
              			
              			
              		                	  
                  }
                  
               function minus2(num){
                           
                     var num = document.getElementById("num");
                     num.value = num.value*1-1;   
                        
                     
                     if(num.value <= 0){      
                        alert("1개 보다 적게 구입할 수는 없습니다.");
                        num.value=1;
                        //고치기
                        totalprice2.value = totalprice2.value*(num*1+1); 
                     }else{
                     var totalprice2 = document.getElementById("totalprice");
                     console.log("현재 토탈 가격 표시" + totalprice2.value);
                     console.log("수식 적용 가격" + totalprice2.value/(num.value*1+1));
                     console.log("수향: " + num.value);
                     totalprice2.value = (totalprice2.value/(num.value*1+1)*(num.value));
                        
                     }

                  
                     
                  }
                  
                  
                  
               </script>
            

            <tr>
               <td><h3>Total Price</h3></td>
                   
                   
               <td><h3><input type="text" name="totalprice" id="totalprice" size="10" value="<%= Math.round((vo.getPrice()*(1-vo.getDiscount()*0.01))/100) *100 %>" readonly />원
               
               </h3></td>
            </tr>
            
            <tr>
               <td>
               
               
               <input type="button" value="BUY NOW"  id="buy"/></td>
               
               
               <td><input type="button" value="ADD TO CART" id="cart"/>
               
               
               <a href="viewcart.jsp"><input type="button" value="WISHLIST" id="wish" /></a>
               
               </td>
               
            </tr>
      
         </table>
         	<!--  추가 -->
         	<div class="boxarea1">
					<div class=""><input type="button" value="Like!☆"  id="btn_like" onclick="btn_like2();" /><br>좋아요</div>
			</div>
						
			<div class="boxarea2">
					<div class="">상품문의 <a href="../board/question_write_board.jsp?pno=<%=vo.getPno()%>"><br>쓰기</a></div>
			</div>
      </div>
   </div>
      </form>
   
   
   
   
   <table id="detail_img_table">
      <tr>
         <td><h2>상품 상세 정보</h2></td>
      </tr>
   </table>
      
   

   <div id="detail_img_division">
       <%=vo.getDetailDesc() %>
   </div>    
   
   <div id="dialog" title="공지사항" style="display: none; text-align: center;">
    <h3> 장바구니에 추가 하시겠습니까? </h3>
    <img src="<%=vo.getThumbNailImg() %>" alt="" style="width: 200px; height: 200px;" />
    <%= vo.getPname() %><br>
    	    
	</div>    
   <%
      } 
   %>
   


   <div class="blank"></div>
   
   
   
   <%@ include file="../common/footer.jsp"%>
</body>
</html>