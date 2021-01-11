<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/main.css" type="text/css" />
</head>
<!-- <script src="/edgeliving/project/se/js/HuskyEZCreator.js" charset="utf-8"></script> -->
<script src="/edgeliving/se/js/HuskyEZCreator.js" charset="utf-8"></script>
<style>

	#headline{
	text-align: center;
	}

	.blank {
	width: 1500px;
	height: 100px;
	}

	#board_total {
	text-align:center;
	margin: auto;
	margin-left: 400px;
	}
	
	#list_button {
	width: 150px;
	height: 30px;
	margin-right: 150px;
	}

	 #cancel_button{
	width: 150px;
	height: 30px;
	margin-right: 50px;
	margin-left: 0px;
	}

	#register_button{
	width: 150px;
	height: 30px;
	background: #222222;
	color: white;
	}
	
	#list_button:hover , #cancel_button:hover, #register_button:hover {
   background: pink;
   font-weight: bold;
	}


</style>

<body>
		
		<%
		Object idobj = session.getAttribute("vo");
		MemberVO vo = (MemberVO)idobj;
		if(idobj != null){
			
			String strpno = request.getParameter("pno");
			int pno = 0;
			if(strpno != null){
				pno = Integer.parseInt(strpno);
				System.out.println(pno);
			}else{
				pno = 0 ;
				System.out.println(pno);
			}
		
		%>

	<%@ include file="../common/header.jsp"%>
	<div class="blank"></div>	
		<!-- 
		나중에 form 태그 주기
		<form action="" method="post" 
		enctype="multipart/form-data" > -->
		
		<form action="question_writeOk.jsp" method="post">
		<h3 id="headline"> 1:1 문의</h3>

		<div id="board_total">
	<table id="write_board">
	<!-- 사진을 전송 할때에는 크기가 크기 때문에 주소창에 글자 다 못들어간다 -->
	<!-- 그래서 post를 사용해야 한다 -->
			<input type="hidden" name="pno" value=<%=pno %> />
			<tr>
			<!-- 	<th>작성자</th> -->
				<td><input type="hidden" name="writer" id="" value="<%=vo.getId()%>" readonly="readonly" /></td>
			</tr>
		
		
		<tr>	
			<td>제목<input type="text" size="50" name="title" id="board_title" /></td>
		</tr>
	
	</table>
		
			<br>
			
		<textarea name="contents3" id="ir1" cols="150" rows="10" style="width:100%; "></textarea>
			<a href="question_list_board.jsp"><input type="button" value="목록" id="list_button"/></a>

			<input type="button" value="등록" id="register_button" onclick="submitContents(this);"/>
			
			<a href="question_list_board.jsp"><input type="button" value="취소" id="cancel_button"/></a>
		
		</div>

	
		</form>	
		
<div class="blank"></div>

<%@ include file="../common/footer.jsp"%>
<%
		}else{
			response.sendRedirect("../member/login.jsp");
		}
%>
</body>
<script type="text/javascript">
		var oEditors = [];

		// 추가 글꼴 목록
		//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "ir1",
			sSkinURI : "/edgeliving/se/SmartEditor2Skin.html",
			htParams : {
				bUseToolbar : true, // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
				fOnBeforeUnload : function() {
					//alert("완료!");
				}
			}, //boolean
			fOnAppLoad : function() {
				//예제 코드
				//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
			},
			fCreator : "createSEditor2"
		});

		function pasteHTML() {
			var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
			oEditors.getById["ir1"].exec("PASTE_HTML", [ sHTML ]);
		}

		function showHTML() {
			var sHTML = oEditors.getById["ir1"].getIR();
			alert(sHTML);
		}

		function submitContents(elClickedObj) {
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.

			// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.

			try {
				elClickedObj.form.submit();
			} catch (e) {
				console.log(e);
			}
		}

		function setDefaultFont() {
			var sDefaultFont = '궁서';
			var nFontSize = 24;
			oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
		}
	</script>
</html>