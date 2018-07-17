<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript">
	function allchkbox(chk) {
		var chks = document.getElementsByName("idchks")
		for (var i = 0; i < chks.length; i++) {
			chks[i].checked = chk.checked;
		}
	}
	function graph_open(url) {
		var op = "width=700,height=500,scrollbars=yes,left=50,top=150";
		window.open(url + ".shop", "graph", op);
	}
</script>
</head>
<body class="w3-container" style="max-width: 300px">
	<a href="orderList.sdj">ȸ�� �ֹ����</a>
	<div class="w3-row">
		<div class="w3-container">
			<form action="mailForm.shop" method="post">
				<div class="w3-padding-64 w3-center">
					<h2>ȸ�� ���</h2>
					<div class="w3-container w3-responsive" align="center">
						<table class="w3-table">
							<tr class="w3-blue-gray">
								<th>���̵�</th>
								<th>�̸�</th>
								<th>�ּ�</th>
								<th>��ȭ��ȣ</th>
								<th>�̸���</th>
								<th>��ȣ�ϴ� �帣</th>
								<th>���ϸ���</th>
								<th>&nbsp;</th>
								<th><input type="checkbox" name="allchk"
									onchange="allchkbox(this)"></th>
							</tr>
							<c:forEach items="${userList }" var="user" varStatus="s">
								<c:if test="${s.index % 2 == 1 }">
									<tr class="w3-indigo ">
										<td>${user.m_id }</td>
										<td>${user.m_name }</td>
										<td>(${user.m_postcode})${user.m_address }</td>
										<td>${user.m_phone }</td>
										<td>${user.m_email }</td>
										<td><c:forEach items="${gametype }" var="g">
												<c:if test="${g.get('tp_no') == user.m_game}">
											${g.get('tp_name') }
										</c:if>
											</c:forEach></td>
										<td>${user.m_mileage }</td>
										<td><a href="../user/update.sdj?id=${user.m_id }">����</a>
											<c:if test="${user.m_id != 'admin' }">
												<a href="../user/delete.sdj?id=${user.m_id }">����</a>
											</c:if> <a href="../user/mypage.sdj?id=${user.m_id }">ȸ������</a></td>
										<td><input type="checkbox" name="idchks"
											value="${user.m_id }"></td>
									</tr>
								</c:if>
								<c:if test="${s.index % 2 == 0 }">
									<tr class="w3-pale-green">
										<td>${user.m_id }</td>
										<td>${user.m_name }</td>
										<td>(${user.m_postcode})${user.m_address }</td>
										<td>${user.m_phone }</td>
										<td>${user.m_email }</td>
										<td><c:forEach items="${gametype }" var="g">
												<c:if test="${g.get('tp_no') == user.m_game}">
							${g.get('tp_name') }
						</c:if>
											</c:forEach></td>
										<td>${user.m_mileage }</td>
										<td><a href="../user/update.sdj?id=${user.m_id }">����</a>
											<c:if test="${user.m_id != 'admin' }">
												<a href="../user/delete.sdj?id=${user.m_id }">����</a>
											</c:if> <a href="../user/mypage.sdj?id=${user.m_id }">ȸ������</a></td>
										<td><input type="checkbox" name="idchks"
											value="${user.m_id }"></td>
									</tr>
								</c:if>
							</c:forEach>
							<tr>
								<td colspan="9"><input class="w3-button w3-teal w3-right"
									type="submit" value="���Ϻ�����"></td>
							</tr>
						</table>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>