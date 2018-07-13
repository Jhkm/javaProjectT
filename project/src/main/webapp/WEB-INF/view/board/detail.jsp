<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>惟獣弘 雌室 左奄</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<% int cnt = 0; %>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
    function deleteReplyConfirm(pageNum, b_no, m_id, r_no, b_category) {
      if(confirm("奇越聖 舛源 肢薦拝猿推?") == true){
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
<div style="max-width: 70%;">
	<div class="w3-container" align="center">
		<p>
			<c:if test="${param.b_category == '1'}">巴傾戚板奄</c:if> 
			<c:if test="${param.b_category == '2'}">徳 惟獣毒</c:if> 
			<c:if test="${param.b_category == '3'}">切政 惟獣毒</c:if> 
			<c:if test="${param.b_category == '4'}">推短 惟獣毒</c:if> 
			<c:if test="${param.b_category == '5'}">腰鯵 惟獣毒</c:if> 
			<c:if test="${param.b_category == '6'}">惟績巴傾戚 疑慎雌</c:if> 
			<c:if test="${param.b_category == '7'}">板奄 惟獣毒</c:if>
		</p>
	</div>
	<div class="w3-cell-row">
		<div class="w3-container w3-cell" style="width: 20%;">
			<label>薦鯉</label>
		</div>
		<div class="w3-container w3-sand w3-cell w3-cell-bottom" align="left" style="max-width: 80%;">
			<label>${board.b_subject}</label>
		</div>
	</div> 
	<c:if test="${param.b_category == '5'}">
	<div class="w3-cell-row">
		<div class="w3-container w3-cell" style="width: 20%;">
			<label>劾促</label>
		</div>
		<div class="w3-container w3-sand w3-cell w3-cell-bottom" align="left" style="max-width: 80%;">
			<label>${board.b_date}</label>
		</div>
	</div> 
	<div class="w3-cell-row">
		<div class="w3-container w3-cell" style="width: 20%;">
			<label>舌社</label>
		</div>
		<div class="w3-container w3-sand w3-cell w3-cell-bottom" align="left" style="max-width: 80%;">
			<label>${board.b_state}</label>
		</div>
	</div> 
	<div class="w3-cell-row">
		<div class="w3-container w3-cell" style="width: 20%;">
			<label>凧亜昔据</label>
		</div>
		<div class="w3-container w3-sand w3-cell w3-cell-bottom" align="left" style="max-width: 80%;">
			<label>${board.b_people}</label>
		</div>
	</div> 
	<div class="w3-cell-row">
		<div class="w3-container w3-cell" style="width: 20%;">
			<label>凧亜掻昔 昔据</label>
		</div>
		<div class="w3-container w3-sand w3-cell w3-cell-bottom" align="left" style="max-width: 80%;">
			<label><c:if test="${board.g_id != null}">${board.g_id }</c:if></label>
		</div>
		<c:forEach items="${idList}" var="id">
			<c:if test="${id == loginUser }">
				<% cnt = cnt+1; %>
			</c:if>
		</c:forEach>
		<c:if test="<%= cnt == 0 %>">
			<input type="button" value="凧亜馬奄">
		</c:if>
	</div> 
	</c:if>
</div>
<!-- 巡!!!!@!!!@#!@#$あ%ざすこ#で敢 ずそえす$板 ば --> 
 <!--  
 	<table align="center" border="1" cellpadding="0" cellspacing="0">
	
		<tr>

			<td colspan="2" align="center">
  <c:if test="${param.b_category == '1'}">巴傾戚板奄</c:if> 
  <c:if test="${param.b_category == '2'}">徳 惟獣毒</c:if>
  <c:if test="${param.b_category == '3'}">切政 惟獣毒</c:if>
  <c:if test="${param.b_category == '4'}">推短 惟獣毒</c:if>
  <c:if test="${param.b_category == '5'}">腰鯵 惟獣毒</c:if>
  <c:if test="${param.b_category == '6'}">惟績巴傾戚 疑慎雌</c:if>
  <c:if test="${param.b_category == '7'}">板奄 惟獣毒</c:if>
 </td>
		</tr>
		<tr>
			<td>越彰戚</td>
			<td>${board.m_id}</td>
		</tr>
		<tr>
			<td>薦鯉</td>
			<td>${board.b_subject}</td>
		</tr>
		<tr>
			<td>鎧遂</td>
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
			<td>歎採督析</td>
			<td>&nbsp;
				<c:if test="${!empty board.b_fileurl }">
					<a href="../file/${board.b_fileurl }">${board.b_fileurl }</a>
				</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<a href="reply.sdj?b_no=${board.b_no }&pageNum=${param.pageNum}&b_category=${param.b_category}">[岩越]</a>
				<a href="update.sdj?b_no=${board.b_no }&pageNum=${param.pageNum}&b_category=${param.b_category}">[呪舛]</a>
				<a href="delete.sdj?b_no=${board.b_no }&pageNum=${param.pageNum}&b_category=${param.b_category}">[肢薦]</a>
				<a href="list.sdj?pageNum=${param.pageNum }&b_category=${param.b_category}">[鯉系]</a>
			</td>
		</tr>
	</table>
-->

	
<%-- 	<form:form modelAttribute="reply" action="r_reply.sdj" name="f">
		<input type="hidden" name="b_no" value="${board.b_no}">
		<input type="hidden" name="pageNum" value="${param.pageNum}">
		<table>
		<tr><td align="center">鎧遂</td><td><textarea rows="4" cols="80" name="r_content" style="color:black;"></textarea></td></tr>
		<tr><td align="center" colspan="2"><a href="javascript:document.f.submit()">[奇越去系]</a></td></tr>
		</table>
	</form:form>
	<div>
	<table align="center"border="1" cellpadding="0" cellspacing="0">
	<c:forEach var="reply" items="${replylist }">
	<tr><td>${reply.m_id }</td>
		<td>${reply.r_content }<a href="reply.sdj?b_no=${board.b_no }&pageNum=${param.pageNum}&b_category=${param.b_category}">[岩越]</a>
							  <a href="update.sdj?b_no=${board.b_no }&pageNum=${param.pageNum}&b_category=${param.b_category}">[呪舛]</a>
							  <a href="delete.sdj?b_no=${board.b_no }&pageNum=${param.pageNum}&b_category=${param.b_category}">[肢薦]</a>
			<p class="date" style="color:#D3D3D3; font-size:12px;" align="center">${reply.r_date }</p></td>
	</tr>
	</c:forEach>
	</table> 
	</div>--%>
   
  <table class="w3-table w3-bordered" style="width: 1500px;">
         <caption> 奇越</caption>
         <c:if test="${empty replylist}">
            <tr>
               <td>去系 吉 奇越戚 蒸柔艦陥.</td>
            </tr>
         </c:if>
         <c:if test="${!empty replylist}">
         <tr>
               <th width="300px" height="20px" style="text-align:center;">拙失切</th>
               <th width="700px" height="20px" style="text-align:center;">鎧遂</th>
               <th width="200px" height="20px" style="text-align:center;">劾促</th>
               <th width="300px" height="20px" style="text-align:center;">搾壱</th>
         </tr>
         <c:forEach var="re" items="${replylist}" varStatus="status">
            <tr>
               <td width="300px" height="40px" style="text-align:left;">
                  <c:if test="${re.r_reflevel > 0 }">
                     <c:forEach begin="1" end="${re.r_reflevel}">&nbsp;&nbsp;&nbsp;</c:forEach>
                     ε
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
                  <input type="button" id="ReplyRe_${status.index}" class="w3-button"  value="岩痕">
                  <input type="button" id="updateRe_${status.index}" class="w3-button" value="呪舛">
                  <input type="button" class="w3-button" onclick="javascript:deleteReplyConfirm('${param.pageNum}','${re.b_no}','${re.m_id }','${re.r_no}','${param.b_category}')" value="肢 薦">
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
                        <input type="submit" class="w3-button" value="呪 舛">
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
                        <input type="submit" class="w3-button" value="去 系">
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
         <input type="submit" class="w3-button" value="去 系">
   </form:form>
</body>
</html>