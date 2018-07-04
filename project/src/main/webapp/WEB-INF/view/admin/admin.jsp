<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>관리자</title>
<script type="text/javascript">
	function allchkbox(chk) {
			var chks = document.getElementsByName("idchks")
			for(var i=0; i < chks.length; i++) {
				chks[i].checked = chk.checked;
		}
	}
	function graph_open(url){
		var op = "width=700,height=500,scrollbars=yes,left=50,top=150";
		window.open(url + ".shop","graph",op);
	}
	
</script>
</head>
<body>
<form action="mailForm.shop" method="post">
	<table border="1" cellpadding="0" cellspacing="0" width="100%">
		<tr><td colspan="9" align="center">회원 목록</td></tr>
		<tr>
			<td>아이디</td>
			<td>이름</td>
			<td>주소</td>
			<td>전화번호</td>
			<td>이메일</td>
			<td>선호하는 장르</td>
			<td>마일리지</td>
			<td>&nbsp;</td>
			<td><input type="checkbox" name="allchk" onchange="allchkbox(this)"></td>
		</tr>
		<c:forEach items="${userList }" var="user">
			<c:if test="${user.m_id != 'admin'}">
			<tr><td>${user.m_id }</td><td>${user.m_name }</td><td>${user.m_address }</td><td>${user.m_phone }</td>
				<td>${user.m_email }</td>
				<td>
					<c:forEach items="${gametype }" var="g">
						<c:if test="${g.get('tp_no') == user.m_game}">
							${g.get('tp_name') }
						</c:if>
					</c:forEach>
				</td>
				<td>${user.m_mileage }</td>
				<td><a href="../user/update.sdj?id=${user.m_id }">수정</a>
					<a href="../user/delete.sdj?id=${user.m_id }">삭제</a>
					<a href="../user/mypage.sdj?id=${user.m_id }">회원정보</a></td>
				<td><input type="checkbox" name="idchks" value="${user.m_id }"></td>
			</tr>
			</c:if>
		</c:forEach>
		<tr><td colspan="9" align="center">
			<input type="submit" value="메일보내기">
			<!-- <input type="button" value="게시물작성그래프보기파이" onclick="graph_open('graph1')">
			<input type="button" value="게시물작성그래프보기워드" onclick="graph_open('graph2')"> -->
			</td></tr>
			
	</table>
</form>
</body>
</html>