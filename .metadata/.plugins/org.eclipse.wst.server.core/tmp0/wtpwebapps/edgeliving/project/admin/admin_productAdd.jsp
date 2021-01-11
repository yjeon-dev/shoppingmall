<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품추가 폼</title>
<script src="../../se/js/HuskyEZCreator.js" charset="utf-8"></script>
<style>
	#prodAdd_contents{
		margin: 0px auto;
		width: 1800px;
		height: 1400px;
	}
	.prodAddtext{
		margin : 0px auto;
		display: inline-block;
		width: 200px;
		text-align: center;
	
	}
	.prodAddinput{
		display: inline-block;
		width : 1000px;
		
	}
</style>
</head>
<body>
	<%
	
	%>
	<div id="prodAdd_contents">
		<form action="admin_productAddOk.jsp" method="post"
	enctype="multipart/form-data"  >
	
			<div class="prodAddtext">브랜드</div>
			<div class="prodAddinput"><input type="text" name="brandname" id="brandname" /></div>
			<p></p>
			<div class="prodAddtext">대분류</div>
			<div class="prodAddinput"><input type="text" name="largecategory" id="largecategory" /></div>
			<p></p>
			<div class="prodAddtext">제품이름</div>
			<div class="prodAddinput"><input type="text" name="pname" id="pname" /></div>
			<p></p>
			<div class="prodAddtext">가격</div>
			<div class="prodAddinput"><input type="text" name="price" id="price" /></div>
			<p></p>
			<div class="prodAddtext">할인율</div>
			<div class="prodAddinput"><input type="text" name="discount" id="discount" /></div>
			<p></p>	
			<div class="prodAddtext">제품상세 이미지</div>
			<div class="prodAddinput"><textarea name="contents" id="ir1" cols="150" rows="10" style="width:100%; display:none;"></textarea></div>
			<p></p>
			 <div class="prodAddtext">썸네일 이미지</div>
			<div class="prodAddinput"><input type="file" name="thumbnailimg" id="thumbnailimg" /></div>
			<p></p>
			<div class="prodAddtext">제품설명</div>
			<div class="prodAddinput"><textarea name="pdesc" id="" cols="150" rows="10"></textarea></div>
			<p></p>
			<div class="prodAddtext">재고량</div>
			<div class="prodAddinput"><input type="text" name="qty" id="qty" /></div>
			<p></p>
			<p></p>
			<div class="prodAddinput" style="padding-left: 500px"><input type="submit" value="등록" onclick="submitContents(this);"/></div>
		</form>
	</div>
	<script type="text/javascript">
var oEditors = [];

var sLang = "ko_KR";	// 언어 (ko_KR/ en_US/ ja_JP/ zh_CN/ zh_TW), default = ko_KR

// 추가 글꼴 목록
//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];

nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ir1",
	sSkinURI: "../../se/SmartEditor2Skin.html",	
	htParams : {
		bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		//bSkipXssFilter : true,		// client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
		//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
		fOnBeforeUnload : function(){
			//alert("완료!");
		},
		I18N_LOCALE : sLang
	}, //boolean
	fOnAppLoad : function(){
		//예제 코드
		//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
	},
	fCreator: "createSEditor2"
});

function pasteHTML() {
	var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
	oEditors.getById["ir1"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
	var sHTML = oEditors.getById["ir1"].getIR();
	alert(sHTML);
}
	
function submitContents(elClickedObj) {
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
	
	// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
	
	try {
		elClickedObj.form.submit();
	} catch(e) {}
}

function setDefaultFont() {
	var sDefaultFont = '궁서';
	var nFontSize = 24;
	oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
}
</script>
</body>
</html>