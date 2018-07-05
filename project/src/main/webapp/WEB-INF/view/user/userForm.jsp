<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�� ���� ȭ��</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- <script type="text/javascript">
	$(document).ready(function() {
		$(".list").hide();
		$("#player").keyup(function() {
			var pname = $("#player").val(); // �Էµ� ���̵�
			var data = "pname=" + pname; // �Ķ���� �� ����
			$.ajax({
				type : "POST",
				url : "autocomplete.jsp",
				data : data,
				success : function(html) {
					$(".list").show();
					$(".list").html(html);
					$("li").hover(function() { // li �±��� ���콺 over �̺�Ʈ ����
						$(this).addClass("hover");
					}, function() {
						$(this).removeClass("hover");
					});
					$("li").click(function() {
						$("#player").val($(this).text());
						$(".list").hide();

					})
				}
			})
		})
		$("#id").keyup(function() {
			var id = $("#id").val(); // �Էµ� ���̵�
			var data = "id=" + id; // �Ķ���� �� ����
			$.ajax({
				type : "POST",
				url : "checkId.jsp",
				data : data,
				success : function(html) {
					$(".checkId").html(html);
				}
			})
		})
		$("#nick").keyup(function() {
			var nick = $("#nick").val(); // �Էµ� ���̵�
			var data ="nick=" + nick; // �Ķ���� �� ����
			$.ajax({
				type : "POST",
				url : "checkNick.jsp",
				data : data,
				success : function(html) {
					$(".checkNick").html(html);
				}
			})
		})
	});
</script> -->
<style type="text/css">
	.list {
		background-color: black;
		color: white;
	}
	.checkId {
		background-color: black;
		color: white;
	}
	.hover {
		background-color: white;
		color: black;
	}
</style>

</head>
<body class="w3-content" style="max-width: 300px">
	<div class="w3-row" id="contact">
		<div class="w3-padding-64 w3-padding-large">
			<h1>ȸ������</h1>
			<form:form modelAttribute="user" class="w3-container w3-card w3-padding-32 w3-white"
				action="userEntry.sdj" method="post">
				<spring:hasBindErrors name="user">
					<font color="red"> 
						<c:forEach items="${errors.globalErrors}" var="error">
							<spring:message code="${error.code}" />
						</c:forEach>
					</font>
				</spring:hasBindErrors>
				<div class="w3-section">
					<label>ID</label>
					<form:input class="w3-input" path="m_id" placeholder="ID"/><font color="red"><form:errors path="m_id"/></font> 
					<!-- <input class="w3-input" style="width: 100%;" type="text" required name="m_id" id="m_id"> -->
					<div class=checkId></div>
				</div>
				<div class="w3-section">
					<label>Password</label> 
					<form:password class="w3-input" path="m_passwd" placeholder="��й�ȣ"/><font color="red"><form:errors path="m_passwd"/></font> 
					<!-- <input class="w3-input"	style="width: 100%;" type="m_passwd" required name="m_passwd"> -->
				</div>
				<div class="w3-section">
					<label>Name</label> 
					<form:input  class="w3-input" path="m_name" placeholder="�̸�"/><font color="red"><form:errors path="m_name"/></font> 
					<!-- <input class="w3-input"	style="width: 100%;" type="text" required name="m_name" id="m_name"> -->
					<div class=checkNick></div>
				</div>
				<div class="w3-section">
					<label>Post Code</label>
					<br><input type="button" class="w3-button w3-teal w3-right" onclick="sample6_execDaumPostcode()" value="�����ȣ ã��"><br>
					<input class="w3-input" style="width: 100%;" type="text" name="m_postcode" id="sample6_postcode" placeholder="�����ȣ">
					
				</div>
				<div class="w3-section">
					<label>Address</label>
					<form:input  class="w3-input" id="sample6_address" path="m_address" placeholder="�ּ�"/><font color="red"><form:errors path="m_address"/></font> 
					<input  class="w3-input" id="m_address" name="m_address" placeholder="���ּ�"/> 
					<!-- <input class="w3-input" style="width: 100%;" type="text" required name="m_address" id="m_address"> -->
					<div class=checkNick></div>
				</div>
				<div class="w3-section">
					<label>Phone Number</label>
					<form:input  class="w3-input"  path="m_phone" placeholder="��ȭ��ȣ"/><font color="red"><form:errors path="m_phone"/></font>  
					<!-- <input class="w3-input"	style="width: 100%;" type="text" name="m_phone" id="m_phone"> -->
					<div class="list"></div>
				</div>
				<div class="w3-section">
					<label>Email</label>
					<form:input  class="w3-input"  path="m_email" placeholder="�̸���"/><font color="red"><form:errors path="m_email"/></font>  
					<!--  <input class="w3-input" style="width: 100%;" type="text" required name="m_email" id="m_email"> -->
				</div>
				<div class="w3-section">
					<label>��ȣ �帣</label>
					<select name="m_game">
					 	<option>�����ϼ���</option>
					 	<c:forEach var="m" items="${gametype}">
					 	  <option value="${m.get('tp_no')}">${m.get('tp_name')}</option>
					 	</c:forEach>
					</select>
				</div>
				<input type="hidden" type="text" name="m_mileage" id="m_mileage" value="0">
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
                document.getElementById('m_address').focus();
            }
        }).open();
    }
</script>
</body>
</html>