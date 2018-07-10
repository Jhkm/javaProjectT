<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="/WEB-INF/view/jspHeader.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>상품목록</title>
<style type="text/css">
  div ul { padding-top:10px; list-style-type: none; overflow: auto; }
  div ul li {
    float: left;
    display:inline;
    padding:0 10px;
  }
</style>
</head>
<body>
<br><br><br>
<a href="create.sdj">상품등록</a>
<a href="../cart/cartView.sdj" style="float:right;">장바구니</a>
<%-- <table border="1" cellspacing="0" cellpadding="0">
  <tr><th align="center" width="80">상품ID</th>
      <th align="center" width="320">상품명</th>
      <th align="center" width="100">가격</th>
      <th align="center" width="80">수정</th>
      <th align="center" width="80">삭제</th>
  </tr>
  <c:forEach items="${itemList }" var="item">
    <tr><td align="center">${item.i_no }</td>
        <td align="left">
        <a href="detail.sdj?no=${item.i_no }">${item.i_name }</a></td>
        <td align="right"><fmt:formatNumber type="CURRENCY" currencySymbol="" value="${item.i_price }"/>원</td>
        <td align="center"><a href="edit.sdj?no=${item.i_no }">수정</a></td>
        <td align="center"><a href="confirm.sdj?no=${item.i_no }">삭제</a></td>
    </tr>
  </c:forEach>
</table> --%>
<form action="list.sdj" method="post">
<div style="width:70%" align="left">
<!-- select 바뀔때 바로 정렬 바뀌도록 하기 -->
	<select id="array" name="sort" onchange="this.form.submit()">
		<option value="i_no desc">상품 등록 순</option>
		<option value="i_amount desc">판매 인기 순</option>
		<option value="like desc">추천 순</option>
		<option value="i_price">낮은 가격 순</option>
		<option value="i_price desc">높은 가격 순</option>
		<option value="i_age">게임 연령 낮은순</option>
		<option value="i_age desc">게임 연령 높은순</option>
	</select>
	<script type="text/javascript">
		array.value = '${sort}'
		if(${sort == null}) {array.value = 'i_no desc'};
	</script>
</div>

<div style="width:70%">
  <ul>
    <c:forEach var="item" items="${itemList }" begin="${(pageNum-1)*25 }" end="${pageNum*25 - 1 }">
      <li style="width:20%">
      <div style="width:182px;">
        <div>
          <a href="detail.sdj?no=${item.i_no }&pageNum=${pageNum}">
            <img src="../picture/${item.i_img }" height="250" width="180">
          </a>
        </div>
        <div>
          <a href="detail.sdj?no=${item.i_no }&pageNum=${pageNum}">${item.i_name }</a>
        </div>
        <br>
        <div>
          <strong><font color="#ec187c"><fmt:formatNumber type="CURRENCY" currencySymbol="" value="${item.i_price }"/></font><strong>원
        </div>
      </div>
      </li>
    </c:forEach>
  </ul>
  <c:forEach var="a" begin="${startPage }" end="${endPage}">
  <c:if test="${pageNum == a }">
  <a>${a}</a>
  </c:if>
  <c:if test="${pageNum != a }">
  <a href="list.sdj?pageNum=${a}">${a}</a>
  </c:if>
  </c:forEach>
  <br>
    <input type="hidden" name="gametype" value="${gametype}">
    <select name="kind">
      <option value="i_name">제목</option>
      <option value="i_explain">내용</option>
    </select>&nbsp;<input type="text" size="40" name="find">&nbsp;<input type="submit" value="검색">
</div>
</form>
</body>
</html>