<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="/project/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
	<link href="/project/assets/css/yu_main.css" rel="stylesheet" type="text/css">
	<link href="/project/assets/css/reservation.css" rel="stylesheet" type="text/css">
	<link href="/project/assets/css/fullcalendar.css" rel="stylesheet" type="text/css">
	<link href="/project/assets/css/viewBtn.css" rel="stylesheet" type="text/css">

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

			<div id="content" class="clearfix">
				<div id="content-head">
					<div id="location" class="clearfix">
						<ul>
							<li>마이페이지</li>
							<li>예약관리</li>
							<li class="last">예약신청관리</li>
						</ul>
					</div>
					<h1>예약신청관리</h1>
				</div>

				<div id="content-main" class="clearfix">
					<div id="l-calendar"></div>
					<div id="r-calendar">
						<div id="r-calendar0" class="box-shadow">
							<div id="r-calendar1">
								<h2>검색노출</h2>
								<input type="checkbox" id="checkbox"> <label for="checkbox"><span></span></label>
							</div>
							<div id="r-calendar2">기본적으로 모든 날짜는 예약 불가능으로 설정되어 있습니다.</div>
							<div id="r-calendar3">예약 가능 여부 설정 변경</div>
							<div id="r-calendar4" class="clearfix">
								<div id="r-possible1"></div>
								<div id="r-possible2">예약 가능</div>
							</div>
							<div id="r-calendar5" class="clearfix">
								<div id="r-impossible1"></div>
								<div id="r-impossible2">차단됨</div>
							</div>
						</div>
						<button class="allBtn">날짜전체닫기</button>

					</div>
					<div id="r-list">

						<table class="table table-hover">
                            <colgroup>
								<col style="width: 10%;">
								<col style="width: 10%;">
								<col style="width: 10%;">
								<col style="width: 25%;">
								<col style="width: 15%;">
								<col style="width: 15%;">
								<col style="width: 10%;">
							</colgroup>
							<thead id="guest-table">
								<tr>
									<th>예약번호</th>
									<th>프로필사진</th>
									<th>닉네임</th>
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
	                                   		<c:when test="${!empty BookingVo.guestPath}">
	                                   			<td class="bOne cursorPointer" data-bookingno="${BookingVo.bookingNo}"><img class="img-circle" src="${pageContext.request.contextPath}/photo/${BookingVo.guestPath}"></td>
	                                   		</c:when>
	                                   		<c:otherwise>
	                                   			<td class="bOne cursorPointer" data-bookingno="${BookingVo.bookingNo}"><img class="img-circle" src="${pageContext.request.contextPath}/assets/images/reservation-dog.png"></td>
	                                   		</c:otherwise>
	                                   	</c:choose>
										<td class="bOne cursorPointer" data-bookingno="${BookingVo.bookingNo}">${BookingVo.guestName}</td>
										<td class="bOne cursorPointer" data-bookingno="${BookingVo.bookingNo}">${BookingVo.checkin} ~ ${BookingVo.checkout}</td>
										<td class="bOne cursorPointer" data-bookingno="${BookingVo.bookingNo}">₩ ${BookingVo.bookingDate * BookingVo.days * BookingVo.ea}</td>
										<td class="bOne cursorPointer" data-bookingno="${BookingVo.bookingNo}">${BookingVo.guestHp}</td>
										<c:choose>
											<c:when test="${BookingVo.status == '예약완료'}">
												<td><div class="btn-re-gradient yellow mini">예약완료</div></td>
											</c:when>
											<c:when test="${BookingVo.status == '펫시팅중'}">
												<td><div class="btn-re-gradient orange mini">펫시팅중</div></td>
											</c:when>
											<c:when test="${BookingVo.status == '시팅완료'}">
												<td><div class="btn-re-gradient blue mini">시팅완료</div></td>
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
	</div>
</body>


