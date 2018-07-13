<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>게시물 상세 보기</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
    function deleteReplyConfirm(pageNum, b_no, m_id, r_no, b_category) {
      if(confirm("댓글을 정말 삭제할까요?") == true){
    	  alert(pageNum+","+b_no+","+m_id+","+r_no+","+b_category);
         location.href="replyDelete.sdj?pageNum="+pageNum+"&b_no="+b_no+"&m_id="+m_id+"&r_no="+r_no+"&b_category="+b_category;
      }else{
         return;
      }
   }  
	 $(document).ready(function() {
		console.log("!!!");
         	$('.upinput').hide();
         	$('.reinput').hide();
          	<c:forEach items="${replylist}" varStatus="status">
            $('#ReplyRe_${status.index}').click(function(){
               rechange_${status.index}();
            });
            $('#updateRe_${status.index}').click(function(){
               upchange_${status.index}();
            });
     function rechange_${status.index}() {
         $('#reinput_${status.index}').toggle();
      }
      function upchange_${status.index}() {
         $('#upinput_${status.index}').toggle();
      }
            </c:forEach>
   });

</script>
<style>
.date {
	color: #D3D3D3;
	font-size: 12px;
}
</style>
</head>
<body>
 	<table align="center" border="1" cellpadding="0" cellspacing="0">
	
		<tr>

			<td colspan="2" align="center">
  <c:if test="${param.b_category == '1'}">플레이후기</c:if> 
  <c:if test="${param.b_category == '2'}">팁 게시판</c:if>
  <c:if test="${param.b_category == '3'}">자유 게시판</c:if>
  <c:if test="${param.b_category == '4'}">요청 게시판</c:if>
  <c:if test="${param.b_category == '5'}">번개 게시판</c:if>
  <c:if test="${param.b_category == '6'}">게임플레이 동영상</c:if>
  <c:if test="${param.b_category == '7'}">후기 게시판</c:if>
 </td>
		</tr>
		<tr>
			<td>글쓴이</td>
			<td>${board.m_id}</td>
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
						<c:if test="${!empty board.b_fileurl }">
					<tr><td><img src="../file/${board.b_fileurl }" style="width:50px;"></td></tr>
					</c:if>
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
				<a href="reply.sdj?b_no=${board.b_no }&pageNum=${param.pageNum}&b_category=${param.b_category}">[답글]</a>
				<a href="update.sdj?b_no=${board.b_no }&pageNum=${param.pageNum}&b_category=${param.b_category}">[수정]</a>
				<a href="delete.sdj?b_no=${board.b_no }&pageNum=${param.pageNum}&b_category=${param.b_category}">[삭제]</a>
				<a href="list.sdj?pageNum=${param.pageNum }&b_category=${param.b_category}">[목록]</a>
			</td>
		</tr>
	</table>
	
