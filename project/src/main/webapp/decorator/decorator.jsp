<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<decorator:head />
</head>
<body>
<div>
   <div class="w3-top w3-center">
      <div class="w3-bar w3-white w3-card">
         <a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right"
            href="javascript:void(0)" onclick="myFunction()"
            title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
         <a href="#" class="w3-bar-item w3-button w3-padding-large">HOME</a>
          <a href="/project/item/list.sdj"   class="w3-bar-item w3-button w3-padding-large w3-hide-small">������Ӹ�</a>
         <div class="w3-dropdown-hover w3-hide-small">
            <button class="w3-padding-large w3-button" title="More">
               Ŀ�´�Ƽ <i class="fa fa-caret-down"></i>
            </button>
            <div class="w3-dropdown-content w3-bar-block w3-card-4">
               <a href="#" class="w3-bar-item w3-button">�÷����ı�</a>
               <a href="#"   class="w3-bar-item w3-button">�� �Խ���</a>
               <a href="#"   class="w3-bar-item w3-button">�����Խ���</a> 
               <a href="#"   class="w3-bar-item w3-button">��û�Խ���</a> 
               <a href="#"   class="w3-bar-item w3-button">�����Խ���</a> 
               <a href="#"   class="w3-bar-item w3-button">�����÷��� ������</a>
            </div>
         </div>
         <c:if test="${!empty sessionScope.loginUser}">
               	<c:if test="${sessionScope.loginUser eq 'admin' }">
               		<a href="/project/admin/admin.sdj" class="w3-bar-item w3-button w3-padding-large w3-hide-small">������������</a>
              	</c:if>
               	<c:if test="${sessionScope.loginUser ne 'admin' }">
               		<a href="/project/user/mypage.sdj?id=${sessionScope.loginUser}" class="w3-bar-item w3-button w3-padding-large w3-hide-small">����������</a>
               	</c:if>
               </c:if>
         <c:if test="${empty sessionScope.loginUser}">
         <a href="/project/user/login.sdj" class="w3-bar-item w3-button w3-padding-large w3-hide-small">�α���</a>
       	</c:if>
       	<c:if test="${!empty sessionScope.loginUser}">
         <a href="/project/user/logout.sdj" class="w3-bar-item w3-button w3-padding-large w3-hide-small">�α׾ƿ�</a>
       	</c:if>
         <a href="javascript:void(0)"
            class="w3-padding-large w3-hover-red w3-hide-small w3-right"><i
            class="fa fa-search"></i></a>
      </div>
   </div>
   
</div>
<br><br><br>
<div align="center" >
	<decorator:body/>
</div>
</body>
</html>