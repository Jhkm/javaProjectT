<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>�Խù� �� ����</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=IOAxpv0_yEzY_13m7xPn&submodules=geocoder"></script>
<% 
	int cnt = 0; 
%>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
    function deleteReplyConfirm(pageNum, b_no, m_id, r_no, b_category) {
      if(confirm("����� ���� �����ұ��?") == true){
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

	$(document).ready(function() {
		var value =  $('#join').val();
		var data;
		$("#join").on('click',function(){
			if (value == '�����ϱ�') {
				data="1";
				alert("�����ϱ�");
			} else {
				data="2";
				alert("����ϱ�");
			}
			var adata={"value":data, "b_no":${board.b_no}};
			
			$.ajax({
				type:"POST",
				url:"join.sdj",
				data :adata,
				success:function(result) {
					console.log("result="+result);
					$('input[id=ids]').attr('value',"");
					$('input[id=ids]').attr('value',result);
					if (data==1) {
						$('button[id=join]').attr('value', '����ϱ�')
						alert("�����Ϸ�");
						location.reload();
					} else {
						$('button[id=join]').attr('value', '�����ϱ�')
						alert("��ҿϷ�");
						location.reload();
					}
				}
			})
		})
		$("#unjoin").on('click', function(){
			alert("������");
			var adata={"value":"2", "b_no":${board.b_no}};
			$.ajax({
				type:"POST",
				url:"join.sdj",
				data :adata,
				success:function(result) {
					$('input[id=ids]').attr('value',"");
					$('input[id=ids]').attr('value',result);
					$('button[id=unjoin]').attr('value', '�����ϱ�')
					$('button[id=unjoin]').attr('id','join');
					alert("������Ϸ�");
				}
			})
		})
	})
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
			<c:if test="${param.b_category == '1'}">�÷����ı�</c:if> 
			<c:if test="${param.b_category == '2'}">�� �Խ���</c:if> 
			<c:if test="${param.b_category == '3'}">���� �Խ���</c:if> 
			<c:if test="${param.b_category == '4'}">��û �Խ���</c:if> 
			<c:if test="${param.b_category == '5'}">���� �Խ���</c:if> 
			<c:if test="${param.b_category == '6'}">�����÷��� ������</c:if> 
			<c:if test="${param.b_category == '7'}">�ı� �Խ���</c:if>
		</p>
	</div>
	<div class="w3-cell-row">
		<div class="w3-container w3-cell" style="width: 20%;">
			<label>����</label>
		</div>
		<div class="w3-container w3-sand w3-cell w3-cell-bottom" align="left" style="max-width: 80%;">
			<label>${board.b_subject}</label>
		</div>
	</div> 
	<c:if test="${param.b_category == '5'}">
	<div class="w3-cell-row">
		<div class="w3-container w3-cell" style="width: 20%;">
			<label>��¥</label>
		</div>
		<div class="w3-container w3-sand w3-cell w3-cell-bottom" align="left" style="max-width: 80%;">
			<label>${board.b_date}</label>
		</div>
	</div> 
	
	<div class="w3-cell-row">
		<div class="w3-container w3-cell" style="width: 20%;">
			<label>�����ο�</label>
		</div>
		<div class="w3-container w3-sand w3-cell w3-cell-bottom" align="left" style="max-width: 80%;">
			<label>${board.b_people}</label>
		</div>
	</div>
	<div class="w3-cell-row">
		<div class="w3-container w3-cell" style="width: 20%;">
			<label>�������� �ο�</label>
		</div>
		<div class="w3-container w3-sand w3-cell w3-cell-bottom" align="left" style="max-width: 80%;">
			<input type="text" value="${board.g_id }" id="ids">
		</div>
		<c:forEach items="${idList}" var="id">
			<c:if test="${id == loginUser }">
				<% cnt = cnt+1; %>
			</c:if>
		</c:forEach>
		<c:if test="<%= cnt == 0 %>">
			<input id="join" type="button" value="�����ϱ�">
		</c:if>
		<c:if test="<%= cnt != 0 %>">
			<input id="join" type="button" value="����ϱ�">
		</c:if>
	</div>
	<div class="w3-cell-row">
		<div class="w3-container w3-cell" style="width: 20%;">
			<label>���</label>
		</div>
		<div class="w3-container w3-sand w3-cell w3-cell-bottom" align="left" style="max-width: 80%;">
			<label>${board.b_state}</label>
		</div>
	</div> 
		<div class="w3-cell-row">
		<div class="w3-container w3-teal w3-cell" style="width: 20%;">
			<label>����</label>
		</div>
		<div class="w3-container w3-sand w3-cell w3-cell-bottom" align="left" style="max-width: 80%;">
			<div id="map" style="width:100%;height:400px;"></div>
			<script>
			var map = new naver.maps.Map('map');
			var myaddress = "${board.b_state}";// ���θ� �ּҳ� ���� �ּҸ� ���� (�ǹ��� �Ұ�!!!!)
			console.log(myaddress);
			naver.maps.Service.geocode({address: myaddress}, function(status, response) {
			    if (status !== naver.maps.Service.Status.OK) {
			        return alert(myaddress + '�� �˻� ����� ���ų� ��Ÿ ��Ʈ��ũ ����');
			    }
			    var result = response.result;
			    // �˻� ��� ����: result.total
			    // ù��° ��� ��� �ּ�: result.items[0].address
			    // ù��° �˻� ��� ��ǥ: result.items[0].point.y, result.items[0].point.x
			    var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
			    map.setCenter(myaddr); // �˻��� ��ǥ�� ���� �̵�
			    // ��Ŀ ǥ��
			    var marker = new naver.maps.Marker({
			      position: myaddr,
			      map: map
			    });
			    // ��Ŀ Ŭ�� �̺�Ʈ ó��
			    naver.maps.Event.addListener(marker, "click", function(e) {
			      if (infowindow.getMap()) {
			          infowindow.close();
			      } else {
			          infowindow.open(map, marker);
			      }
			    });
			});

      </script>
		</div>
	</div>
	</c:if>
	<div class="w3-cell-row">
		<div class="w3-container w3-cell" style="width: 20%;">
			<label>����</label>
		</div>
		<div class="w3-container w3-sand w3-cell w3-cell-bottom" align="left" style="max-width: 80%;">
			<textarea rows="4" cols="80" name="r_content" style="color:black;">${board.b_content }</textarea>
		</div>
	</div>
	<div class="w3-cell-row">
		<div class="w3-container w3-cell" style="width: 20%;">
			<label >÷������</label>
		</div>
		<div class="w3-container w3-sand w3-cell w3-cell-bottom" align="left" style="max-width: 80%;">
			<c:if test="${!empty borad.b_filurl }">
				<a href="../file/${board.b_fileurl }">${board.b_fileurl}</a>
			</c:if>
		</div>
	</div>
	<div class="w3-cell-row">
		<div class="w3-container w3-cell">
			<a href="reply.sdj?b_no=${board.b_no }&pageNum=${param.pageNum}&b_category=${param.b_category}">[���]</a>
			<a href="update.sdj?b_no=${board.b_no }&pageNum=${param.pageNum}&b_category=${param.b_category}">[����]</a>
			<a href="delete.sdj?b_no=${board.b_no }&pageNum=${param.pageNum}&b_category=${param.b_category}">[����]</a>
			<a href="list.sdj?pageNum=${param.pageNum }&b_category=${param.b_category}">[���]</a>
		</div>
	</div>

</div>
<div>
	<form:form modelAttribute="reply" action="r_reply.sdj" name="f">s
		<input type="hidden" name="b_no" value="${board.b_no}">
		<input type="hidden" name="pageNum" value="${param.pageNum}">
		<div class="w3-cell-row">
			<div class="w3-container w3-cell">
				<a href="reply.sdj?b_no=${board.b_no }&pageNum=${param.pageNum}&b_category=${param.b_category}">[���]</a>
				<a href="update.sdj?b_no=${board.b_no }&pageNum=${param.pageNum}&b_category=${param.b_category}">[����]</a>
				<a href="delete.sdj?b_no=${board.b_no }&pageNum=${param.pageNum}&b_category=${param.b_category}">[����]</a>
				<a href="list.sdj?pageNum=${param.pageNum }&b_category=${param.b_category}">[���]</a>
			</div>
		</div>
	</form:form>
</div>
<!-- ��!!!!@!!!@#!@#$��%������#�Ǵ� ��������$�� �� --> 
 <!--  
 	<table align="center" border="1" cellpadding="0" cellspacing="0">
	
		<tr>

			<td colspan="2" align="center">
  <c:if test="${param.b_category == '1'}">�÷����ı�</c:if> 
  <c:if test="${param.b_category == '2'}">�� �Խ���</c:if>
  <c:if test="${param.b_category == '3'}">���� �Խ���</c:if>
  <c:if test="${param.b_category == '4'}">��û �Խ���</c:if>
  <c:if test="${param.b_category == '5'}">���� �Խ���</c:if>
  <c:if test="${param.b_category == '6'}">�����÷��� ������</c:if>
  <c:if test="${param.b_category == '7'}">�ı� �Խ���</c:if>
 </td>
		</tr>
		<tr>
			<td>�۾���</td>
			<td>${board.m_id}</td>
		</tr>
		<tr>
			<td>����</td>
			<td>${board.b_subject}</td>
		</tr>
		<tr>
			<td>����</td>
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
			<td>÷������</td>
			<td>&nbsp;
				<c:if test="${!empty board.b_fileurl }">
					<a href="../file/${board.b_fileurl }">${board.b_fileurl }</a>
				</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<a href="reply.sdj?b_no=${board.b_no }&pageNum=${param.pageNum}&b_category=${param.b_category}">[���]</a>
				<a href="update.sdj?b_no=${board.b_no }&pageNum=${param.pageNum}&b_category=${param.b_category}">[����]</a>
				<a href="delete.sdj?b_no=${board.b_no }&pageNum=${param.pageNum}&b_category=${param.b_category}">[����]</a>
				<a href="list.sdj?pageNum=${param.pageNum }&b_category=${param.b_category}">[���]</a>
			</td>
		</tr>
	</table>
-->

	
<%-- 	<form:form modelAttribute="reply" action="r_reply.sdj" name="f">
		<input type="hidden" name="b_no" value="${board.b_no}">
		<input type="hidden" name="pageNum" value="${param.pageNum}">
		<table>
		<tr><td align="center">����</td><td><textarea rows="4" cols="80" name="r_content" style="color:black;"></textarea></td></tr>
		<tr><td align="center" colspan="2"><a href="javascript:document.f.submit()">[��۵��]</a></td></tr>
		</table>
	</form:form>
	<div>
	<table align="center"border="1" cellpadding="0" cellspacing="0">
	<c:forEach var="reply" items="${replylist }">
	<tr><td>${reply.m_id }</td>
		<td>${reply.r_content }<a href="reply.sdj?b_no=${board.b_no }&pageNum=${param.pageNum}&b_category=${param.b_category}">[���]</a>
							  <a href="update.sdj?b_no=${board.b_no }&pageNum=${param.pageNum}&b_category=${param.b_category}">[����]</a>
							  <a href="delete.sdj?b_no=${board.b_no }&pageNum=${param.pageNum}&b_category=${param.b_category}">[����]</a>
			<p class="date" style="color:#D3D3D3; font-size:12px;" align="center">${reply.r_date }</p></td>
	</tr>
	</c:forEach>
	</table> 
	</div>--%>
   
  <table class="w3-table w3-bordered" style="width: 1500px;">
         <caption> ���</caption>
         <c:if test="${empty replylist}">
            <tr>
               <td>��� �� ����� �����ϴ�.</td>
            </tr>
         </c:if>
         <c:if test="${!empty replylist}">
         <tr>
               <th width="300px" height="20px" style="text-align:center;">�ۼ���</th>
               <th width="700px" height="20px" style="text-align:center;">����</th>
               <th width="200px" height="20px" style="text-align:center;">��¥</th>
               <th width="300px" height="20px" style="text-align:center;">���</th>
         </tr>
         <c:forEach var="re" items="${replylist}" varStatus="status">
            <tr>
               <td width="300px" height="40px" style="text-align:left;">
                  <c:if test="${re.r_reflevel > 0 }">
                     <c:forEach begin="1" end="${re.r_reflevel}">&nbsp;&nbsp;&nbsp;</c:forEach>
                     ��
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
                  <input type="button" id="ReplyRe_${status.index}" class="w3-button"  value="�亯">
                  <input type="button" id="updateRe_${status.index}" class="w3-button" value="����">
                  <input type="button" class="w3-button" onclick="javascript:deleteReplyConfirm('${param.pageNum}','${re.b_no}','${re.m_id }','${re.r_no}','${param.b_category}')" value="�� ��">
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
                        <input type="submit" class="w3-button" value="�� ��">
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
                        <input type="submit" class="w3-button" value="�� ��">
                  </form:form>
               </td>
            </tr>
         </c:forEach> 
         </c:if>
   </table> 
   
   <form:form modelAttribute="reply" action="r_reply.sdj" method="post">
      <input type="hidden" value="${board.b_no}" name="b_no">
      <input type="hidden" value="${param.pageNum}" name="pageNum">
      <div style="width: 1700px;">
         <form:input path="r_content" size="1700px"/>
         <font color="red"><form:errors path="r_content"/></font>
      </div>
         <input type="submit" class="w3-button" value="�� ��">
   </form:form>
  
   
</body>
</html>