<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>마이페이지</title>
<script type="text/javascript">
	window.onload=function() {
		document.getElementById("minfo").style.display="block";
	}
	function disp_div(id) {
		document.getElementById("minfo").style.display="none";
		document.getElementById(id).style.display="block";
	}
	function list_disp(id) {
		var disp = document.getElementById(id);
		if(disp.style.display == 'block') {
			disp.style.display = 'none';
		} else {
			disp.style.display = 'block';
		}
	}
	function graph_open(url){
		var op = "width=700,height=500,scrollbars=yes,left=50,top=150";
		window.open(url,"graph",op);
	}
	
	
</script>
<style type="text/css">
	table {
	width : 90%;
	border-collapse: collapse;
	}
	th {
	text-align: center;
	}
</style>
</head>
<body>
<br>
<br>
<br>
<table>
	<tr><td><a href="javascript:disp_div('minfo')">회원정보보기</a></td>
	 <c:if test="${loginUser == 'admin'}">
	    <td><a href="../admin/orderList.sdj">회원주문 목록보기</a></td>
	 </c:if>
	 <c:if test="${loginUser != 'admin'}">
	    <td><a href="shoping.sdj?id=${user.m_id }">주문정보보기</a></td>
	 </c:if>
	</tr>
</table>
<div id="minfo" style="width:100%">
  <table border="1" width="100%">
    <tr><td>아이디</td><td>${user.m_id }</td></tr>
    <tr><td>이름</td><td>${user.m_name }</td></tr>
    <tr><td>주소</td><td>(${user.m_postcode}) ${user.m_address }</td></tr>
    <tr><td>전화번호</td><td>${user.m_phone }</td></tr>
    <tr><td>이메일</td><td>${user.m_email }</td></tr>
    <tr><td>선호장르</td><td>${likegame }</td>
    	<%-- <td>
    		<select name="m_game">
				<option value="${user.m_game }">${likegame }</option>
				<c:forEach var="m" items="${gametype}">
					<c:if test="${m.get('tp_name') != likegame }">
			 		<option value="${m.get('tp_no')}">${m.get('tp_name')}</option>
			 		</c:if>
			 	</c:forEach>
			</select>
    	</td> --%>
    </tr>
  </table>
</div>
<br>
	<a href="logout.sdj">[로그아웃]</a>&nbsp;
	<a href="update.sdj?id=${user.m_id }">[회원정보수정]</a>&nbsp;
    <c:if test="${loginUser != 'admin' }">
    <a href="delete.sdj?id=${user.m_id }">[회원탈퇴]</a>&nbsp;
    </c:if>
    <c:if test="${loginUser == 'admin' }">
    <a href="../admin/admin.sdj">[회원목록보기]</a>&nbsp;
    </c:if>
   <%--  <c:if test="${user.m_id != 'admin' }">
    <a href="javascript:graph_open('mygraph.shop?id=${user.m_id}')">[그래프]</a>&nbsp;
    </c:if> --%>
</body>
</html>