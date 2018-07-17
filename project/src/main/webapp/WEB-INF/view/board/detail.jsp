<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시물 상세 보기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=IOAxpv0_yEzY_13m7xPn&submodules=geocoder"></script>
<% 
	int cnt = 0; 
%>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
function deleteReplyConfirm(pageNum, b_no, m_id, r_no, b_category) {
    if(confirm("댓글을 정말 삭제할까요?") == true){
       location.href="replyDelete.sdj?pageNum="+pageNum+"&b_no="+b_no+"&m_id="+m_id+"&r_no="+r_no+"&b_category="+b_category;
    }else{
       return;
    }
 }
function deleteBoard(pageNum, b_no, b_category) {
  if(confirm("게시글을 정말 삭제할까요?") == true){
     location.href="delete.sdj?pageNum="+pageNum+"&b_no="+b_no+"&b_category="+b_category;
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
			if (value == '참가하기') {
				data="1";
				alert("참가하기");
			} else {
				data="2";
				alert("취소하기");
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
						$('button[id=join]').attr('value', '취소하기')
						alert("참가완료");
						location.reload();
					} else {
						$('button[id=join]').attr('value', '참가하기')
						alert("취소완료");
						location.reload();
					}
				}
			})
		})
		$("#unjoin").on('click', function(){
			alert("빠지기");
			var adata={"value":"2", "b_no":${board.b_no}};
			$.ajax({
				type:"POST",
				url:"join.sdj",
				data :adata,
				success:function(result) {
					$('input[id=ids]').attr('value',"");
					$('input[id=ids]').attr('value',result);
					$('button[id=unjoin]').attr('value', '참가하기')
					$('button[id=unjoin]').attr('id','join');
					alert("빠지기완료");
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
#all {
	margin-left:22%;
	margin-right:24%;
	padding-top:5%;	
	font-size : 20px;
font-family: "Nanum Pen Script", sans-serif;
}
.w3-btn {margin-bottom:10px;}
#b_subject {
	border-bottom : 1px solid #dadada;

}
#b_content {
	border-bottom : 1px solid #dadada;
}
</style>
</head>
<body>
<div id="all">
	<div class="w3-container" style="max-width: 100%; " align="center">
		<div class="w3-container" align="center">
			</h3><p><strong><h3>
				<c:if test="${param.b_category == '1'}">플레이후기</c:if>
				<c:if test="${param.b_category == '2'}">팁 게시판</c:if>
				<c:if test="${param.b_category == '3'}">자유 게시판</c:if>
				<c:if test="${param.b_category == '4'}">요청 게시판</c:if>
				<c:if test="${param.b_category == '5'}">번개 게시판</c:if>
				<c:if test="${param.b_category == '6'}">게임플레이 동영상</c:if>
				<c:if test="${param.b_category == '7'}">후기 게시판</c:if>
			</h3></strong></p>
		</div>
		<div class="w3-cell-row">
			<div class="w3-container w3-cell"  style="width: 20%;">
				<label>제목</label>
			</div>
			<div class="w3-container w3-sand w3-cell w3-cell-bottom" id="b_subject" align="left"
				style="max-width: 80%;">
				<label>${board.b_subject}</label>
				
			</div>
		</div>
		<c:if test="${param.b_category == '5'}">
			<div class="w3-cell-row">
				<div class="w3-container w3-cell" style="width: 20%;">
					<label>날짜</label>
				</div>
				<div class="w3-container w3-sand w3-cell w3-cell-bottom"
					align="left" style="max-width: 80%;">
					<label>${board.b_date}</label>
				</div>
			</div>

			<div class="w3-cell-row">
				<div class="w3-container w3-cell" style="width: 20%;">
					<label>참가인원</label>
				</div>
				<div class="w3-container w3-sand w3-cell w3-cell-bottom"
					align="left" style="max-width: 80%;">
					<label>${board.b_people}</label>
				</div>
			</div>
			<div class="w3-cell-row">
				<div class="w3-container w3-cell" style="width: 20%;">
					<label>참가중인 인원</label>
				</div>
				<div class="w3-container w3-sand w3-cell w3-cell-bottom"
					align="left" style="max-width: 80%;">
					<input type="text" value="${board.g_id }" id="ids">
				</div>
				<c:forEach items="${idList}" var="id">
					<c:if test="${id == loginUser }">
						<% cnt = cnt+1; %>
					</c:if>
				</c:forEach>
				<c:if test="<%= cnt == 0 %>">
					<input id="join" type="button" value="참가하기">
				</c:if>
				<c:if test="<%= cnt != 0 %>">
					<input id="join" type="button" value="취소하기">
				</c:if>
			</div>
			<div class="w3-cell-row">
				<div class="w3-container w3-cell" style="width: 20%;">
					<label>장소</label>
				</div>
				<div class="w3-container w3-sand w3-cell w3-cell-bottom"
					align="left" style="max-width: 80%;">
					<label>${board.b_state}</label>
				</div>
			</div>
			<div class="w3-cell-row">
				<div class="w3-container w3-teal w3-cell" style="width: 20%;">
					<label>지도</label>
				</div>
				<div class="w3-container w3-sand w3-cell w3-cell-bottom"
					align="left" style="max-width: 80%;">
					<div id="map" style="width: 100%; height: 400px;"></div>
					<script>
			var map = new naver.maps.Map('map');
			var myaddress = "${board.b_state}";// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
			console.log(myaddress);
			naver.maps.Service.geocode({address: myaddress}, function(status, response) {
			    if (status !== naver.maps.Service.Status.OK) {
			        return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
			    }
			    var result = response.result;
			    // 검색 결과 갯수: result.total
			    // 첫번째 결과 결과 주소: result.items[0].address
			    // 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
			    var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
			    map.setCenter(myaddr); // 검색된 좌표로 지도 이동
			    // 마커 표시
			    var marker = new naver.maps.Marker({
			      position: myaddr,
			      map: map
			    });
			    // 마커 클릭 이벤트 처리
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
				<label>내용</label>
			</div>
			<div class="w3-container w3-sand w3-cell w3-cell-bottom" id="b_content"align="left"
				style="max-width: 80%;">
				${board.b_content }
			</div>
		</div>
		<div class="w3-cell-row">
			<div class="w3-container w3-cell" style="width: 20%;">
				<label>첨부파일</label>
			</div>
			<div class="w3-container w3-sand w3-cell w3-cell-bottom" align="left"
				style="max-width: 80%;">
				<c:if test="${!empty borad.b_filurl }">
					<a href="../file/${board.b_fileurl }">${board.b_fileurl}</a>
				</c:if>
			</div>
		</div>
		<div class="w3-cell-row">
			<div class="w3-container w3-cell" style="padding-top:1%;">
				<a
					href="reply.sdj?b_no=${board.b_no }&pageNum=${param.pageNum}&b_category=${param.b_category}">
					<button class="w3-btn w3-white w3-border w3-border-red w3-round-large">답글</button></a>
				<a
					href="update.sdj?b_no=${board.b_no }&pageNum=${param.pageNum}&b_category=${param.b_category}">
					<button class="w3-btn w3-white w3-border w3-border-red w3-round-large">수정</button></a>
				<a>	<button class="w3-btn w3-white w3-border w3-border-red w3-round-large" onclick="javascirpt:deleteBoard('${param.pageNum}', '${board.b_no }', '${board.b_category}')">삭제</button></a>
				<a
					href="list.sdj?pageNum=${param.pageNum }&b_category=${param.b_category}">
					<button class="w3-btn w3-white w3-border w3-border-red w3-round-large">목록</button></a>
			</div>
		</div>

	</div>
	<!-- 썰!!!!@!!!@#!@#$ㄲ%ㅆㅉㅃ#ㅗ뉴 ㅊㅍㄸㅉ$후 ㅠ -->
	<!--  
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
-->


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

	<table class="w3-table w3-bordered" style="width: 100%;">
		<caption>댓글</caption>
		<c:if test="${empty replylist}">
			<tr>
				<td align="center">등록 된 댓글이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${!empty replylist}">
			<tr>
				<th width="20%" height="5%" style="text-align: center;">작성자</th>
				<th width="45%" height="5%" style="text-align: center;">내용</th>
				<th width="15%" height="5%" style="text-align: center;">날짜</th>
				<th width="30%" height="5%" style="text-align: center;">비고</th>
			</tr>
			<c:forEach var="re" items="${replylist}" varStatus="status">
				<tr>
					<td width="20%" height="5%" style="text-align: left;"><c:if
							test="${re.r_reflevel > 0 }">
							<c:forEach begin="1" end="${re.r_reflevel}">&nbsp;&nbsp;&nbsp;</c:forEach>
                     ┖
                 
                  </c:if> &nbsp;[${re.m_id}]</td>
					<td width="45%" height="5%" style="text-align: left;">${re.r_content}&nbsp;</td>
					<td width="15%" height="5%" style="text-align: center;"><fmt:formatDate
							value="${re.r_date}" pattern="yyyy-MM-dd HH:mm:ss" var="regnow" />
						${regnow}</td>
					<!-- onclick="javascript:replyedisp('ReplyRe')"  onclick="javascript:replyedisp('updateRe')" -->
					<td width="30%" height="5%" style="text-align: center;">
					<input type="hidden" value="${board.b_category}">
					<input type="button" id="ReplyRe_${status.index}" class="w3-button" value="[답변]">
					<input type="button" id="updateRe_${status.index}" class="w3-button" value="[수정]">
					<input type="button" class="w3-button"
						onclick="javascript:deleteReplyConfirm('${param.pageNum}','${re.b_no}','${re.m_id }','${re.r_no}','${param.b_category}')"
						value="[삭 제]"></td>
				</tr>
				<tr id="upinput_${status.index}" class="upinput">
					<td colspan="4"><form:form action="r_update.sdj"
							modelAttribute="reply" method="post">
							<input type="hidden" name="r_no" value="${re.r_no}">
							<input type="hidden" name="m_id" value="${re.m_id}">
							<input type="hidden" value="${board.b_no}" name="b_no">
							<input type="hidden" value="${param.pageNum}" name="pageNum">
							<input type="hidden" value="${board.b_category}"
								name="b_category">
							<div style="width: 100%; float:left;">
							<form:input path="r_content" size="100%" />
							<input type="submit" class="w3-btn w3-white w3-border w3-border-red w3-round-large" value="수 정" style="margin-top:1%;">
							<font color="red"><form:errors path="r_content" /></font>
							</div>
						</form:form></td>
				</tr>
				<tr id="reinput_${status.index}" class="reinput">
					<td colspan="4"><form:form action="replyRe.sdj"
							modelAttribute="reply" method="post">
							<input type="hidden" name="r_no" value="${re.r_no}">
							<input type="hidden" value="${board.b_no}" name="b_no">
							<input type="hidden" value="${param.pageNum}" name="pageNum">
							<input type="hidden" value="${param.b_category}"
								name="b_category">
						<div style="width: 100%; float:left;">
							<form:input path="r_content" size="100%" />
							<font color="red"><form:errors path="r_content" /></font>
							<input type="submit" class="w3-btn w3-white w3-border w3-border-red w3-round-large" value="등 록" style="margin-top:1%;">
						</div>
						</form:form></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>

	<form:form modelAttribute="reply" action="r_reply.sdj" method="post">
		<input type="hidden" value="${board.b_no}" name="b_no">
		<input type="hidden" value="${param.pageNum}" name="pageNum">
		<input type="hidden" value="${param.b_category}" name="b_category">
		<div style="width: 100%; float:left;">
			<form:input path="r_content" size="100%" />
			<font color="red"><form:errors path="r_content" /></font>
		<input type="submit" class="w3-btn w3-white w3-border w3-border-red w3-round-large" value="등 록" style="margin-top:1%;">
		</div>
	</form:form>

</div>
</body>
</html>