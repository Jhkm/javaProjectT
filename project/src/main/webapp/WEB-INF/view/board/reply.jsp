<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<%-- /WebContent/model1/board/replyForm.jsp
	1. 원글의 정보 : num, ref, reflevel, refstep
	2. 답변글로 입력 된 정보 
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>답글 작성</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="//cdn.rawgit.com/fgelinas/timepicker/master/jquery.ui.timepicker.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=IOAxpv0_yEzY_13m7xPn&submodules=geocoder"></script>
<script
	src='//cdn.rawgit.com/fgelinas/timepicker/master/jquery.ui.timepicker.js'></script>
<style>
.ui-timepicker {
	font-size: 6px;
	width: 200px;
}
.w3-btn {margin-bottom:10px;}
.all {
	margin-left:22%;
	margin-right:24%;
	padding-top:5%;
}
.all{
font-size : 20px;
font-family: "Nanum Pen Script", sans-serif;
}
</style>
</head>
<body>
<div class="all">
	<div style="max-width: 100%;">
		<div class="w3-container" align="center">
			<label>글작성하기</label>
		</div>
		<form:form action="reply.sdj" method="post" name="f" modelAttribute="board" enctype="multipart/form-data">
			<form:hidden path="m_id" value="${loginUser }" />
			<div class="w3-cell-row">
				<div class="w3-container w3-teal w3-cell"
					style="width: 20%; vertical-align: middle;">
					<label>제목</label>
				</div>
				<div class="w3-container w3-sand w3-cell w3-cell-bottom"
					align="left" style="max-width: 80%;">
					<form:input class="w3-input w3-sand" path="b_subject" value="Re:${board.b_subject }"/>
					<font color="red"><form:errors path="b_subject" /></font>
				</div>
			</div>
			<div class="w3-cell-row" style="margin-top:1%">
				<div class="w3-container w3-teal w3-cell" style="width: 20%;">
					<label>내용</label>
				</div>
				<div class="w3-container w3-sand w3-cell w3-cell-bottom"
					align="left" style="max-width: 80%;">
					<textarea rows="15" cols="80" name="b_content"></textarea>
				</div>
			</div>
			<div class="w3-cell-row" style="margin-top:1%">
				<div class="w3-container w3-teal w3-cell" style="width: 20%;">
					<label>첨부파일</label>
				</div>
				<div class="w3-container w3-sand w3-cell w3-cell-bottom"
					align="left" style="max-width: 80%;">
					<input type="file" name="b_file" id="b_file" multiple>
				</div>
			</div>
			  <input type="hidden" name="pageNum" value="${param.pageNum }">
    		  <input type="hidden" name="b_no" value="${board.b_no }">
     		  <input type="hidden" name="b_category" value="${board.b_category }">
    		  <input type="hidden" name="b_ref" value="${board.b_ref }">
    		  <input type="hidden" name="b_reflevel" value="${board.b_reflevel }">
     		  <input type="hidden" name="b_refstep" value="${board.b_refstep }">
	
			<c:if test="${param.i_no == null}">
				<input type="hidden" name="i_no" value="0">
			</c:if>
			<c:if test="${param.i_no != null}">
				<input type="hidden" name="i_no" value="${param.i_no}">
			</c:if>
			<div class="w3-cell-row w3-right" style="margin-top:1%;">
					<button class="w3-btn w3-white w3-border w3-border-blue w3-round-large" value="submit">답글 등록 </button>
		
				 <a	href="list.sdj"><button class="w3-btn w3-white w3-border w3-border-blue w3-round-large">게시물 목록</button></a>
			</div>
			<div class="w3-cell-row" id="preview"></div>
		</form:form>
	</div>
</div>
</body>
</html>