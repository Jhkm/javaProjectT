<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판 목록</title>
<script type="text/javascript">
	function list(pageNum) {
		var searchType = document.searchform.searchType.value;
		if(searchType == null || searchType.length == 0) {
			document.searchform.searchContent.value = "";
			document.searchform.pageNum.value = "1";
			location.href="list.sdj?pageNum=" + pageNum;
		} else {
			document.searchform.pageNum.value = pageNum;
			document.searchform.submit();
			return true;
		}
		return false;
	}
</script>
</head>
<body>
<table width="100%" border="1" cellpadding="0" cellspacing="0">
	<tr><td colspan="5" align="center">
		<form action="list.sdj" method="post" name="searchform" onsubmit="return list(1)">
		<input type="hidden" name="pageNum" value="1">
		<input type="hidden" name="b_category" value="${param.b_category }">
 		<select name="searchType" id="searchType">
			<option value="">선택하세요</option>
			<option value="subject">제목</option>
			<option value="name">작성자</option>
			<option value="content">내용</option>
		</select>&nbsp;
		<script type="text/javascript">
			if('${param.searchType}' != '') {
				document.getElementById("searchType").value = '${param.searchType}'
			}
		</script>
		<input type="text" name="searchContent" value="${param.searchContent }">
		<input type="submit" value="검색">
		</form>
	</td></tr>
	<c:if test="${listcount > 0}">
		<tr align="center" valign="middle">
			<td colspan="4">Spring 게시판</td><td>글개수:${listcount }</td></tr>
			<tr align="center" valign="middle" bordercolor="#212121">
				<th width="8%" height="26">번호</th>
				<th width="50%" height="26">제목</th>
				<th width="14%" height="26">글쓴이</th>
				<th width="17%" height="26">날짜</th>
				<th width="11%" height="26">조회수</th>
			</tr>
			<c:forEach var="board" items="${boardlist }">
				<tr align="center" valign="middle" bordercolor="#333333"
				onmouseover="this.style.backgroundColor='#5CD1E5'"
				onmouseout="this.style.backgroundColor=''">
				<td height="23">${boardcnt }</td>
				<c:set var="boardcnt" value="${boardcnt - 1 }" />
				<td align="left">
					<c:if test="${not empty board.b_fileurl }">
						<a href="../file/${board.b_fileurl }">@</a>
					</c:if>
					<c:if test="${empty board.b_fileurl }">&nbsp;&nbsp;&nbsp;</c:if>
				<c:forEach begin="1" end="${board.b_reflevel }">&nbsp;&nbsp;&nbsp;</c:forEach>
					<c:if test="${board.b_reflevel > 0}">└</c:if>
					<a href="detail.sdj?b_no=${board.b_no }&pageNum=${pageNum}&b_category=${board.b_category}">${board.b_subject }</a></td>
					<td align="left">${board.g_id }</td>
					<td align="center">${board.b_regtime }</td>
					<td align="left">${board.b_readcnt }</td>
				</tr>
			</c:forEach>
			<tr align="center" height="26"><td colspan="5">
				<c:if test="${pageNum > 1 }">
				<a href="javascript:list(${pageNum -1 })">[이전]</a>
				</c:if>&nbsp;
				<c:if test="${pageNum <= 1 }">[이전]</c:if>&nbsp;
				<c:forEach var="a" begin="${startpage }" end="${endpage }">
				<c:if test="${a == pageNum }">[${a }]</c:if>
				<c:if test="${a != pageNum }">
					<a href="javascript:list(${a})">[${a }]</a>
				</c:if>
				</c:forEach>
				<c:if test="${pageNum < maxpage}">
				<a href="javascript:list(${pageNum + 1 })">[다음]</a>
				</c:if>&nbsp;
				<c:if test="${pageNum >= maxpage }">[다음]</c:if>&nbsp;
				</td></tr>
	</c:if>
	<c:if test="${listcount == 0 }">
	<tr><td colspan="5">등록된 게시물이 없습니다.</td></tr>
	</c:if>
	<tr><td align="right" colspan="5">
		<a href="write.sdj?b_category=${param.b_category }">[글쓰기]</a></td></tr>
</table>
</body>
</html>