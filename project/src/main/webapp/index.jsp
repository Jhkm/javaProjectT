<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>보드행</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
   href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div>
   <div class="w3-top w3-center">
      <div class="w3-bar w3-white w3-card">
         <a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right"
            href="javascript:void(0)" onclick="myFunction()"
            title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
         <a href="/project/index.jsp" class="w3-bar-item w3-button w3-padding-large">HOME</a>
          <a href="/project/item/list.sdj"   class="w3-bar-item w3-button w3-padding-large w3-hide-small">보드게임몰</a>
         <div class="w3-dropdown-hover w3-hide-small">
            <button class="w3-padding-large w3-button" title="More">
               커뮤니티 <i class="fa fa-caret-down"></i>
            </button>
            <div class="w3-dropdown-content w3-bar-block w3-card-4">
               <a href="/project/board/list.sdj?b_category=1" class="w3-bar-item w3-button">플레이후기</a>
               <a href="/project/board/list.sdj?b_category=2"   class="w3-bar-item w3-button">팁 게시판</a>
               <a href="/project/board/list.sdj?b_category=3"   class="w3-bar-item w3-button">자유게시판</a> 
               <a href="/project/board/list.sdj?b_category=4"   class="w3-bar-item w3-button">요청게시판</a> 
               <a href="/project/board/list.sdj?b_category=5"   class="w3-bar-item w3-button">번개게시판</a> 
               <a href="/project/board/list.sdj?b_category=6"   class="w3-bar-item w3-button">게임플레이 동영상</a>
            </div>
         </div>
         <c:if test="${!empty sessionScope.loginUser}">
               	<c:if test="${sessionScope.loginUser eq 'admin' }">
               		<a href="/project/admin/admin.sdj" class="w3-bar-item w3-button w3-padding-large w3-hide-small">관리자페이지</a>
              	</c:if>
               	<c:if test="${sessionScope.loginUser ne 'admin' }">
               		<a href="/project/user/mypage.sdj?id=${sessionScope.loginUser }" class="w3-bar-item w3-button w3-padding-large w3-hide-small">마이페이지</a>
               	</c:if>
               </c:if>
         <c:if test="${empty sessionScope.loginUser}">
         <a href="/project/user/login.sdj" class="w3-bar-item w3-button w3-padding-large w3-hide-small">로그인</a>
       	</c:if>
       	<c:if test="${!empty sessionScope.loginUser}">
         <a href="/project/user/logout.sdj" class="w3-bar-item w3-button w3-padding-large w3-hide-small">로그아웃</a>
       	</c:if>
         <a href="javascript:void(0)"
            class="w3-padding-large w3-hover-red w3-hide-small w3-right"><i
            class="fa fa-search"></i></a>
      </div>
   </div>
<div class="w3-content"
      style="max-width: 800px; margin-top: 100px; margin-left: 25%;">
      <div id="myCarousel" class="carousel slide" data-ride="carousel" > 
   
   <!--페이지-->
   <ol class="carousel-indicators" >
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
      <li data-target="#myCarousel" data-slide-to="4"></li>
      <li data-target="#myCarousel" data-slide-to="5"></li>
       
   </ol>
   <!--페이지-->
   
   <div class="carousel-inner" >
      <!--슬라이드1-->
      <div class="item active"> 
         <img src="/project/img/1.jpg" style="width:100%" alt="First slide">
         <div class="container">
            <div class="carousel-caption">
               <!-- <h1>Slide 1</h1>
               <p>텍스트 1</p> -->
            </div>
         </div>
      </div>
      <!--슬라이드1-->

      <!--슬라이드2-->
      <div class="item"> 
         <img src="/project/img/2.jpg" style="width:100%" data-src="" alt="Second slide">
         <div class="container">
            <div class="carousel-caption">
               <!-- <h1>Slide 2</h1>
               <p>텍스트 2</p> -->
            </div>
         </div>
      </div>
      <!--슬라이드2-->
      
      <!--슬라이드3-->
      <div class="item"> 
         <img src="/project/img/3.jpg" style="width:100%" data-src="" alt="Third slide">
         <div class="container">
            <div class="carousel-caption">
               <!-- <h1>Slide 3</h1>
               <p>텍스트 3</p> -->
            </div>
         </div>
      </div>
      <!--슬라이드3-->
      
      <!--슬라이드4-->
      <div class="item"> 
         <img src="/project/img/4.jpg" style="width:100%" data-src="" alt="Fourth slide">
         <div class="container">
            <div class="carousel-caption">
               <!-- <h1>Slide 4</h1>
               <p>텍스트 4</p> -->
            </div>
         </div>
      </div>
      <!--슬라이드4-->
      
      <!--슬라이드5-->
      <div class="item"> 
         <img src="/project/img/5.jpg" style="width:100%" data-src="" alt="Fifth slide">
         <div class="container">
            <div class="carousel-caption">
               <!-- <h1>Slide 5</h1>
               <p>텍스트 5</p> -->
            </div>
         </div>
      </div>
      <!--슬라이드5-->
      
      <!--슬라이드6-->
      <div class="item"> 
         <img src="/project/img/6.jpg" style="width:100%" data-src="" alt="Sixth slide">
         <div class="container">
            <div class="carousel-caption">
               <!-- <h1>Slide 6</h1>
               <p>텍스트 6</p> -->
            </div>
         </div>
      </div>
      <!--슬라이드6-->
   </div>
   
   <!--이전, 다음 버튼-->
   <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> 
   <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a> 
</div>
   <link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />
   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
   <script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
   </div>
</div>
</body>
</html>