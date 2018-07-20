<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>상품등록 화면</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
	
	var sel_file;

	$(document).ready(function() {
		$("#img_upload").on("change", handleImgsFilesSelect);
		$(document).on("change",".upload-hidden",function(e){
			if(window.FileReader){ // modern browser 
				var filename = $(this)[0].files[0].name; 
			} else { // old IE 
				var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
			} // 추출한 파일명 삽입
			$(this).siblings('.upload-name').val(filename);
			$(this).hide();
			$(this).removeClass('upload-hidden')
			
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
					$("#content_img_div").append("<img width='80px' height='80px' src='" + e.target.result +"'><a href=''>x</a>");
					$(".filebox").append("<input type='file' name='contentImgFile' class='upload-hidden'>") 
				}
				reader.readAsDataURL(f);
			})
		})
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
<style type="text/css">
	#plus_button {
		border-color:#ffffff;
		background-color :#ffffff;
		background-color : rgba( 255, 255, 255, 0.0 );
		
	}
</style>
</head>
<body>
	<br>
	<br>
	<br>
	<div align="center" style="width:50%;">
		<img src="../file/195CEA254CE5F9721E.png" id="img_ex" width="80%" height="500">
		<form:form modelAttribute="item" action="register.sdj" enctype="multipart/form-data">
			<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td colspan="2">게임 장르:</td>
					<td colspan="2"><select name="it_no">
							<option>선택하세요</option>
							<c:forEach var="m" items="${gametype }">
								<option value="${m.get('tp_no') }">${m.get('tp_name') }</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td colspan="2">상품명 :</td>
					<td><form:input path="i_name" maxlength="20" size="35" /><font color="red"><form:errors path="i_name" /></font></td>
				</tr>
				<tr>
					<td colspan="2">상품가격 :</td>
					<td><form:input path="i_price" maxlength="20" size="35" /><font color="red"><form:errors path="i_price" /></font></td>
				</tr>
				<tr>
					<td colspan="2">인원 :</td>
					<td><input type="text" size="5" name="i_people"> ~ <input
						type="text" size="5" name="i_people2"></td>
				</tr>
				<tr>
					<td colspan="2">연령대 :</td>
					<td><input type="text" size="15" name="i_age">세 이상</td>
				</tr>
				<tr>
					<td colspan="3"><form:textarea path="i_explain"
							id="smarteditor" rows="10" cols="100"
							style="width:766px; height:412px;" /> <font color="red"><form:errors path="i_explain" /></font></td>
				</tr>
				<tr>
					<td colspan="3"><input type="file" id="img_upload" name="i_Img_File" accept="image/*"></td>
				</tr>
				<tr><td colspan="3"><div class="filebox">
					<input type="file" name='contentImgFile' class="upload-hidden" >
				</div><div id="content_img_div"></div></td></tr>
				<tr>
					<td colspan="3" align="center"><input type="button" value="목록"
						onclick="location.href='list.sdj'"><input type="submit"
						value="등록"></td>
				</tr>
			</table>
		</form:form>
	</div>
</body>
</html>