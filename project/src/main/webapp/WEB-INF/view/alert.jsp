<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- isErrorPage="true" : ���� �������� ���� ��������.
    exception ��ü�� exception.CartEmptyException ��ü�� ���޵�.
 --%>
<script>
  alert('${msg}');
  location.href="${url}";
</script>