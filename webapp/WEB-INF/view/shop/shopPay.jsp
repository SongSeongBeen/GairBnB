<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 설명</title>
	<!-- CSS-->
	<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/assets/css/shopPay.css" rel="stylesheet" type="text/css">
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
	<div id="container" class="clearfix">
		<h2>상품 주문</h2>
		<div id="payArea">
			<div id="iteminfo">
				<h3>주문 상품 정보</h3>
				<img src="${pageContext.request.contextPath}/photo/${requestScope.itemVo.path}">
				<div class="info">
					<h4>${requestScope.itemVo.title}</h4>
					<h4>1개</h4>
					<h4>${requestScope.itemVo.stringcost}원</h4>
				</div>
			</div>
			<form action="${pageContext.request.contextPath}/shop/payment" method="get">
				<div id="userinfo">
					<h3>주문자 정보</h3>
					<div id="uinfo">
						<input id="text-name" name="name" type="text" value="" placeholder="주문자 이름" autocomplete="off">
						<input id="text-hp" name="hp" type="text" value="" placeholder="연락처" autocomplete="off"><br>
						<input type="text" id="sample4_postcode" class="zipcode" placeholder="우편번호" autocomplete="off">
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" name="address1" id="sample4_jibunAddress" class="adress1" placeholder="지번주소" autocomplete="off"><br>
						<input type="text" name="address2" id="sample4_detailAddress" class="adress2" placeholder="상세주소" autocomplete="off">
						<input id="usersNo" name="usersNo" type="hidden" value="${sessionScope.authUser.usersNo}">
						<input id="sellerNo" name="sellerNo" type="hidden" value="${requestScope.itemVo.usersNo}">
						<input id="itemNo" name="itemNo" type="hidden" value="${requestScope.itemVo.itemNo}">
						<input id="cost" name="cost" type="hidden" value="${requestScope.itemVo.cost}">
						<input id="title" name="title" type="hidden" value="${requestScope.itemVo.title}">
						<input id="ea" name="ea" type="hidden" value="1"></br>
						<button id="payment-btn" type="submit" class="btn btn-primary color">결제하기</button>
					</div>
				</div>
			</form>
		</div>
	</div><!-- container -->
</div><!-- wrap -->

<c:import url="/WEB-INF/view/includes/footer.jsp"></c:import>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

$("#payment-btn").on("click", function(){
	$.ajax({
		url : "${pageContext.request.contextPath}/host/hostkeywordinsert?hostNo="+hostNo,    
		type : "post",
		data : {
			usersNo : $("#usersNo").val(),
			sellerNo : $("#sellerNo").val(),
			itemNo : $("#itemNo").val(),
			cost : $("#cost").val(),
			title : $("#title").val(),
			hp : $("#text-hp").val(),
			address1 : $("#sample4_jibunAddress").val(),
			address2 : $("#sample4_detailAddress").val()
		},
		success : function(hostNo) {
			console.log(hostNo);
			alert("펫시터 신청이 완료되었습니다.");
			window.location.replace("${pageContext.request.contextPath}/main");
		},
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}
	}); 
});
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

            var guideTextBox = document.getElementById("guide");
        }
    }).open();
}
</script>
</body>
</html>
