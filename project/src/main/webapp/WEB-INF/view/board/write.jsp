<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>게시판 등록</title>
</head>
<body>
  <form action="">
    <table border="1" cellpadding="0" cellspacing="0">
      <tr><td rowspan="4"><div><img src="../file/test.jpg" width="200" height="250"></div></td><td>상품명 : <input type="text"></td></tr>
      <tr><td>상품가격 : <input type="text"></td></tr>
      <tr><td>인원 : <input type="text"></td></tr>
      <tr><td>연령대 : <input type="text"></td></tr>
      <tr><td colspan="2"><textarea rows="15" cols="80"></textarea></td></tr>
      <tr><td colspan="2"><input type="text"></td></tr>
      <tr><td colspan="2"></td></tr>
    </table>
  </form>
</body>
</html>