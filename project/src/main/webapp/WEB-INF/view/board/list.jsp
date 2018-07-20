<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판 목록</title>
<link rel="stylesheet" href="icono.min.css">
<link rel="stylesheet" href="https://icono-49d6.kxcdn.com/icono.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript">
	function list(pageNum) {
		var searchType = document.searchform.searchType.value;
		if(searchType == null || searchType.length == 0) {
			document.searchform.searchContent.value = "";
			document.searchform.pageNum.value = "1";
			location.href="list.sdj?pageNum=" + pageNum +"&b_category="+${b_category};
		} else {
			document.searchform.pageNum.value = pageNum;
			document.searchform.submit();
			return true;
		}
		return false;
	}
</script>
<style>
.w3-btn {margin-bottom:10px;}
	#boardlist {
    	margin-left: 21%;
    	margin-right: 21%;
    	padding-top : 5%;
	}
	.table {
	}
table.type {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
  margin : 20px 10px;
}
table.type th {
border-bottom : 1px solid #ccc;
height : 15%;
}
table.type td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
.all{
font-size : 20px;
font-family: "Nanum Pen Script", sans-serif;
}
</style>
</head>
<body>
<div class="all" >
<div class="w3-container" id="boardlist">
	<c:if test="${param.b_category != '6' }">
	<table class="type" width="100%" cellpadding="0" cellspacing="0">
	<caption>
		<H3><strong><c:if test="${param.b_category == '1'}">플레이후기</c:if>
					<c:if test="${param.b_category == '2'}">팁 게시판</c:if> <c:if
						test="${param.b_category == '3'}">자유 게시판</c:if> <c:if
						test="${param.b_category == '4'}">요청 게시판</c:if> <c:if
						test="${param.b_category == '5'}">번개 게시판</c:if> <c:if
						test="${param.b_category == '6'}">게임플레이 동영상</c:if> <c:if
						test="${param.b_category == '7'}">후기 게시판</c:if></strong></H3></caption>
		<c:if test="${listcount > 0}">
			<tr align="center" valign="middle" style="border:1px">
				<td colspan="4" align="left"></td>
				<td>글개수:${listcount }</td>
			</tr>
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
					<td height="23"><a href="detail.sdj?b_no=${board.b_no }&pageNum=${pageNum}&b_category=${board.b_category}">${boardcnt }</a></td>
					<c:set var="boardcnt" value="${boardcnt - 1 }" />
					<td align="left"><c:if test="${board.b_fileurl != 'null'}">
							<a href="../file/${board.b_fileurl }" download><i class="icono-paperClip" style="width:3%; color: #0000cd;">  </i></a>
						</c:if> <c:if test="${board.b_fileurl == 'null'}">&nbsp;&nbsp;&nbsp;</c:if>
						<c:forEach begin="1" end="${board.b_reflevel }">&nbsp;&nbsp;&nbsp;</c:forEach>
						<c:if test="${board.b_reflevel > 0}">└</c:if>
						 <a href="detail.sdj?b_no=${board.b_no }&pageNum=${pageNum}&b_category=${board.b_category}">${board.b_subject }</a></td>
					<td align="center">${board.m_id }</td>
					<td align="center"><fmt:formatDate value="${board.b_regtime}"
							pattern="yyyy-MM-dd HH:mm:ss" var="b_regtime" />${b_regtime}</td>
					<td align="center">${board.b_readcnt }</td>
				</tr>
			</c:forEach>
			<tr align="center" height="26">
				<td colspan="5"><c:if test="${pageNum > 1 }">
						<a href="javascript:list(${pageNum -1 })">[이전]</a>
					</c:if>&nbsp; <c:if test="${pageNum <= 1 }">[이전]</c:if>&nbsp; <c:forEach
						var="a" begin="${startpage }" end="${endpage }">
						<c:if test="${a == pageNum }">[${a }]</c:if>
						<c:if test="${a != pageNum }">
							<a href="javascript:list(${a})">[${a }]</a>
						</c:if>
					</c:forEach> <c:if test="${pageNum < maxpage}">
						<a href="javascript:list(${pageNum + 1 })">[다음]</a>
					</c:if>&nbsp; <c:if test="${pageNum >= maxpage }">[다음]</c:if>&nbsp;</td>
			</tr>
		</c:if>
		
		<c:if test="${listcount == 0 }">
			<tr>
				<td colspan="5">등록된 게시물이 없습니다.</td>
			</tr>
		</c:if>
		<tr>
			<td colspan="4" align="left">
				<form action="list.sdj" method="post" name="searchform"
					onsubmit="return list(1)">
					<input type="hidden" name="pageNum" value="1"> <input
						type="hidden" name="b_category" value="${param.b_category }">
					<select name="searchType" id="searchType">
						<option value="">선택하세요</option>
						<option value="b_subject">제목</option>
						<option value="b_name">작성자</option>
						<option value="b_content">내용</option>
					</select>&nbsp;
					<script type="text/javascript">
			if('${param.searchType}' != '') {
				document.getElementById("searchType").value = '${param.searchType}'
			}
		</script>
					<input type="text" name="searchContent"
						value="${param.searchContent }"> <input type="submit"
						value="검색">
				</form></td>
			<td align="right"><a href="write.sdj?b_category=${param.b_category }"><button class="w3-btn w3-white w3-border w3-border-red w3-round-large">글쓰기</button></a></td>
		</tr>
	</table>
	</c:if>
	<c:if test="${param.b_category == '6'}">
	<c:if test="${listcount > 0 }">
	<div class="w3-row">
	<c:forEach items="${boardlist }" var="board">
		<div class="w3-col w3-card-4" align="center" style="width:20%;">
		<a href="detail.sdj?b_no=${board.b_no }&pageNum=${pageNum}&b_category=${board.b_category}">
			<h2 align= "center">${board.b_subject }</h2></a>
			<div align="center" style="width:90%;">
			<video style="align-self: center;" width="100%" height="120" controls>
			  <source src="../file/${board.b_fileurl }" type="video/mp4">
			</video>
			</div>
		</div>
	</c:forEach>
	</div>
	<div class="w3-center">
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
	</div>
	</c:if>
	<a class="w3-button w3-green" href="write.sdj?b_category=${param.b_category }">[글쓰기]</a>
	</c:if>
</div>
</div>
</body>
</html>