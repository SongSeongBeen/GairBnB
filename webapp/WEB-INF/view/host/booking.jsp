<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>GairBnB - 펫시팅 예약하기</title>

<!--CSS-->
<link href="${pageContext.request.contextPath}/assets/css/bookingForm.css?after" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap-datepiker.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/finishR.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/fullcalendar.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<!--자바스크립트-->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap-datepiker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/bootstrap-datepiker.ko.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/fullcalendar.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/locales-all.min.js"></script>

</head>
<body>
	<c:import url="/WEB-INF/view/includes/header.jsp"></c:import>
    <div id="wrap">
        <div id="container">
            <div id="booking" class="col-xs-7 left info">
                <div class="row">
                    <h2>예약신청</h2>                    
                </div>
                <div class="row">
                   	<div id="calendar" style="width=350px; margin: 20px 80px 20px 35px;">
						<div id="l-calendar" style="font-size=1em;"></div>						
					</div>
                    <div class="Q">
                        <h4>1단계. 예약날짜 선택</h4>
                        <div style="text-align:center;">
	                        <span>체크인: </span>
	                        <input type="text" id="datePicker1" class="form-control" value="2022-00-00" style="display:inline-block; width:150px;">
	                        <span>체크아웃: </span>
	                        <input type="text" id="datePicker2" class="form-control" value="2022-00-00" style="display:inline-block; width:150px;">
                        </div><br>
                    </div>
                
                    <div class="Q">
                        <h4>2단계. 반려견 마릿수 선택하기</h4>
                        <div class="btn-group btn-group-justified" role="group" aria-label="...">
                            <div class="btn-group" role="group">
                            <button type="button" data-ea="1" class="btn btn-default active" value="1">1마리</button>
                            </div>
                            <div class="btn-group" role="group">
                            <button type="button" data-ea="2" class="btn btn-default" value="2">2마리</button>
                            </div>
                            <div class="btn-group" role="group">
                            <button type="button" data-ea="3" class="btn btn-default" value="3">3마리</button>
                            </div>
                        </div>
                    </div>
                    <div class="Q">
                        <h4>3단계. 펫 설명 및 요청사항 작성하기</h4>
                        <p>강아지에 대한 설명과 요청사항을 적어주세요! 입력하신 정보는 펫시터에게 같이 전달됩니다.</p>
                          <div class="panel panel-default">
                            <div class="panel-heading">
                              <h3 class="panel-title">펫시터가 당신의 애완동물에게 알고싶은 것</h3>
                            </div>
                            <div class="panel-body">
                                ${requestScope.hostVo.asking}
                            </div>
                          </div>
                        <textarea id="note" class="form-control" rows="3"></textarea>
                    </div>
                </div>
                </div>
            <div id="hostprofile" class="col-xs-4">
                <div id="profile" class="row">
                	<c:choose>
                		<c:when test="${not empty requestScope.hostVo.path}">
                		<img id="hostimg" src="${pageContext.request.contextPath}/photo/${requestScope.hostVo.path}" class="img-circle">
                		</c:when>
                		<c:otherwise>
                			<img id="hostimg" src="${pageContext.request.contextPath}/assets/images/hostinfo_sample.jpg" class="img-circle">
                		</c:otherwise>
                	</c:choose>
                    <h3>${requestScope.hostVo.name}님</h3>
                    <h4>${requestScope.hostVo.adress1}</h4>
                    <button id="btn1" type="button" class="btn btn-default"><h5><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>&nbsp;메시지 보내기</h5></button>
                </div>
                <div id="checkbox" class="row">
                    <h4>예약 및 결제정보</h4>
                    <div class="row">
                        <div id="check" class="col-xs-2" style="padding: 0px 0px 0px 0px;">
                        	<h4>날짜</h4>
                            <h4>일수</h4>
                            <h4>가격</h4>
                            <h4>총 금액</h4>
                        </div>
                        <div id="check2" class="col-xs-6">
                        	<h4><span id="date"><span id="checkin"></span> - <span id="checkout"></span></span></h4>
                            <h4><span id="days">- </span><span>일</span></h4>
                            <h4><span id="bookingDate">${requestScope.hostVo.stringcost}</span><span>원</span> X <span id="ea">1</span><span>마리</span></h4>
                            <h4><span id="hostcost">${requestScope.hostVo.stringcost}</span><span>원</span></h4>
                        </div>
                    </div>
                    <div class="row">
                        <br>
                        <p><span class="label label-danger">!</span>&nbsp;펫시터가 요청을 수락하면 결제가 이루어집니다.</p>
                        <button id="btn2" type="button" class="btn btn-primary">예약 요청</button>
                        <input type="hidden" id="hostNo" value="${requestScope.hostVo.hostNo}">
                        <input type="hidden" id="usersNo" value="${sessionScope.authUser.usersNo}">
                    </div>
                </div>       
            </div>   
        </div>
    </div>
    	<!-- 결제완료 모달창 -->
	<div class="modal fade" id="bookingOk">
      <div class="modal-dialog">
        <div class="modal-content">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <div class="modal-body">
	            <img id="checked"  src="${pageContext.request.contextPath}/assets/images/finishR_check2-circle.svg">
	            <h2 style="padding:0px 0px 0px 45px;">예약이 완료 되었습니다.</h2>
	            <p class="sm">상세 내역은 마이페이지에서 확인 가능합니다.</p>
            </div>
          <div class="modal-footer">
            <div id="footer1">
              <button id="modalOk" class="btnsub" type="button">
                확인
              </button>
            </div>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog-->
	</div>
	<!-- /.modal -->
