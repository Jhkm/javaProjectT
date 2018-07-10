<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 가입 화면</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

function idCheck() {
	var id = $("#m_id").val(); // 입력된 아이디
	var button_joinus = document.getElementById('button_joinus');
	button_joinus.disabled = "disabled";
	$.ajax({
		url : 'checkId.sdj',
		type : 'post',
		data : {"m_id":id},
		success : function(data) {
			if (data == "true"){
				$(".checkId").html("");
				$(".checkId").html("사용가능한 아이디입니다.");
				button_joinus.disabled = false;
			} else {
				$(".checkId").html("");
				$(".checkId").html("사용 불가능한 아이디입니다.");
			}
		},
		error:function(request,status,error) {
			alert("code:"+request.status+"\n"+"error:" + error);
		}
	});
}
</script>


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
	<div class="w3-row" id="contact" align="center" style="max-width: 80%;">
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
					<form:input class="w3-input" path="m_id" name="m_id" id="m_id" placeholder="ID"/><font color="red"><form:errors path="m_id" name="m_id" id="m_id"/></font>
					<input type="button" value="중복확인" onclick="idCheck()" />
					<!-- <input class="w3-input" style="width: 100%;" type="text" required name="m_id" id="m_id"> -->
					<div class=checkId></div>
				</div>
				<div class="w3-section">
					<label>Password</label> 
					<form:password class="w3-input" path="m_passwd" name="m_passwd" placeholder="비밀번호"/><font color="red"><form:errors path="m_passwd"/></font> 
					<!-- <input class="w3-input"	style="width: 100%;" type="m_passwd" required name="m_passwd"> -->
				</div>
				<!-- <div class="w3-section">
					<label>Password 중복확인</label>
					<input class="w3-input" type="password" name="passwordcheck" placeholder="비밀번호를 다시 입력하세요">
				</div> -->
				<div class="w3-section">
					<label>Name</label> 
					<form:input  class="w3-input" path="m_name" placeholder="이름"/><font color="red"><form:errors path="m_name"/></font> 
					<!-- <input class="w3-input"	style="width: 100%;" type="text" required name="m_name" id="m_name"> -->
					<div class=checkNick></div>
				</div>
				<div class="w3-section">
					<label>Post Code</label>
					<br><input type="button" class="w3-button w3-teal w3-right" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input class="w3-input" style="width: 100%;" type="text" name="m_postcode" id="sample6_postcode" placeholder="우편번호">
					
				</div>
				<div class="w3-section">
					<label>Address</label>
					<form:input  class="w3-input" id="sample6_address" path="m_address" placeholder="주소" readonly="true"/>
						<font color="red"><form:errors path="m_address"/></font> 
					<input  class="w3-input" id="m_address" name="m_address" placeholder="상세주소"/> 
					<!-- <input class="w3-input" style="width: 100%;" type="text" required name="m_address" id="m_address"> -->
					<div class=checkNick></div>
				</div>
				<div class="w3-section">
					<label>Phone Number</label>
					<form:input  class="w3-input"  path="m_phone" name="m_phone" placeholder="전화번호는 -를 제외한 숫자만 입력해주세요"/><font color="red"><form:errors path="m_phone"/></font>  
					<!-- <input class="w3-input"	style="width: 100%;" type="text" name="m_phone" id="m_phone"> -->
					<div class="list"></div>
				</div>
				<div class="w3-section">
					<label>Email</label>
					<form:input  class="w3-input"  path="m_email" placeholder="이메일"/><font color="red"><form:errors path="m_email"/></font>  
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
				<button type="submit" id="button_joinus" class="w3-button w3-teal w3-right" disabled="disabled">가입하기</button>
				<button type="reset" class="w3-button w3-teal w3-right">초기화</button>
			</form:form>
		</div>

	</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('m_address').focus();
            }
        }).open();
    }
</script>
</body>
</html>