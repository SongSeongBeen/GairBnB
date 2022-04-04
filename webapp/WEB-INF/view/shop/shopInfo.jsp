<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 설명</title>
	<!-- CSS-->
	<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/assets/css/shopInfo.css" rel="stylesheet" type="text/css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

	<!-- JS -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
</head>
<body>
	<c:import url="/WEB-INF/view/includes/header.jsp"></c:import>
	<div id="wrap">
		<div id="container">
			<div id="infoArea" class="row">
				<div id="imageArea" class="col-xs-6">
					<img src="${pageContext.request.contextPath}/photo/${requestScope.itemVo.path}">
				</div>
				<div id="itemArea" class="col-xs-6">
					<div id="info1">
						<h3 class="lead">${requestScope.itemVo.title}</h3>
						<h3 class="lead">${requestScope.itemVo.stringcost}원</h3>
					</div>
					<div id="info2">
						<p>${requestScope.itemVo.info}</p>
					</div>
					<div id="buyinfo">
						<p>${requestScope.itemVo.title}</p>
						<input id="ea" type="number" value="1"><h3>개</h3>
						<h4>${requestScope.itemVo.stringcost}원</h4>
					</div>
					<div id="buyDetail" class="clearfix">
						<p>총 상품금액(1개)</p>
						<h4>${requestScope.itemVo.stringcost}원</h4>
					</div>
					<div id="buttonArea">
						<c:if test="${requestScope.itemVo.ea > 0}">
							<a href="${pageContext.request.contextPath}/shop/pay?itemNo=${requestScope.itemVo.itemNo}">
								<button id="buy" type="button" class="btn btn-primary color">구매하기</button>
							</a>
						</c:if>
						<c:if test="${requestScope.itemVo.ea == 0}">
							<a href="${pageContext.request.contextPath}/shop/pay?itemNo=${requestScope.itemVo.itemNo}">
								<button id="buy" type="button" class="btn btn-primary color">품절된 상품 입니다</button>
							</a>
						</c:if>
						<button id="addcart" type="button" class="btn btn-default">장바구니</button>
					</div>
				</div>
			</div>
			<div id="tapArea" style="margin: 0px 0px 0px 170px;">
				<div class="btn-group" role="group" aria-label="...">
				  <button type="button" class="btn btn-default">상세정보</button>
				  <button type="button" class="btn btn-default">구매평</button>
				  <button type="button" class="btn btn-default">Q&A</button>
				</div>
			</div>
			<div id="detailArea" style="padding: 50px 0px 0px 330px;">
				<img src="${pageContext.request.contextPath}/photo/${requestScope.itemVo.infopath}">
			</div>
		</div>
	</div>
		<input type="hidden" id="usersNo" value="${sessionScope.authUser.usersNo}">
		<input type="hidden" id="itemNo" value="${requestScope.itemVo.itemNo}">
	<c:import url="/WEB-INF/view/includes/footer.jsp"></c:import>

<!-- 모달 -->
		<div class="modal fade" id="cartInsertOk" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						<p class="text-center" style="margin-bottom: 0;" id="cart_add_result_msg">
							선택하신 상품을 장바구니에 담았습니다.						
						</p>
					</div>
					<div class="modal-footer">
						<div class="btn-group-justified">
							<a href="javascript:" class="btn" onclick="SITE_SHOP_DETAIL.hideAddCartAlarm();">계속쇼핑</a>
							<a href="javascript:" class="btn right" onclick="SITE_SHOP_DETAIL.moveCart();">장바구니</a>
						</div>
					</div>
				</div>
			</div>
		</div>
<!-- //모달 -->
</body>
<script>
	//장바구니 버튼 클릭시
	$('#addcart').on("click",function(){
		$('#cartInsertOk').modal('show');
		$.ajax({
			url : "${pageContext.request.contextPath}/shop/cartinsert",    
			type : "post",
			data : {
				usersNo: $('#usersNo').val(),
				itemNo: $('#itemNo').val(),
			},
			success : function(count) {
				console.log(count);
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});
</script>
	
</html>