</body>
<script>
var dayList ;

$(document).ready(function() {//ready: 돔이 만들어진 후 페이지를 뿌리기 전
	console.log("리스트 요청(페이지 로딩전)");
});
//모달 Ok 클릭
$("#modalOk").on("click", function(){
	location.replace("${pageContext.request.contextPath}/main");
});

//마릿수
$(".btn-group.btn-group button").on("click", function(){
	var $this = $(this);
	$(".btn-group.btn-group button").removeClass("active");
	$(this).addClass("active");
	var ea = $this.data('ea');
	$("#ea").text(ea);
	var cost = ${requestScope.hostVo.hostcost} * ea
	$("#cost").text(cost + "원");
	var ea = $("#ea").text();
	var day = $("#bookingDate").text();
	$("#hostcost").text(ea * day);
});

//예약완료 버튼 클릭
$("#btn2").on("click", function(){
	console.log("예약완료")
	var bookingVo = {
		hostNo : $("#hostNo").val(),
		usersNo : $("#usersNo").val(),
		checkin : $("#checkin").text(),
		checkout : $("#checkout").text(),
		ea : $("#ea").text(),
		bookingDate : $("#bookingDate").text(),
		note : $("#note").val()
	};
	console.log(bookingVo);
	
	$.ajax({
		//요청할때
		url : "${pageContext.request.contextPath}/host/bookinginsert",    
		type : "post",
		data : bookingVo,
		
		success : function(count) {
			$('#bookingOk').modal('show');
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	});
});

//체크인 날짜 변경시
$('#datePicker1').on("changeDate", function(e){
	var checkin = $("#datePicker1").val();
	$("#checkin").html(checkin);
});

//체크아웃 날짜 변경시
$('#datePicker2').on("changeDate", function(e){
	var checkin = $("#datePicker1").val();
	var checkout = $("#datePicker2").val();
	$("#checkout").html(checkout);
	
	var dayinArr = checkin.split("-");
	var dayoutArr = checkout.split("-");
	
	var stDate = new Date(dayinArr[0], dayinArr[1], dayinArr[2]);
	var endDate = new Date(dayoutArr[0], dayoutArr[1], dayoutArr[2]);
	
	var btMs = endDate.getTime() - stDate.getTime();
	var days = (btMs / (1000*60*60*24))+1;
	$("#days").text(days);
	
	var cost = days * ${requestScope.hostVo.hostcost}
	
	$("#bookingDate").text(cost);
	
	var ea = $("#ea").text();
	
	$("#hostcost").text(cost * ea);
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
						overlap: true,
						backgroundColor: 'rgb(255, 255, 255)'
					});
				}
				
			}
		}),
		$.ajax({ 
			type:"get", 
			url:"${pageContext.request.contextPath}/host/calendar?hostNo=${param.hostNo}", 
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

//달력
$(function() {	
    $('#datePicker1').datepicker({
        format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
        startDate: '0',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
        endDate: '+1m',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
        autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
        calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
        clearBtn : true, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
        datesDisabled : getList(),//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
        daysOfWeekDisabled : [],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
        daysOfWeekHighlighted : [], //강조 되어야 하는 요일 설정
        disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
        immediateUpdates: true,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
        multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
        multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
        templates : {
            leftArrow: '&laquo;',
            rightArrow: '&raquo;'
        }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
        showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
        title: "체크인",	//캘린더 상단에 보여주는 타이틀
        todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
        toggleActive : false,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
        weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
        language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
        
    });//datepicker end
});//ready end

//날짜 찍기
function getList(){
	var dayList ;
	$.ajax({ 
		type:"get", 
		url:"${pageContext.request.contextPath}/host/getAble?hostNo=${requestScope.hostVo.hostNo}", 
		dataType : "json",
		async: false,
		success: function (ableList) {
			dayList = ableList;
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	})
	return dayList;
}

$(function() {	
    $('#datePicker2').datepicker({
        format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
        startDate: '0',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
        endDate: '+1m',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
        autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
        calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
        clearBtn : true, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
        datesDisabled : getList(),//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
        daysOfWeekDisabled : [],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
        daysOfWeekHighlighted : [], //강조 되어야 하는 요일 설정
        disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
        immediateUpdates: true,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
        multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
        multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
        templates : {
            leftArrow: '&laquo;',
            rightArrow: '&raquo;'
        }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
        showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
        title: "체크아웃",	//캘린더 상단에 보여주는 타이틀
        todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
        toggleActive : false,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
        weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
        language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
        
    });//datepicker end
});//ready end


</script>
</html>