<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����������</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript">
</script>
</head>
<body class="w3-content" style="max-width: 400px">

	<h3>ȸ�� ��������</h3>
	<div class="w3- row" align="center" style="max-width: 50%" id="minfo"
		style="width:100%">
		<div class="w3- padding-large">
			<form class="w3-container w3-card w3-padding-32 w3-white">
				<div class="w3-section">
					<label>ID</label> <input class="w3-input"
						style="width: 100%; text-align: center;" type="text"
						value="${user.m_id }" readonly="true">
				</div>
				<div class="w3-section">
					<label>Name</label> <input class="w3-input"
						style="width: 100%; text-align: center;" type="text"
						value="${user.m_name }" readonly="true">
				</div>
				<div class="w3-section">
					<label>Address</label> <input class="w3-input"
						style="width: 100%; text-align: center;" type="text"
						value="${user.m_address }" readonly="true">
				</div>
				<div class="w3-section">
					<label>E-Mail</label> <input class="w3-input"
						style="width: 100%; text-align: center;" type="text"
						value="${user.m_email }" readonly="true">
				</div>
				<div class="w3-section">
					<label>��ȣ�帣</label> <input class="w3-input"
						style="width: 100%; text-align: center;" type="text"
						value="${likegame}" readonly="true">
				</div>

				<!-- ����� ��ġ�̵� -->
				<%--  <c:if test="${user.m_id != 'admin' }">
    <a href="javascript:graph_open('mygraph.shop?id=${user.m_id}')">[�׷���]</a>&nbsp;
    </c:if> --%>
			</form>

		</div>
		<c:if test="${loginUser == 'admin'}">
			<a class="w3-button w3-teal w3-center" href="../admin/orderList.sdj">[ȸ���ֹ�
				��Ϻ���]</a>
		</c:if>
		<c:if test="${loginUser != 'admin' }">
			<a class="w3-button w3-teal w3-center"
				href="shoping.sdj?id=${user.m_id }">[�ֹ���������]</a>&nbsp;
    </c:if>
		<a class="w3-button w3-teal w3-center"
			href="update.sdj?id=${user.m_id }">[ȸ����������]</a>&nbsp;
		<c:if test="${loginUser != 'admin' }">
			<a class="w3-button w3-teal w3-center"
				href="delete.sdj?id=${user.m_id }">[ȸ��Ż��]</a>&nbsp;
    </c:if>
		<c:if test="${loginUser == 'admin' }">
			<a class="w3-button w3-teal w3-center" href="../admin/admin.sdj">[ȸ����Ϻ���]</a>&nbsp;
    </c:if>
	</div>
	<br>
</body>
</html>