<script>

	/* 날짜전체닫기 */
	$(".allBtn").on("click", function(){
		
		location.href = "${pageContext.request.contextPath}/bookingEndHostDelete?hostNo=${param.hostNo}";
	});

	/* 테이블 한줄 누르기 */
	$("#bookingDetail").on("click", ".bOne", function(){
		var $this = $(this);
		var bookingNo = $this.data("bookingno");
		
		location.href = "${pageContext.request.contextPath}/bookingDetailHost?bookingNo="+bookingNo;
	});
	
	/* 체크박스 value값 설정 */
	var check = "${hvo.hostview}";
	if(check == 1){
		$("#checkbox").prop("checked", true);
	}else {
		$("#checkbox").prop("checked", false);
	};
	
	/* 검색노출 */
	$(document).ready(function(){
		$("#checkbox").change(function(){
			if($("#checkbox").is(":checked")){
				
				$.ajax({ 
					type:"post", 
					url:"${pageContext.request.contextPath}/viewAble?hostNo=${param.hostNo}&view=1", 
					dataType : "json",
					success: function (result) {
						}
				})
				
			}else {
				
				$.ajax({ 
					type:"post", 
					url:"${pageContext.request.contextPath}/viewAble?hostNo=${param.hostNo}&view=0", 
					dataType : "json",
					success: function (result) {
						}
				})
			}
		})
	});

	/* 달력 */
	document.addEventListener('DOMContentLoaded', function() {

		var calendarEl = document.getElementById('l-calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {

			initialView : 'dayGridMonth', // 월 달력

			// 달력 툴
			headerToolbar : {
				left : 'prev',
				center : 'title',
				right : 'next today,dayGridMonth'
			},

			editable : false, // 드래그 수정 불가능
			locale : 'ko', // 한국어 설정(lib/locales/ko.js)

			// 요일 클릭 이벤트
			dateClick : function() {
			},

			// 일정 클릭 이벤트
			eventClick : function(info) {
				if(info.event.extendedProps.status == 'booking'){
					window.location.href = '${pageContext.request.contextPath}/bookingDetailHost?bookingNo='+document.getElementById('no').getAttribute('data-bookingno');
				}
				
			},
			
			//날짜 클릭 이벤트
			//변수값을 주면 날짜 데이터를 받아올 수 있다
		  	dateClick: function(info) {
		  		//예약된 건이 없는 날짜만 가능날짜 설정이 가능함
		  		if(info.event == null){
		  			//컨트롤러에 날짜값을 넘겨주면 서버에서 가능날짜를 추가 or 삭제한다
		  			window.location.href = '${pageContext.request.contextPath}/bookingEndHostDate?hostNo=${param.hostNo}&date='+info.dateStr;
		  		}			
		  	},

		  	//날짜별 특정 이벤트 표시
			events: [
				// ajax를 이용하여 DB에 저장된 값을 불러온다
				$.ajax({ 
					type:"get", 
					//컨트롤러에 호스트번호값을 넘겨주고 예약 리스트를 받아온다
					url:"${pageContext.request.contextPath}/calendar?hostNo=${param.hostNo}",
					dataType : "json",
					success: function (bList) {
						for(var i=0; i<bList.length; i++) {
							
							//캘린더에 이벤트를 추가한다
							calendar.addEvent({
								title: bList[i].guestName+'('+bList[i].status+')', //게스트이름
								start: bList[i].checkin, //펫시팅 시작날짜
								end: bList[i].checkout, //펫시팅 종료날짜
								status: 'booking', //다른이벤트와 분리하기위한 값
								color: '#ffafb0', //바탕색
								textColor: '#000000' //글자색
							});
						}
						
					}
				}),
				
				$.ajax({ 
					type:"get",
					url:"${pageContext.request.contextPath}/calendarAble?hostNo=${param.hostNo}", 
					dataType : "json",
					success: function (aList) {
						for(var i=0; i<aList.length; i++) {
							calendar.addEvent({
								start: aList[i].ableDate,
								end: aList[i].ableDate,
								allDay: true,
								status: 'done',
								display: 'background',
								overlap: false,
								backgroundColor: 'rgb(255, 255, 255)'
							});
						}
						
					}
				})
			],
			
			 eventDidMount: function(info) {
				if(info.event.extendedProps.status == 'done') {
					info.el.style.opacity = '1';
				}
			} 

		});

		

		// 렌더링

		calendar.render();

	});  

</script>
</html>