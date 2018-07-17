<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<%--
	/WebContent/model1/board/updateForm.jsp
	1. num 파라미터에 해당하는 게시물을 DB에서 조회하여 Board 객체 저장
	2. Board 객체에 내용을 화면에 출력하기
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SPRING 게시판</title>
<script type="text/javascript">
	function file_delete(){
		document.f.file2.value="";
		file_desc.style.display = "none"; //보이지 않도록 style속성 설정
	}
</script>
</head>

<body>
	<form:form modelAttribute="board" action="update.sdj" method="post"
		enctype="multipart/form-data" name="f">
		<%--
			file2 : file의 정보를 저장하는 파라미터
		--%>
		<input type="hidden" name="b_no" value="${board.b_no }">
		<input type="hidden" name="file2" value="${board.b_fileurl }">
		<input type="hidden" name="pageNum" value="${param.pageNum }">
		<table border="1" cellpadding="0" cellspacing="0">
			<caption>SPRING 게시판</caption>
			<tr>
				<td align="center">제목</td>
				<td><form:input path="b_subject" /> <font color="red"><form:errors
							path="b_subject" /></font></td>
			</tr>
			<tr>
				<td align="center">내용</td>
				<td><textarea rows="15" cols="80" name="b_content">${board.b_content }</textarea></td>
			</tr>
			<tr>
				<td align="center">첨부파일</td>
				<td><c:if test="${!empty board.b_fileurl }">
						<div id="file_desc">
							<a href="file/${board.b_fileurl }">${board.b_fileurl }</a>. <a
								href="javascript:file_delete()">[첨부파일 삭제]</a>
						</div>
					</c:if> <input type="file" name="b_file"></td>
			</tr>
			<tr>
				<td align="center" colspan="2"><a
					href="javascript:document.f.submit()">[게시판수정]</a></td>
			</tr>
		</table>
	</form:form>
</body>
</html>