<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />

<!--CSS-->
<!-- 자바스크립트 -->
<script type="text/javascript" src="/project/assets/js/jquery-1.12.4.js"></script>

<title>결제 완료</title>

</head>

<body>
	<div>
		<!--class="modal fade"-->

		<div >

			<div >


				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>

				<div class="modal-body">
					<div id="header" class="row">
						<i class="bi bi-check2-circle col-md-2"></i>
						<h4 class="modal-title col-md-10">결제가 완료 되었습니다.</h4>
					</div>
					<h4>상세 정보</h4>
					<p class="mar">펫시터 정보</p>
					<div class="inform">
						<div class="row">
							<p class="col-md-6">이름</p>
							<p class="col-md-6">${finishPVo.name}</p>
						</div>

						<div class="line row">
							<p class="col-md-6">전화번호</p>
							<p class="col-md-6">${finishPVo.hp}</p>
						</div>
					</div>
					<p class="mar">예약 정보</p>
					<div class="inform">
						<div class="row">
							<p class="col-md-6">위치</p>
							<p class="col-md-6">${finishPVo.adress1} ${finishPVo.adress2} ${finishPVo.adress3}</p>
						</div>
						<div class="line row">
							<p class="col-md-6">펫 설명 및 요청사항</p>
							<p class="col-md-6 scroll scroll1" id="re">${finishPVo.note}</p>
						</div>
					</div>
					<p class="mar">결제 정보</p>
					<div class="inform">
						<div class="row">
							<p class="col-md-6">날짜</p>
							<p class="col-md-6">${finishPVo.checkin} ~ <br>${finishPVo.checkout}</p>
						</div>

						<div class="row">
							<p class="col-md-6">반려견 마릿수</p>
							<p class="col-md-6">${finishPVo.ea} 마리</p>
						</div>

						<div class="row">
							<p class="col-md-6">총 결제 금액</p>
							<p class="col-md-6">${finishPVo.bookingDate*finishPVo.days*finishPVo.ea} 원</p>
						</div>
					</div>
				</div>

				<div class="modal-footer">
					<p>마이페이지에서 예약 상세을 볼수 있습니다.</p>
					<button type="button" id="btnsub"
					onClick="location.href='${pageContext.request.contextPath}/updateStatusP?bookingNo=${finishPVo.bookingNo}">
						확인
					</button>
				</div>

			</div>
			<!-- /.modal-content -->

		</div>
		<!-- /.modal-dialog-->

	</div>
	<!-- /.modal -->
</body>
</html>

<script>


$("#btnsub").on("click" ,function(){
	var $this = $(this);
	var bookingNo = $this.data("bookingNo");
	
	location.href = "${pageContext.request.contextPath}/updateStatusP?bookingNo=${finishPVo.bookingNo}&usersNo=${finishPVo.usersNo}";
});

</script>