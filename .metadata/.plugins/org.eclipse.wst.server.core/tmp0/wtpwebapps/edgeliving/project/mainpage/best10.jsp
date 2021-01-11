
<%@page import="java.text.DecimalFormat"%>

<%@page import="java.util.ArrayList"%>
<%@page import="vo.ProductVO"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%
		String column = "recommend";
		ProductDAO dao = new ProductDAO();
		ArrayList<ProductVO> list = dao.top10(column);
		DecimalFormat df = new DecimalFormat("#,###");
		
	%>
	
		<div id="best10">
			<div id="best10Text"> JHTA Top 10 </div>
			<div id="best10ImgDiv">
					<%
						for(ProductVO vo : list){
						int price = (int)(vo.getPrice() * (1 - (vo.getDiscount() * 0.01)));
					
						
					%>
					<div class="best10Div">
					
					<div id ="going_detail">
					<a href="./mainpage/productdetail.jsp?pno=<%=vo.getPno()%>">
					
						<div>	<img src="<%=vo.getThumbNailImg() %>" alt="<%=vo.getPname() %>" class="best10Img" />
						<p style="font-size: 13px;">
						<%
							int length = vo.getPname().length();
							if(length >= 19 ){
						%>
							<%= vo.getPname().substring(0,15) + "..." %>
						<%				
							}else{
						%>
							<%= vo.getPname() %>
						<%		
							}
						%>
						</a>
						</div>
						</p>
					
					</div>
					<p class="mainPrice"><%=df.format(vo.getPrice()) %>원 </p>
					 <strong class="strongPrice"> <%=df.format(Math.round(price * 0.01)*100) %>원</strong></div>
					<%
						}
					%>
			
			</div>
		</div>