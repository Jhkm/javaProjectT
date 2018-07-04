<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<%-- /WebContent/model2/board/info.jsp 
	1. action 클래스 작성
	2. info.jsp 수정하기 (el, jstl)
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시물 상세 보기</title>
</head>
<body>
	<table align="center" border="1" cellpadding="0" cellspacing="0">
		<tr>
			<td colspan="2" align="center">SPRING 게시판</td>
		</tr>
		<tr>
			<td>글쓴이</td>
			<td>${board.g_id}</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>${board.b_subject}</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<table border="0" width = "400" height="250">
					<tr>
						<td>${board.b_content }</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td>&nbsp;
				<c:if test="${!empty board.b_fileurl }">
					<a href="../file/${board.b_fileurl }">${board.b_fileurl }</a>
				</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<a href="update.sdj?b_no=${board.b_no }&pageNum=${param.pageNum}&b_category=${param.b_category}">[수정]</a>
				<a href="delete.sdj?b_no=${board.b_no }&pageNum=${param.pageNum}&b_category=${param.b_category}">[삭제]</a>
				<a href="list.sdj?pageNum=${param.pageNum }&b_category=${param.b_category}">[목록]</a>
			</td>
		</tr>
	</table>
	<form:form modelAttribute="reply" action="r_reply.sdj" name="f">
		<input type="hidden" name="b_no" value="${board.b_no}">
		<input type="hidden" name="pageNum" value="${param.pageNum}">
		<table>
		<tr><td align="center">내용</td><td><textarea rows="4" cols="80" name="r_content" style="color:black;"></textarea></td></tr>
		<tr><td align="center" colspan="2"><a href="javascript:document.f.submit()">[댓글등록]</a></td></tr>
		</table>
	</form:form>
	<div>
	
	</div>
</body>
</html>