<%-- 	<form:form modelAttribute="reply" action="r_reply.sdj" name="f">
		<input type="hidden" name="b_no" value="${board.b_no}">
		<input type="hidden" name="pageNum" value="${param.pageNum}">
		<table>
		<tr><td align="center">내용</td><td><textarea rows="4" cols="80" name="r_content" style="color:black;"></textarea></td></tr>
		<tr><td align="center" colspan="2"><a href="javascript:document.f.submit()">[댓글등록]</a></td></tr>
		</table>
	</form:form>
	<div>
	<table align="center"border="1" cellpadding="0" cellspacing="0">
	<c:forEach var="reply" items="${replylist }">
	<tr><td>${reply.m_id }</td>
		<td>${reply.r_content }<a href="reply.sdj?b_no=${board.b_no }&pageNum=${param.pageNum}&b_category=${param.b_category}">[답글]</a>
							  <a href="update.sdj?b_no=${board.b_no }&pageNum=${param.pageNum}&b_category=${param.b_category}">[수정]</a>
							  <a href="delete.sdj?b_no=${board.b_no }&pageNum=${param.pageNum}&b_category=${param.b_category}">[삭제]</a>
			<p class="date" style="color:#D3D3D3; font-size:12px;" align="center">${reply.r_date }</p></td>
	</tr>
	</c:forEach>
	</table> 
	</div>--%>
   
  <table class="w3-table w3-bordered" style="width: 1500px;">
         <caption> 댓글</caption>
         <c:if test="${empty replylist}">
            <tr>
               <td>등록 된 댓글이 없습니다.</td>
            </tr>
         </c:if>
         <c:if test="${!empty replylist}">
         <tr>
               <th width="300px" height="20px" style="text-align:center;">작성자</th>
               <th width="700px" height="20px" style="text-align:center;">내용</th>
               <th width="200px" height="20px" style="text-align:center;">날짜</th>
               <th width="300px" height="20px" style="text-align:center;">비고</th>
         </tr>
         <c:forEach var="re" items="${replylist}" varStatus="status">
            <tr>
               <td width="300px" height="40px" style="text-align:left;">
                  <c:if test="${re.r_reflevel > 0 }">
                     <c:forEach begin="1" end="${re.r_reflevel}">&nbsp;&nbsp;&nbsp;</c:forEach>
                     ┖
                  </c:if>
                  &nbsp;[${re.m_id}]
               </td>
               <td width="700px" height="40px" style="text-align:left;">${re.r_content}&nbsp;</td>
               <td width="200px" height="40px" style="text-align:center;">
                  <fmt:formatDate value="${re.r_date}" pattern="yyyy-MM-dd HH:mm:ss" var="regnow" />
                  ${regnow}
               </td>
               <!-- onclick="javascript:replyedisp('ReplyRe')"  onclick="javascript:replyedisp('updateRe')" -->
               <td width="300px" height="40px" style="text-align:center;">
                  <input type="button" id="ReplyRe_${status.index}" class="w3-button"  value="답변">
                  <input type="button" id="updateRe_${status.index}" class="w3-button" value="수정">
                  <input type="button" class="w3-button" onclick="javascript:deleteReplyConfirm('${param.pageNum}','${re.b_no}','${re.m_id }','${re.r_no}','${param.b_category}')" value="삭 제">
               </td>
            </tr>
            <tr id="upinput_${status.index}" class="upinput">
               <td colspan="4">
                  <form:form action="r_update.sdj" modelAttribute="reply" method="post">
                     <input type="hidden" name="r_no" value="${re.r_no}">
                     <input type="hidden" name="m_id" value="${re.m_id}">
                     <input type="hidden" value="${board.b_no}" name="b_no">
                     <input type="hidden" value="${param.pageNum}" name="pageNum">
                     <input type="hidden" value="${param.b_category}" name="b_category">
                        <form:input path="r_content" size="170px"/>
                        <input type="submit" class="w3-button" value="수 정">
                        <font color="red"><form:errors path="r_content"/></font>
                  </form:form>
               </td>
            </tr>
            <tr id="reinput_${status.index}" class="reinput">
               <td colspan="4">
                  <form:form action="replyRe.sdj" modelAttribute="reply" method="post">
                     <input type="hidden" name="r_no" value="${re.r_no}">
                     <input type="hidden" value="${board.b_no}" name="b_no">
                     <input type="hidden" value="${param.pageNum}" name="pageNum">
                     <input type="hidden" value="${param.b_category}" name="b_category">
                        <form:input path="r_content" size="170px"/>
                        <font color="red"><form:errors path="r_content"/></font>
                        <input type="submit" class="w3-button" value="등 록">
                  </form:form>
               </td>
            </tr>
         </c:forEach> 
         </c:if>
   </table> 
   
   <form:form modelAttribute="reply" action="r_reply.sdj" method="post">
      <input type="hidden" value="${board.b_no}" name="b_no">
      <input type="hidden" value="${param.pageNum}" name="pageNum">
      <div style="width: 1500px;">
         <form:input path="r_content" size="170px"/>
         <font color="red"><form:errors path="r_content"/></font>
      </div>
         <input type="submit" class="w3-button" value="등 록">
   </form:form>
</body>
</html>