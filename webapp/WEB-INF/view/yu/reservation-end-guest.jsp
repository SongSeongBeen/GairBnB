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
<link href="/project/assets/css/review.css" rel="stylesheet" type="text/css">

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
							<li class="last">예약관리</li>
						</ul>
					</div>
					<h1>예약관리</h1>
				</div>

				<div id="content-main" class="clearfix">

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
											<c:when test="${BookingVo.status == '예약완료'}">
												<td><div>예약완료</div></td>
											</c:when>
											<c:when test="${BookingVo.status == '펫시팅중'}">
												<td id="reviewForm" data-no="${BookingVo.bookingNo}"><div class="btn-re-gradient orange mini cursorPointer">펫시팅중</div></td>
											</c:when>
											<c:when test="${BookingVo.status == '시팅완료'}">
												<td><div>시팅완료</div></td>
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
	
	<div class="modal fade" id="review">
		<!--class="modal fade"-->
		<div class="modal-dialog">
			<div class="modal-content">
				
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				
				<form id="reviewForm" method="get" action="${pageContext.request.contextPath}/reviewF">
					<div class="modal-body">
						<input type="hidden" name="usersNo" value="${authUser.usersNo}">
						<div id="header">
							<h4 class="modal-title">리뷰하기</h4>
							<p class="small">개장수 님의 펫시팅에 대한 평과와 후기를 남겨주세요.</p>
						</div>
						<h4 class="q">펫시팅이 어땠나요?</h4>
						<p class="ex">펫시터가 펫시팅 중에 올려준 사진 혹은 요청사항에 대한 기준으로 평가를 부탁드립니다</p>
		
						<div class="clearfix">
							<div class="left">식사</div>
							<div class="right">산책</div>
						</div>
						<div class="star row">
							<div class="rate col-md-6">
		
								<div class="rating">
									<input type="radio" name="food" class="rating__control screen-reader" id="food1" value=2.0> 
									<input type="radio" name="food" class="rating__control screen-reader" id="food2" value=4.0> 
									<input type="radio" name="food" class="rating__control screen-reader" id="food3" value=6.0> 
									<input type="radio" name="food" class="rating__control screen-reader" id="food4" value=8.0> 
									<input type="radio" name="food" class="rating__control screen-reader" id="food5" value=10.0> 
									
									<label for="food1" class="rating__item"> 
										<svg class="rating__star">
			                				<use xlink:href="#star"></use>
			                			</svg> 
			                  			<span class="screen-reader">2</span>
									</label> 
									<label for="food2" class="rating__item"> 
										<svg class="rating__star">
		                    				<use xlink:href="#star"></use>
			                  			</svg> 
			                  			<span class="screen-reader">4</span>
									</label> 
									<label for="food3" class="rating__item"> 
										<svg class="rating__star">
			                    			<use xlink:href="#star"></use>
			                  			</svg> 
		                  				<span class="screen-reader">6</span>
									</label> 
									<label for="food4" class="rating__item"> 
										<svg class="rating__star">
			                    				<use xlink:href="#star"></use>
			                  			</svg> 
			                  			<span class="screen-reader">8</span>
									</label> 
									<label for="food5" class="rating__item"> 
										<svg class="rating__star">
		                    				<use xlink:href="#star"></use>
			              				</svg> 
			              				<span class="screen-reader">10</span>
									</label>
								</div>
							</div>
			
			
							<div class="rate col-md-6">
			
								<div class="rating">
									<input type="radio" name="walk" class="rating__control screen-reader" id="walk1" value=2.0> 
									<input type="radio" name="walk" class="rating__control screen-reader" id="walk2" value=4.0> 
									<input type="radio" name="walk" class="rating__control screen-reader" id="walk3" value=6.0> 
									<input type="radio" name="walk" class="rating__control screen-reader" id="walk4" value=8.0> 
									<input type="radio" name="walk" class="rating__control screen-reader" id="walk5" value=10.0> 
									
									<label for="walk1" class="rating__item"> 
										<svg class="rating__star">
		                    				<use xlink:href="#star"></use>
		                    			</svg> 
			                    		<span class="screen-reader">2</span>
									</label> 
									<label for="walk2" class="rating__item"> 
										<svg class="rating__star">
			                    			<use xlink:href="#star"></use>
			                  			</svg> 
			                  			<span class="screen-reader">4</span>
									</label> 
									<label for="walk3" class="rating__item"> 
										<svg class="rating__star">
			                    			<use xlink:href="#star"></use>
			                      		</svg> 
			                      		<span class="screen-reader">6</span>
									</label> 
									<label for="walk4" class="rating__item"> 
										<svg class="rating__star">
			                				<use xlink:href="#star"></use>
			                			</svg> 
			                  			<span class="screen-reader">8</span>
									</label> 
									<label for="walk5" class="rating__item"> 
										<svg class="rating__star">
			                    			<use xlink:href="#star"></use>
			                  			</svg> 
			                    		<span class="screen-reader">10</span>
									</label>
	
								</div>
							</div>
						</div>
			
			
						<div class="clearfix">
							<div class="left">청결</div>
							<div class="right ">놀이</div>
						</div>
						<div class="star row">
							<div class="rate col-md-6">
	
								<div class="rating">
									<input type="radio" name="clean" class="rating__control screen-reader" id="clean1" value=2.0> 
									<input type="radio" name="clean" class="rating__control screen-reader" id="clean2" value=4.0> 
									<input type="radio" name="clean" class="rating__control screen-reader" id="clean3" value=6.0> 
									<input type="radio" name="clean" class="rating__control screen-reader" id="clean4" value=8.0> 
									<input type="radio" name="clean" class="rating__control screen-reader" id="clean5" value=10.0> 
									
									<label for="clean1" class="rating__item"> 
										<svg class="rating__star">
			                    			<use xlink:href="#star"></use>
			                  			</svg> 
			                    		<span class="screen-reader">2</span>
									</label> 
									<label for="clean2" class="rating__item"> 
										<svg class="rating__star">
			                				<use xlink:href="#star"></use>
			              				</svg> 
			              				<span class="screen-reader">4</span>
									</label> 
									<label for="clean3" class="rating__item"> 
										<svg class="rating__star">
			                        		<use xlink:href="#star"></use>
			                      		</svg> 
		                      			<span class="screen-reader">6</span>
									</label> 
									<label for="clean4" class="rating__item"> 
										<svg class="rating__star">
			                				<use xlink:href="#star"></use>
			              				</svg> 
			                			<span class="screen-reader">8</span>
									</label> 
									<label for="clean5" class="rating__item"> 
										<svg class="rating__star">
		                        			<use xlink:href="#star"></use>
			                 	 		</svg> 
			                 	 		<span class="screen-reader">10</span>
									</label>
								</div>
							</div>
		
							<div class="rate col-md-6">
			
								<div class="rating">
									<input type="radio" name="play" class="rating__control screen-reader" id="play1" value=2.0> 
									<input type="radio" name="play" class="rating__control screen-reader" id="play2" value=4.0> 
									<input type="radio" name="play" class="rating__control screen-reader" id="play3" value=6.0> 
									<input type="radio" name="play" class="rating__control screen-reader" id="play4" value=8.0> 
									<input type="radio" name="play" class="rating__control screen-reader" id="play5" value=10.0> 
									
									<label for="play1" class="rating__item"> 
										<svg class="rating__star">
			                    			<use xlink:href="#star"></use>
			                  			</svg> 
			                    		<span class="screen-reader">2</span>
									</label> 
									<label for="play2" class="rating__item"> 
										<svg class="rating__star">
			                				<use xlink:href="#star"></use>
			                			</svg> 
			                  			<span class="screen-reader">4</span>
									</label> 
									<label for="play3" class="rating__item"> 
										<svg class="rating__star">
			                				<use xlink:href="#star"></use>
										</svg> 
			                  			<span class="screen-reader">6</span>
									</label> 
									<label for="play4" class="rating__item"> 
										<svg class="rating__star">
		                					<use xlink:href="#star"></use>
			                			</svg> 
			                 		 	<span class="screen-reader">8</span>
									</label> 
									<label for="play5" class="rating__item"> 
											<svg class="rating__star">
			                    				<use xlink:href="#star"></use>
			                      			</svg> 
			                      		<span class="screen-reader">10</span>
									</label>
	
								</div>
							</div>
						</div>
	
						<div class="row">
							<div class="left col-md-12">소통</div>
						</div>
						<div class="row">
							<div class="rate col-md-6">
		
								<div class="rating">
									<input type="radio" name="communication" class="rating__control screen-reader" id="communication1" value=2.0> 
									<input type="radio" name="communication" class="rating__control screen-reader" id="communication2" value=4.0> 
									<input type="radio" name="communication" class="rating__control screen-reader" id="communication3" value=6.0> 
									<input type="radio" name="communication" class="rating__control screen-reader" id="communication4" value=8.0> 
									<input type="radio" name="communication" class="rating__control screen-reader" id="communication5" value=10.0> 
									
									<label for="communication1" class="rating__item"> 
										<svg class="rating__star">
											<use xlink:href="#star"></use>
										</svg> 
										<span class="screen-reader">2</span>
									</label> 
									<label for="communication2" class="rating__item"> 
										<svg class="rating__star">
											<use xlink:href="#star"></use>
										</svg> 
										<span class="screen-reader">4</span>
									</label> 
									<label for="communication3" class="rating__item"> 
										<svg class="rating__star">
											<use xlink:href="#star"></use>
										</svg> 
										<span class="screen-reader">6</span>
									</label> 
									<label for="communication4" class="rating__item"> 
										<svg class="rating__star">
											<use xlink:href="#star"></use>
										</svg> 
										<span class="screen-reader">8</span>
									</label> 
									<label for="communication5" class="rating__item"> 
										<svg class="rating__star">
											<use xlink:href="#star"></use>
										</svg> 
										<span class="screen-reader">10</span>
									</label>
								</div>
		
							</div>
						</div>
						
						<div class="clearfix">
							<h4 class="q">자세한 후기를 남겨주세요!</h4>
							<textarea id="insert"  name= "review" placeholder="펫시팅 후기를 남겨주세요"></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<input type="hidden" id="bookingNo" name= "bookingNo" value=""> <!-- value="${bookingno}" --> 
						<input type="hidden" name= "reviewDate" value= sysdate>
						<button id="btnsub" type="submit">올리기</button>
					</div>
				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog-->
	</div>
	<!-- /.modal -->
	<svg xmlns="http://www.w3.org/2000/svg" style="display: none">
          <symbol id="star" viewBox="0 0 26 28">
            <path d="M26 10.109c0 .281-.203.547-.406.75l-5.672 5.531 1.344 7.812c.016.109.016.203.016.313 0 .406-.187.781-.641.781a1.27 1.27 0 0 1-.625-.187L13 21.422l-7.016 3.687c-.203.109-.406.187-.625.187-.453 0-.656-.375-.656-.781 0-.109.016-.203.031-.313l1.344-7.812L.39 10.859c-.187-.203-.391-.469-.391-.75 0-.469.484-.656.875-.719l7.844-1.141 3.516-7.109c.141-.297.406-.641.766-.641s.625.344.766.641l3.516 7.109 7.844 1.141c.375.063.875.25.875.719z" />
          </symbol>
    </svg>
</body>

<script>

/* 테이블 한줄 누르기 */
$(".bRow").on("click", ".bOne", function(){
	var $this = $(this);
	var bookingNo = $this.data("bookingno");
	
	location.href = "${pageContext.request.contextPath}/bookingDetailGuest?bookingNo="+bookingNo;
});

/* 펫시팅중 버튼누르면 */
$("#reviewForm").on("click", function(){
	$("#bookingNo").val($("#reviewForm").data("no"));
	$('#review').modal('show');
	
})

	
</script>
</html>