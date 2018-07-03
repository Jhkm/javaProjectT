<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>상품등록 화면</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
	
	var sel_file;

	$(document).ready(function() {
		$("#img_upload").on("change", handleImgsFilesSelect);
	});

	function handleImgsFilesSelect(e) {
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능 합니다.")
				return;
			}
			sel_file = f;

			var reader = new FileReader();
			reader.onload = function(e) {
				$("#img_ex").attr("src", e.target.result)
			}
			reader.readAsDataURL(f);
		})
	}
</script>
</head>
<body>
<br><br><br>
	<div align="center">
		<form:form modelAttribute="item" action="register.sdj" enctype="multipart/form-data">
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td rowspan="5"><div>
							<img src="../file/test.jpg" id="img_ex" width="200" height="250">
						</div></td>
					<td>게임 장르:</td>
					<!-- 추후에 장르 DB 조회하여 forEach문으로 다시 작성할 예정 -->
					<td><select name="it_no">
					 	<option>선택하세요</option>
					 	<c:forEach var="m" items="${gametype }">
					 	  <option value="${m.get('tp_no') }">${m.get('tp_name') }</option>
					 	</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td>상품명 :</td>
					<td><form:input path="i_name" maxlength="20" size="35" />
					<font color="red"><form:errors path="i_name" /></font></td>
				</tr>
				<tr>
					<td>상품가격 :</td>
					<td><form:input path="i_price" maxlength="20" size="35" />
					<font color="red"><form:errors path="i_price" /></font></td>
				</tr>
				<tr>
					<td>인원 :</td>
					<td><input type="text" size="5" name="i_people"> ~ <input type="text" size="5" name="i_people2"></td>
				</tr>
				<tr>
					<td>연령대 :</td>
					<td><input type="text" size="15" name="i_age">세 이상</td>
				</tr>
				<tr>
					<td colspan="3"><form:textarea path="i_explain"
							id="smarteditor" rows="10" cols="100"
							style="width:766px; height:412px;" />
					<font color="red"><form:errors path="i_explain" /></font></td>
				</tr>
				<tr>
					<td colspan="3"><input type="file" id="img_upload"
						name="i_Img_File"></td>
				</tr>
				<tr>
					<td colspan="3" align="center"><input type="submit" value="등록"></td>
				</tr>
			</table>
		</form:form>
	</div>
</body>
</html>