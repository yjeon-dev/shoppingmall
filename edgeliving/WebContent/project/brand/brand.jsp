<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>브랜드</title>
<link rel="stylesheet" href="../css/main.css" type="text/css" />

</head>


    <style>
    
    	#total{
    		width: 1300px;
   			margin: 0px auto;
    	}
    	
    	#container{
    		margin: 0px auto;
    	}
    
		.country1{
			float: left;
   			margin-right: 100px;
			padding: 30px 20px;
		}
		
		.country2{
			margin-right: 100px;
			padding: 30px 20px;
		}
		.country1, .country2 {
			
			border-bottom: 1px solid gray;
		}
		
		
		img {
			padding: 20px 20px;
		}

		#blank{
			width: 500px;
			height: 200px;
		
		}

        
    </style>


<body>



	<%@ include file="../common/header.jsp"%>
	
	
	<div id="total">
	
	<div id="brand">
	<img src="../../semiImages/brand.jpg" alt="" />
	</div>
 
 <!-----------------------------------------------------------------  -->
 	<div id="container">

	<div class="country1">
	<img src="../../semiImages/poland.jpg" alt="" />
	
	<div id="poland">
	<a href="/edgeliving/project/product/prodlist.jsp?cate_no=4"><img src="../../semiImages/poland_milena.jpg" alt="" /></a>
	<a href="/edgeliving/project/product/prodlist.jsp?cate_no=3"><img src="../../semiImages/poland_zark.jpg" alt="" /></a>
	</div>
	</div>
	
	
 <!-----------------------------------------------------------------  -->
 
	<div class="country2">
	<img src="../../semiImages/russia.jpg" alt="" />
	
	<div id="russia">
	<a href="/edgeliving/project/product/prodlist.jsp?cate_no=5"><img src="../../semiImages/russia_imperial.jpg" alt="" /></a>
	</div>
	</div>


<!-----------------------------------------------------------------  -->
	<div class="country1">
	<img src="../../semiImages/czech.jpg" alt="" />

	<div id="czech">	
	<a href="/edgeliving/project/product/prodlist.jsp?cate_no=7"><img src="../../semiImages/czech_cheski.jpg" alt="" /></a>
	<a href="/edgeliving/project/product/prodlist.jsp?cate_no=8"><img src="../../semiImages/czech_cristal.jpg" alt="" /></a>
	</div>
	</div>
	
	
<!-----------------------------------------------------------------  -->

	<div class="country2">
	<img src="../../semiImages/england.jpg" alt="" />
	
	<div id="england">
	<a href="/edgeliving/project/product/prodlist.jsp?cate_no=6"><img src="../../semiImages/england_roayl.jpg" alt="" /></a>
	</div>
	</div>
	
<!-----------------------------------------------------------------  -->

	<div class="country1">
	<img src="../../semiImages/portugal.jpg" alt="" />
	
	<div id="portugal">
	<a href="/edgeliving/project/product/prodlist.jsp?cate_no=10"><img src="../../semiImages/portugal_altamira.jpg" alt="" /></a>
	<a href="/edgeliving/project/product/prodlist.jsp?cate_no=11"><img src="../../semiImages/portugal_bizew.jpg" alt="" /></a>
	</div>
	</div>
<!-----------------------------------------------------------------  -->

	<div class="country2">
	<img src="../../semiImages/korea.jpg" alt="" />
	
	<div id="korea">
	<a href="/edgeliving/project/product/prodlist.jsp?cate_no=9"><img src="../../semiImages/bonita_masterclass.jpg" alt="" /></a>
	</div>
	</div>	
	
<!-----------------------------------------------------------------  -->	
</div>
</div>	


	<div id="blank"></div>

<%@ include file="../common/footer.jsp"%>


</body>
</html>