<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" isErrorPage="true"%>
<%-- isErrorPage="true" : 현재 페이지가 예외 페이지임.
    exception 객체는 exception.CartEmptyException 객체가 전달됨.
 --%>
<script>
  alert('${exception.message}');
  location.href="${exception.url}";
</script>