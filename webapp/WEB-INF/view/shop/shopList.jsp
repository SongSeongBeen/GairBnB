<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 설명</title>
	<!-- CSS-->
	<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/assets/css/shopList.css" rel="stylesheet" type="text/css">
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
			<div id="titleArea">
				<h2><strong>개어비엔비 쇼핑몰</strong></h2>
			</div>
			<div id="categoryArea" class="clearfix">
				<div class="cate active" data-name="전체">전체</div>
				<div class="cate" data-name="사료">사료</div>
				<div class="cate" data-name="간식">간식</div>
				<div class="cate" data-name="용품">용품</div>
			</div>
			<div id="itemArea">
				<c:forEach items="${requestScope.itemList}" var="vo">
					<div class="item">
						<a href="${pageContext.request.contextPath}/shop/info?itemNo=${vo.itemNo}">
							<img src="${pageContext.request.contextPath}/photo/${vo.path}">
						</a>
						<h4>${vo.title}</h4>
						<p>${vo.stringcost}원</p>
						<c:if test="${vo.ea == 0}">
							<h5><span class="label label-default">SOLD OUT</span></h5>
						</c:if>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/view/includes/footer.jsp"></c:import>
<script>
	$('.cate').on("click", function(){
		var $this = $(this);
		var name = $this.data('name');
		$(".cate").removeClass("active");
		$this.addClass("active");
		$.ajax({
			url : "${pageContext.request.contextPath}/shop/categorylist",    
			type : "post",
			data : {
				category : name
			},
			
			success : function(itemList) {
				$("#itemArea").html(" ");
				if(!itemList.length){
					$("#itemArea").html("<h2 style='padding:50px 0px 100px 450px'>조건에 맞는 상품이 없습니다.</h2>");
				}
				for (var i = 0; i<itemList.length; i++){
					render(itemList[i]);
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	});
	//리스트뿌리기 렌더
	function render(itemVo){
		var str = "";
		str +='<div class="item">'
		str +='		<a href="${pageContext.request.contextPath}/shop/info?itemNo='+ itemVo.itemNo +'">'
		str +='			<img src="${pageContext.request.contextPath}/photo/'+ itemVo.path +'">'
		str +='		</a>'
		str +='		<h4>'+ itemVo.title +'</h4>'
		str +='		<p>'+ itemVo.stringcost +'원</p>'
		if(itemVo.ea == 0){
			str +='<h5><span class="label label-default">SOLD OUT</span></h5>'
		}
		str +='</div>'
		$("#itemArea").append(str);
	};
</script>
</body>
</html>