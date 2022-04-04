<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/assets/css/yu_main.css" rel="stylesheet" type="text/css"/>
</head>
<body>
   <c:choose>
      <c:when test="${authUser.usersType == 1}"><!--게스트 일때 -->
         <div id="aside">
            <ul id="b-aside">
               <li class="menu">예약관리<img src="${pageContext.request.contextPath}/assets/images/aside_img.png" class="aside-img"></li>
               <ul id="s-aside">
                  <li onclick="location.href='${pageContext.request.contextPath}/bookingBeforeGuest?usersNo=${authUser.usersNo}'">결제 대기내역</li>
                  <li onclick="location.href='${pageContext.request.contextPath}/bookingEndGuest?usersNo=${authUser.usersNo}'">예약관리</li>
               </ul>
               <li>메세지</li>
               <li onclick="location.href='${pageContext.request.contextPath}/user/heartForm?usersNo=${authUser.usersNo}'">찜 목록</li>
               <li onclick="location.href='${pageContext.request.contextPath}/mydog?usersNo=${authUser.usersNo}'">내 강아지</li>
               <li onclick="location.href='${pageContext.request.contextPath}/user/userModifyForm?usersNo=${authUser.usersNo}'">회원 정보 수정</li>
               <li class="menu">내 쇼핑<img src="/project/assets/images/aside_img.png" class="aside-img"></li>
               <ul id="s-aside">
                  <li onclick="location.href='${pageContext.request.contextPath}/shop/myshoplist?usersNo=${authUser.usersNo}'">상품 주문내역</li>
                  <li onclick="location.href='${pageContext.request.contextPath}/shop/myshopcart?userNo=${authUser.usersNo}'">장바구니</li>
               </ul>
            </ul>
         </div>
      </c:when>
      
      <c:when test="${authUser.usersType == 2}"><!-- 펫시터 일때 -->
         <div id="aside">
            <ul id="b-aside">
               <li class="menu">예약관리<img src="/project/assets/images/aside_img.png" class="aside-img"></li>
               <ul id="s-aside">
                  <li onclick="location.href='${pageContext.request.contextPath}/bookingBeforeHost?hostNo=${authUser.hostNo}'">대기내역</li>
                  <li onclick="location.href='${pageContext.request.contextPath}/bookingEndHost?hostNo=${authUser.hostNo}'">예약신청관리</li>
               </ul>
               <li onclick="location.href=href='${pageContext.request.contextPath}/message?usersNo=${authUser.usersNo}'">메세지</li>
               <li class="menu">내 정보<img src="/project/assets/images/aside_img.png" class="aside-img"></li>
               <ul id="s-aside">
                  <li onclick="location.href='${pageContext.request.contextPath}/user/userModifyForm?usersNo=${authUser.usersNo}'">회원 정보 수정</li>
                  <li onclick="location.href='${pageContext.request.contextPath}/host/modifyForm?hostNo=${authUser.hostNo}'">펫시터 정보 수정</li>
               </ul>
               <li class="menu">내 쇼핑<img src="/project/assets/images/aside_img.png" class="aside-img"></li>
               <ul id="s-aside">
                  <li onclick="location.href='${pageContext.request.contextPath}/shop/myshoplist?usersNo=${authUser.usersNo}'">상품 주문내역</li>
                  <li onclick="location.href='${pageContext.request.contextPath}/shop/myshopcart?userNo=${authUser.usersNo}'">장바구니</li>
               </ul>
            </ul>
         </div>
      </c:when>
      <c:otherwise><!-- 관리자 일때 -->
         <div id="aside">
            <ul id="b-aside">
               <li class="menu">쇼핑관리<img src="/project/assets/images/aside_img.png" class="aside-img"></li>
               <ul id="s-aside">
                  <li onclick="location.href='${pageContext.request.contextPath}/shop/writeForm'">상품등록</li>
                  <li onclick="location.href='${pageContext.request.contextPath}/shop/admin'">상품관리</li>
               </ul>
            </ul>
         </div>
      </c:otherwise>
   </c:choose>
</body>

<script>
/* aside */
   // html dom 이 다 로딩된 후 실행된다.
   $(document).ready(function() {
      // memu 클래스 바로 하위에 있는 a 태그를 클릭했을때
      $(".menu").click(function() {
         // 현재 클릭한 태그가 a 이기 때문에
         // a 옆의 태그중 ul 태그에 hide 클래스 태그를 넣던지 빼던지 한다.
         $(this).next("ul").toggleClass("hide");
      });
   }); 
</script>
</html>