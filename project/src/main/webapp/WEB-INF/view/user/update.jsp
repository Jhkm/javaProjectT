<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����� ���� ����</title>
</head>
<body class="w3-content" style="max-width: 300px">
	<div class="w3-row" id="contact" style="width:50%;">
		<div class="w3-padding-64 w3-padding-large">
			<h1>ȸ�� ���� ����</h1>
			<form:form modelAttribute="user"
				class="w3-container w3-card w3-padding-32 w3-white"
				action="update.sdj" method="post">
				<spring:hasBindErrors name="user">
					<font color="red"> <c:forEach items="${errors.globalErrors}"
							var="error">
							<spring:message code="${error.code}" />
						</c:forEach>
					</font>
				</spring:hasBindErrors>
				<div class="w3-section">
					<label>ID</label>
					<form:input class="w3-input" path="m_id" readonly="true" />
					<font color="red"><form:errors path="m_id" /></font>
					<!-- <input class="w3-input" style="width: 100%;" type="text" required name="m_id" id="m_id"> -->
					<div class=checkId></div>
				</div>
				<div class="w3-section">
					<label>Password</label>
					<form:password class="w3-input" path="m_passwd" />
					<font color="red"><form:errors path="m_passwd" /></font>
					<!-- <input class="w3-input"	style="width: 100%;" type="m_passwd" required name="m_passwd"> -->
				</div>
				<div class="w3-section">
					<label>Name</label>
					<form:input class="w3-input" path="m_name" />
					<font color="red"><form:errors path="m_name" /></font>
					<!-- <input class="w3-input"	style="width: 100%;" type="text" required name="m_name" id="m_name"> -->
					<div class=checkNick></div>
				</div>
				<div class="w3-section">
					<label style="align-self: center;">Post Code</label> <br>
					<input type="button" class="w3-button w3-teal w3-right"
						onclick="sample6_execDaumPostcode()" value="�����ȣ ã��"><br>
					<input class="w3-input" style="width: 100%;"
						value="${user.m_postcode}" name="m_postcode" id="sample6_postcode">

				</div>
				<div class="w3-section">
					<label>Address</label>
					<form:input class="w3-input" id="sample6_address" path="m_address" />
					<font color="red"><form:errors path="m_address" /></font> <input
						class="w3-input" id="sample6_address2" name="m_address"
						value="${address}" />
					<!-- <input class="w3-input" style="width: 100%;" type="text" required name="m_address" id="m_address"> -->
					<div class=checkNick></div>
				</div>
				<div class="w3-section">
					<label>Phone Number</label>
					<form:input class="w3-input" path="m_phone" />
					<font color="red"><form:errors path="m_phone" /></font>
					<!-- <input class="w3-input"	style="width: 100%;" type="text" name="m_phone" id="m_phone"> -->
					<div class="list"></div>
				</div>
				<div class="w3-section">
					<label>Email</label>
					<form:input class="w3-input" path="m_email" />
					<font color="red"><form:errors path="m_email" /></font>
					<!--  <input class="w3-input" style="width: 100%;" type="text" required name="m_email" id="m_email"> -->
				</div>
				<div class="w3-section">
					<label>��ȣ �帣</label> <select name="m_game">
						<option value="${user.m_game }">${likegame }</option>
						<c:forEach var="m" items="${gametype}">
							<c:if test="${m.get('tp_name') != likegame }">
								<option value="${m.get('tp_no')}">${m.get('tp_name')}</option>
							</c:if>
						</c:forEach>
					</select>
				</div>
				<input type="hidden" type="text" name="m_mileage" id="m_mileage"
					value="m_mileage">
				<button type="submit" class="w3-button w3-teal w3-right">�����ϱ�</button>
				<button type="reset" class="w3-button w3-teal w3-right">�ʱ�ȭ</button>
			</form:form>
		</div>

	</div>

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var fullAddr = ''; // ���� �ּ� ����
                var extraAddr = ''; // ������ �ּ� ����

                // ����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
                if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
                    fullAddr = data.roadAddress;

                } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
                    fullAddr = data.jibunAddress;
                }

                // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����Ѵ�.
                if(data.userSelectedType === 'R'){
                    //���������� ���� ��� �߰��Ѵ�.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // �ǹ����� ���� ��� �߰��Ѵ�.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // �������ּ��� ������ ���� ���ʿ� ��ȣ�� �߰��Ͽ� ���� �ּҸ� �����.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.getElementById('sample6_postcode').value = data.zonecode; //5�ڸ� �������ȣ ���
                document.getElementById('sample6_address').value = fullAddr;

                // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
</body>
</html>