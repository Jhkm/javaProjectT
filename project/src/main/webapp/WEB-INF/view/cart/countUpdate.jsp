<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>수량 수정</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#update").click(function(){
		var no = $("#itemNo").val();
		var quantity = $("#quantity").val()
		$.ajax({
			type:"POST",
			url: "../cart/countUpdate.sdj",
			data : {"itemNo":no,"quantity":quantity},
			success : function(data) {
				
			}
		})
		event.preventDefault();
		window.close();
		window.opener.location.reload();
		
		
	})
})

 /*  function closeAndRefresh() {
	  event.preventDefault()
	  window.opener.location.reload();
	  window.close();
  }  onclick="javascript:closeAndRefresh();"
	  action="countUpdate.sdj" method="post"*/
</script>
<style type="text/css">
table {
	text-align: center;
}
</style>
</head>
<body>
		<input type="hidden" name="itemNo" id="itemNo" value="${item.i_no }">
		<table align="center">
			<tr>
				<td><img alt="상품 이미지" src="../picture/${item.i_img }"
					width="180" height="200"></td>
			</tr>
			<tr>
				<td>${item.i_name}</td>
			</tr>
			<tr>
				<td>수량:<input type="text" name="quantity" value="1" id="quantity" size="5"
					style="text-align: center;"></td>
			</tr>
			<tr>
				<td><input type="submit" value="수정" id="update"><input
					type="button" value="취소" onclick="self.close();"></td>
			</tr>
		</table>
</body>
</html>