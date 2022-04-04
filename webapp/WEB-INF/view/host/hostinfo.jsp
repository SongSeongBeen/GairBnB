<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>GairBnB - 펫시터 정보</title>
<!--CSS-->
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/info.css?after">
<link href="${pageContext.request.contextPath}/assets/css/fullcalendar.min.css" rel="stylesheet" type="text/css">

<!--자바스크립트-->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/fullcalendar.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/locales-all.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

</head>
<body>
	<c:import url="/WEB-INF/view/includes/header.jsp"></c:import>
	<div id="wrap">
		<div id="container">
			<div class="row row1">
				<div id="profile" class="col-xs-12 left">
					<div id="hostimgbox" class="col-xs-3">
						<c:choose>
							<c:when test="${empty requestScope.hostMap.hostVo.path}">
								<img id="hostimg" src="${pageContext.request.contextPath}/assets/images/hostinfo_sample.jpg" alt="PetSitter Image" class="img-circle">
							</c:when>
							<c:otherwise>
								<img id="hostimg" src="${pageContext.request.contextPath}/photo/${requestScope.hostMap.hostVo.path}" alt="PetSitter Image" class="img-circle">
							</c:otherwise>
						</c:choose>
					</div>
					<div id="hostinfo" class="col-xs-4">
						<h3 class="info">
							<strong>${requestScope.hostMap.hostVo.name}</strong>
						</h3>
						<h4 class="info">
							<small><span class="glyphicon glyphicon-home" aria-hidden="true"></span></small> ${requestScope.hostMap.hostVo.adress1} <small><span class="glyphicon glyphicon-credit-card" aria-hidden="true"></span></small> ${requestScope.hostMap.hostVo.stringcost}원 <small>(1박)</small>
						</h4>
						<div id="infobox">
							<p class="info">${requestScope.hostMap.hostVo.intro}</p>
						</div>
						<div id="tagbox">
							<c:forEach items="${requestScope.hostMap.keyList}" var="vo">
								<span class="tag">#${vo.keywordName}</span>
							</c:forEach>
						</div>
							<div id="btnbox1">
								<button id="btn1" type="button" class="btn btn-primary color">
										<h4>예약 요청</h4>
								</button>
								<button id="btn2" type="button" class="btn btn-default">
									<h4>
										<span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>&nbsp;메시지 보내기
									</h4>
								</button>
								<c:if test="${not empty sessionScope.authUser}">
									<button id="btn3" type="button" class="btn btn-default">
										<span id="heartmark" class="glyphicon glyphicon-heart-empty" aria-hidden="true"></span>
									</button>	
								</c:if>								
							</div>

					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-4 left">
					<div class="row" id="puppypoint">
						<div id="point" class="row">
							<h3 class="normal">
								<small><span class="glyphicon glyphicon-star" aria-hidden="true"></span></small> 퍼피력 <strong>${requestScope.hostMap.puppypoint}</strong>
							</h3>
						</div>
						<c:choose>
							<c:when test="${empty requestScope.hostMap.reviewList}">
								<div id="pointinfo">
									<h4 style="padding: 150px 0px 0px 70px">아직 작성된 리뷰가 없어요.</h4>
								</div>
							</c:when>
							<c:otherwise>
								<div id="graph">
									<div class="row bar" data-toggle="tooltip" data-placement="top" title="식사에 대한 점수">
										<div class="col-xs-2 pointname">
											<h4>
												<span class="glyphicon glyphicon-apple" aria-hidden="true"></span>&nbsp;식사
											</h4>
										</div>
										<div class="progress">
											<div id="bar" class="progress-bar progress-bar-alert food" role="progress-bar" aria-valuenow="6.7" aria-valuemin="0" aria-valuemax="10" data-point="${requestScope.hostMap.point.food}" style="width: ${(requestScope.hostMap.point.food)*10}%;">
												<h4>${requestScope.hostMap.point.food}</h4>
											</div>
										</div>
									</div>
									<div class="row bar" data-toggle="tooltip" data-placement="top" title="산책에 대한 점수">
										<div class="col-xs-2 pointname">
											<h4>
												<span class="glyphicon glyphicon-grain" aria-hidden="true"></span>&nbsp;산책
											</h4>
										</div>
										<div class="progress">
											<div id="bar" class="progress-bar progress-bar-alert walk" role="progress-bar" aria-valuenow="9.2" aria-valuemin="0" aria-valuemax="10" data-point="${requestScope.hostMap.point.walk}" style="width: ${(requestScope.hostMap.point.walk)*10}%;">
												<h4>${requestScope.hostMap.point.walk}</h4>
											</div>
										</div>
									</div>
									<div class="row bar" data-toggle="tooltip" data-placement="top" title="목욕, 빗질등 청결관리에 대한 점수">
										<div class="col-xs-2 pointname">
											<h4>
												<span class="glyphicon glyphicon-tint" aria-hidden="true"></span>&nbsp;청결
											</h4>
										</div>
										<div class="progress">
											<div id="bar" class="progress-bar progress-bar-alert clean" role="progress-bar" aria-valuenow="6.7" aria-valuemin="0" aria-valuemax="10" data-point="${requestScope.hostMap.point.clean}" style="width: ${(requestScope.hostMap.point.clean)*10}%;">
												<h4>${requestScope.hostMap.point.clean}</h4>
											</div>
										</div>
									</div>
									<div class="row bar" data-toggle="tooltip" data-placement="top" title="놀이에 대한 점수">
										<div class="col-xs-2 pointname">
											<h4>
												<span class="glyphicon glyphicon-leaf" aria-hidden="true"></span>&nbsp;놀이
											</h4>
										</div>
										<div class="progress">
											<div id="bar" class="progress-bar progress-bar-alert play" role="progress-bar" aria-valuenow="8.8" aria-valuemin="0" aria-valuemax="10" data-point="${requestScope.hostMap.point.play}" style="width: ${(requestScope.hostMap.point.play)*10}%;">
												<h4>${requestScope.hostMap.point.play}</h4>
											</div>
										</div>
									</div>
									<div class="row bar" data-toggle="tooltip" data-placement="top" title="소통에 대한 점수">
										<div class="col-xs-2 pointname">
											<h4>
												<span class="glyphicon glyphicon-comment" aria-hidden="true"></span>&nbsp;소통
											</h4>
										</div>
										<div class="progress">
											<div id="bar" class="progress-bar progress-bar-alert communication" role="progress-bar" aria-valuenow="9.8" aria-valuemin="0" aria-valuemax="10" data-point="${requestScope.hostMap.point.communication}" style="width: ${(requestScope.hostMap.point.communication)*10}%;">
												<h4>${requestScope.hostMap.point.communication}</h4>
											</div>
										</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div id="picbox" class="col-xs-7">
					<div id="tapbox">
						<ul class="nav nav-tabs">
							<li role="presentation" data-name="호스트사진" class="active"><a>펫시터사진</a></li>
							<li role="presentation" data-name="식사"><a>식사</a></li>
							<li role="presentation" data-name="산책"><a>산책</a></li>
							<li role="presentation" data-name="청결"><a>청결</a></li>
							<li role="presentation" data-name="놀이"><a>놀이</a></li>
						</ul>
					</div>
					<!--앨범-->
					<div id="imgbox">
						<div class="row">
							<div id="imgbox2" style="overflow:scroll;width:832px; height:390px;">
								<c:forEach items="${requestScope.hostMap.photoList}" var="vo">
									<img src="${pageContext.request.contextPath}/photo/${vo.saveName}">
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row clearfix">
				<div class="col-xs-4">
					<div class="row">
						<div id="calendar">
							<h3>일정</h3>
							<div id="l-calendar"></div>
						</div>
						<div>
							<div id="calendarinfo" class="row">
								<div id="ablediv"></div>
								<p class="inlineblock">예약 가능</p>
								<div id="disablediv"></div>
								<p class="inlineblock">예약 불가</p>
							</div>
						</div>
					</div>
					<div class="row">
						<div id="maparea" class="row">
							<h3>${requestScope.hostMap.hostVo.name}의 동네</h3>
							<div id="map" style="width: 465px; height: 300px; margin: 20px 0px 20px 0px"></div>
							<h4>${requestScope.hostMap.hostVo.adress1}</h4>
						</div>
					</div>
				</div>
				<div class="col-xs-8 left clearfix">
					<div id="review">
						<h3>리뷰</h3>
						<h4>${requestScope.hostMap.hostVo.reviewcount}개</h4>
						<div class="row reviewList clearfix">
							<c:choose>
								<c:when test="${not empty requestScope.hostMap.reviewList}">
									<c:forEach items="${requestScope.hostMap.reviewList}" var="vo">
										<div class="reviewbox">
											<div class="row reviewinfo">
												<c:choose>
													<c:when test="${not empty vo.path}">
														<img class="img-circle reviewimg" src="${pageContext.request.contextPath}/photo/${vo.path}">
													</c:when>
													<c:otherwise>
														<img class="img-circle reviewimg" src="${pageContext.request.contextPath}/assets/images/hostinfo_sample.jpg">
													</c:otherwise>
												</c:choose>
												<p class="toph4">${vo.name}</p>
												<p>${vo.reviewDate}</p>
											</div>
											<div>
												<p>${vo.review}</p>
											</div>
										</div>
									</c:forEach>
									<nav id="paging">
										<ul class="pagination">
											<c:if test="${hostMap.prev == true}">
												<li><a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
												</a></li>
											</c:if>
											<c:forEach begin="${hostMap.startPageBtnNo}" end="${hostMap.endPageBtnNo}" step="1" var="page">
												<c:choose>
													<c:when test="${page == param.crtPage}">
														<li class="active"><a class="active" href="${pageContext.request.contextPath}/host/info/${requestScope.hostMap.hostVo.hostNo}?crtPage=${page}">${page}</a></li>
													</c:when>
													<c:otherwise>
														<li><a class="active" href="${pageContext.request.contextPath}/host/info/${requestScope.hostMap.hostVo.hostNo}?crtPage=${page}">${page}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											<c:if test="${hostMap.next == true}">
												<li><a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
												</a></li>
											</c:if>
										</ul>
									</nav>
								</c:when>
								<c:otherwise>
									<h4 style="padding: 150px 0px 0px 300px">아직 작성된 리뷰가 없어요.</h4>
								</c:otherwise>
							</c:choose>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<input type="hidden" id="usersNo" value="${sessionScope.authUser.usersNo}">
	<c:import url="/WEB-INF/view/includes/footer.jsp"></c:import>
	<div class="modal fade" id="photomodal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="imgArea" class="modal-body"></div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c32fc6713e09b64980ab9a6dd7766e97&libraries=services"></script>

	<script>
	// 로딩되기전에 요청
	//페이지가 dom을 생성하고 로딩이 되기 전일때
	$(document).ready(function() {//ready: 돔이 만들어진 후 페이지를 뿌리기 전
		//그래프 컬러
		var arr = [$('.food').data('point'), $('.walk').data('point'), $('.play').data('point'), $('.clean').data('point'), $('.communication').data('point')];
		arr.sort();
		console.log(arr);
		$('[data-point="'+arr[0]+'"]').addClass('warning-bar');	
		$('[data-point="'+arr[3]+'"]').addClass('top-bar');	
		$('[data-point="'+arr[4]+'"]').addClass('top-bar');
		
		//찜 체크
		var no = $('#usersNo').val();
			$.ajax({
				//요청할때
				url : "${pageContext.request.contextPath}/host/getheart",    
				type : "post",
				data : {
					usersNo : no,
					hostNo : ${requestScope.hostMap.hostVo.hostNo}
				},
				success : function(count) {
					console.log(count);
					if(count > 0){
						$('#heartmark').removeClass('glyphicon-heart-empty');
						$('#heartmark').addClass('glyphicon-heart');
					}
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});	
	});

	$(function () {
		  $('[data-toggle="tooltip"]').tooltip()
		});
	//버튼을 눌렀을때
	$("#btn1").on("click", function(){
		if(${sessionScope.authUser.usersType == 2}){
			alert('펫시터는 할 수 없습니다.');
			return;
		} else if(${sessionScope.authUser == null}){
			alert('로그인을 해주세요.');
			return;
		} else {
			location.replace("${pageContext.request.contextPath}/host/booking?hostNo=${requestScope.hostMap.hostVo.hostNo}");
		}
	});
	$("#btn2").on("click", function(){
		if(${sessionScope.authUser.usersType == 2}){
			alert('펫시터는 할 수 없습니다.');
			return;
		} else if(${empty sessionScope.authUser}) {
			alert('로그인을 해주세요');
			return;
		} else {
			location.replace("${pageContext.request.contextPath}/message/getm?usersNo=${sessionScope.authUser.usersNo}&target=${requestScope.hostMap.hostVo.hostNo}");
		}
	});
	$("#btn3").on("click", function(){
		 var no = $('#usersNo').val();
		 if($("#heartmark").hasClass("glyphicon-heart-empty") == true) {
				$('#heartmark').removeClass('glyphicon-heart-empty');
				$('#heartmark').addClass('glyphicon-heart');
			$.ajax({
				url : "${pageContext.request.contextPath}/host/heartinsert",    
				type : "post",
				data : {
					usersNo : no,
					hostNo : ${requestScope.hostMap.hostVo.hostNo}
				},
				success : function(count) {
					console.log(count);
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
		} else {
			$('#heartmark').removeClass('glyphicon-heart');
			$('#heartmark').addClass('glyphicon-heart-empty');
			$.ajax({
				url : "${pageContext.request.contextPath}/host/heartdelete",    
				type : "post",
				data : {
					usersNo : no,
					hostNo : ${requestScope.hostMap.hostVo.hostNo}
				},
				success : function(count) {
					console.log(count);
				},
				error : function(XHR, status, error) {
					console.error(status + " : " + error);
				}
			});
		}
	});

	//사진
	//탭을 클릭했을때
	$("#tapbox ul li").on("click", function(){
		var $this = $(this);
		var name = $this.data('name');
		$("#tapbox ul li").removeClass("active");
		$this.addClass("active");
		
		var photoVo = {
			hostNo : ${requestScope.hostMap.hostVo.hostNo},
			category : name
		};
		
		$("#imgbox2 img").remove();
		
		//요청
		$.ajax({
			//요청할때
			url : "${pageContext.request.contextPath}/host/getPhoto",    
			type : "post",
			data : photoVo,
			
			success : function(photoList) {
				console.log(photoList);
				$("#imgbox2").html("");
				for (var i = 0; i<photoList.length; i++){
					render(photoList[i]);
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});
	
	//사진뿌리기 렌더
	function render(photoVo){
		var str = "";
		str +='<img src="${pageContext.request.contextPath}/photo/'+ photoVo.saveName +'">'
		$("#imgbox2").append(str);
	};
	
	//사진 클릭
	$("#imgbox2").on("click", "img", function(){
		var $this = $(this);
		var src = $(this).attr('src');
		console.log(src);
		$("#imgArea").html('<img src="'+ src +'" style="width:500px;">');
		$('#photomodal').modal('show');
	});
	
	
	//지도 API
	var container = document.getElementById('map');
	var options = {
		center: new kakao.maps.LatLng(33.450701, 126.570667),
		level: 3
	};
	var map = new kakao.maps.Map(container, options);    
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${requestScope.hostMap.hostVo.adress1}', function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">펫시팅 장소</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});  
	//캘린더 라이브러리
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

			editable : true, // 드래그 수정 가능
			locale : 'ko', // 한국어 설정(lib/locales/ko.js)

			// 요일 클릭 이벤트
			dateClick : function() {
			},

			// 일정 클릭 이벤트
			eventClick : function() {
			},


		// 데이터 삽입방식
		events: [
			// ajax 처리로 데이터를 로딩 시킨다. 
			$.ajax({ 
				type:"get", 
				url:"${pageContext.request.contextPath}/calendarAble?hostNo=${requestScope.hostMap.hostVo.hostNo}", 
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
			}),
			$.ajax({ 
				type:"get", 
				url:"${pageContext.request.contextPath}/host/calendar?hostNo=${requestScope.hostMap.hostVo.hostNo}", 
				dataType : "json",
				success: function (bList) {
					for(var i=0; i<bList.length; i++) {
						calendar.addEvent({
							start: bList[i].checkin,
							end: bList[i].checkout,
							status: 'booking',
							display: 'background',
							overlap: true,
							backgroundColor: 'rgb(210, 210, 210)'
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
</body>

</html>
