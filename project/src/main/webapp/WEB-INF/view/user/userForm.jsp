<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 가입 화면</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- <script type="text/javascript">
	$(document).ready(function() {
		$(".list").hide();
		$("#player").keyup(function() {
			var pname = $("#player").val(); // 입력된 아이디
			var data = "pname=" + pname; // 파라미터 값 설정
			$.ajax({
				type : "POST",
				url : "autocomplete.jsp",
				data : data,
				success : function(html) {
					$(".list").show();
					$(".list").html(html);
					$("li").hover(function() { // li 태그의 마우스 over 이벤트 설정
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
			var id = $("#id").val(); // 입력된 아이디
			var data = "id=" + id; // 파라미터 값 설정
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
			var nick = $("#nick").val(); // 입력된 아이디
			var data ="nick=" + nick; // 파라미터 값 설정
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
			<h1>회원가입</h1>
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
					<form:input class="w3-input" path="m_id"/><font color="red"><form:errors path="m_id"/></font> 
					<!-- <input class="w3-input" style="width: 100%;" type="text" required name="m_id" id="m_id"> -->
					<div class=checkId></div>
				</div>
				<div class="w3-section">
					<label>Password</label> 
					<form:password class="w3-input"  path="m_passwd"/><font color="red"><form:errors path="m_passwd"/></font> 
					<!-- <input class="w3-input"	style="width: 100%;" type="m_passwd" required name="m_passwd"> -->
				</div>
				<div class="w3-section">
					<label>Name</label> 
					<form:input  class="w3-input"  path="m_name"/><font color="red"><form:errors path="m_name"/></font> 
					<!-- <input class="w3-input"	style="width: 100%;" type="text" required name="m_name" id="m_name"> -->
					<div class=checkNick></div>
				</div>
				<div class="w3-section">
					<label>Address</label> 
					<form:input  class="w3-input"  path="m_address"/><font color="red"><form:errors path="m_address"/></font> 
					<!-- <input class="w3-input" style="width: 100%;" type="text" required name="m_address" id="m_address"> -->
					<div class=checkNick></div>
				</div>
				<div class="w3-section">
					<label>Phone Number</label>
					<form:input  class="w3-input"  path="m_phone"/><font color="red"><form:errors path="m_phone"/></font>  
					<!-- <input class="w3-input"	style="width: 100%;" type="text" name="m_phone" id="m_phone"> -->
					<div class="list"></div>
				</div>
				<div class="w3-section">
					<label>Email</label>
					<form:input  class="w3-input"  path="m_email"/><font color="red"><form:errors path="m_email"/></font>  
					<!--  <input class="w3-input" style="width: 100%;" type="text" required name="m_email" id="m_email"> -->
				</div>
				<div class="w3-section">
					<label>선호 장르</label>
					<select name="m_game">
					 	<option>선택하세요</option>
					 	<c:forEach var="m" items="${gametype}">
					 	  <option value="${m.get('tp_no')}">${m.get('tp_name')}</option>
					 	</c:forEach>
					</select>
				</div>
				<input type="hidden" type="text" name="m_mileage" id="m_mileage" value="0">
				<button type="submit" class="w3-button w3-teal w3-right">가입하기</button>
				<button type="reset" class="w3-button w3-teal w3-right">초기화</button>
			</form:form>
		</div>

	</div>
</body>
</html>