<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판 글등록</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script> -->
</head>
<body>
	<form:form modelAttribute="board" action="write.sdj" method="post" enctype="multipart/form-data" name="f">
		<table border="1" cellpadding="0" cellspacing="0">
			<caption>SPRING 게시판</caption>
	
				<tr>
					<td align="center">제목</td>
					<td><form:input path="b_subject"/>
						<font color="red"><form:errors path="b_subject"/></font></td>
				</tr>
				<tr>
					<td align="center">내용</td>
					<td><form:textarea rows="15" cols="80" path="b_content"/>
						<font color="red"><form:errors path="b_content"/></font></td>
				</tr>
				<tr>
					<td align="center">첨부파일</td>
					<td><input type="file" name="b_file" id="b_file" multiple></td>
				</tr>
				<tr>
					<td><input type="hidden" name="b_category" value="${param.b_category }"></td>
				</tr>
				<tr>
					<td><input type="hidden" name="b_state" value="0"></td>
				</tr>
				<tr>
					<td><input type="hidden" name="b_date" value="0"></td>
				</tr>
				<tr>
					<td><input type="hidden" name="b_people" value="0"></td>
				</tr>
				
				<tr>
					<td align="center" colspan="2"><a href="javascript:document.f.submit()">[게시물등록]</a>
					<a href="list.sdj">[게시물목록]</a></td>
				</tr>
		</table>
	<div id="preview">
	</div>
	</form:form>
</body>
</html>