<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
  table {
    border-top:1;
    border-bottom:1;
  }
</style>
</head>
<body>
<h2>상품 상세 보기</h2>
<div>
  <span>
    <img src="../picture/${item.i_img }">
  </span>
  <span>
    <table cellpadding="0" cellspacing="0">
      <tr><td>장르</td><td>${item.tp_name }</td></tr>
      <tr><td>판매가</td><td>${item.i_price }</td></tr>
      <tr><td>구매혜택</td><td>적립금 : ${item.i_price*0.01 }</td></tr>
      <tr><td>게임인원</td><td>${item.i_people }명</td></tr>
      <tr><td>게임연령</td><td>${item.i_age }세 이상</td></tr>
    </table>
  </span>
</div>
</body>
</html>