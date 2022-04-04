<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!--CSS-->
	<link href="/project/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
	<link href="/project/assets/css/yu_main.css" rel="stylesheet" type="text/css">
	<link href="/project/assets/css/fullcalendar.css" rel="stylesheet" type="text/css">
	<link href="/project/assets/css/reservation.css" rel="stylesheet" type="text/css">
	<link href="/project/assets/css/finishP.css" rel="stylesheet" type="text/css">

	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>

<script type="text/javascript" src="/project/assets/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="/project/assets/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="/project/assets/js/fullcalendar.js"></script>
<script type="text/javascript" src="/project/assets/js/locales-all.js"></script>

<body>

	<!-- header -->
    <c:import url="/WEB-INF/view/includes/header.jsp"></c:import>

    <div id="header_line" class="container-fluid"></div>
	
	<div id="wrap">
		
		<div id="container" class="clearfix">
		
			<!-- aside -->
            <c:import url="/WEB-INF/view/includes/aside.jsp"></c:import>
			
			<div id="content" >
				<div id="content-head">
					<div id="location">
						<ul>
							<li>마이페이지</li>
							<li>예약관리</li>
							<li class="last">결제대기내역</li>
						</ul>
					</div>
					<h1>결제대기내역</h1>
				</div>
				
				<div id="content-main">
					
					<table class="table table-hover g-table">
						<thead>
							<tr>
								<th>예약번호</th>
								<th>프로필사진</th>
								<th>펫시터이름</th>
								<th>예약날짜</th>
								<th>가격</th>
								<th>휴대전화</th>
								<th>예약현황</th>
							</tr>
						</thead>
						
						<tbody id="bookingDetail">
							<c:forEach items="${bList}" var="BookingVo">
								<tr class="bRow">
									<td id="no" class="bOne cursorPointer" data-bookingno="${BookingVo.bookingNo}">${BookingVo.bookingNo}</td>
									<c:choose>
										<c:when test="${!empty BookingVo.hostPath}">
											<td class="bOne cursorPointer" data-bookingno="${BookingVo.bookingNo}"><img class="img-circle" src="${pageContext.request.contextPath}/photo/${BookingVo.hostPath}"></td>
	                                   	</c:when>
										<c:otherwise>
											<td class="bOne cursorPointer" data-bookingno="${BookingVo.bookingNo}"><img class="img-circle" src="${pageContext.request.contextPath}/assets/images/reservation-dog.png"></td>
										</c:otherwise>
									</c:choose>
									<td class="bOne cursorPointer" data-bookingno="${BookingVo.bookingNo}">${BookingVo.hostName}</td>
									<td class="bOne cursorPointer" data-bookingno="${BookingVo.bookingNo}">${BookingVo.checkin} ~ ${BookingVo.checkout}</td>
									<td class="bOne cursorPointer" data-bookingno="${BookingVo.bookingNo}">₩ ${BookingVo.bookingDate * BookingVo.days * BookingVo.ea}</td>
									<td class="bOne cursorPointer" data-bookingno="${BookingVo.bookingNo}">${BookingVo.hostHp}</td>
									<c:choose>
										<c:when test="${BookingVo.status == '승인대기'}">
											<td><div>${BookingVo.status}</div></td>
										</c:when>
										<c:when test="${BookingVo.status == '결제대기'}">
											<td id="payForm" data-toggle="modal" href="${pageContext.request.contextPath}/finishP?bookingNo=${BookingVo.bookingNo}" data-target="#finishP"><div class="btn-re-gradient orange mini cursorPointer">결제대기</div></td>
										</c:when>
									</c:choose>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				
			</div>
		</div>
	</div>
	<div class="modal fade" id ="finishP">
		<!--class="modal fade"-->

		<div class="modal-dialog">

			<div class="modal-content">


				

			</div>
			<!-- /.modal-content -->

		</div>
		<!-- /.modal-dialog-->

	</div>
	<!-- /.modal -->

	
	

</body>

<script>

	/* 테이블 한줄 누르기 */
	$(".bRow").on("click", ".bOne", function(){
		var $this = $(this);
		var bookingNo = $this.data("bookingno");
		
		location.href = "${pageContext.request.contextPath}/bookingDetailGuest?bookingNo="+bookingNo;
	});


</script>
</html>