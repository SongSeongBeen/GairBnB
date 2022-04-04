<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<title>펫시터 수정</title>
	<!-- CSS -->
	<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/assets/css/shopAdmin.css" rel="stylesheet" type="text/css" />
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
			<c:import url="/WEB-INF/view/includes/aside.jsp"></c:import>
			<div id="content">
				<div id="content-head" >
					<div id="location" class="clearfix">
						<ul>
							<li>마이페이지</li>
							<li>쇼핑 관리</li>
							<li class="last">상품 관리</li>
						</ul>
					</div>
					<h1>상품관리</h1>
				</div><!-- //content-head -->
				<div id="content-main">
					<div id="itemhistory">
						<table class="table" style="border-bottom:1px solid #EEE;">
						     <colgroup>
	                            <col width="70px">
	                            <col width="200px">
	                            <col width="70px">
	                            <col width="70px">
	                            <col width="70px">
	                            <col width="70px">
	                            <col width="70px">
	                        </colgroup>
							<tr style="background-color:#EEE">
								<th class="text-center">상품번호</th>
								<th class="text-center">상품명</th>
								<th class="text-center">판매가</th>
								<th class="text-center">재고</th>
								<th class="text-center">재고상태</th>
								<th class="text-center">기능</th>
							</tr>
							<c:forEach items="${requestScope.itemList}" var="vo">
							<tr id="item-${vo.itemNo}" style="height:100px;">
								<td class="text-center">${vo.itemNo}</td>
								<td class="text-center">
									<img class="title-img" src="${pageContext.request.contextPath}/photo/${vo.path}">
									<p>${vo.title}<p>
								</td>
								<td class="text-center">${vo.cost}원</td>
								<td class="text-center"><input id="ea-${vo.itemNo}" class="input-ea" type="text" value="${vo.ea}">개</td>
								<td class="text-center">
									<c:if test="${vo.views == 1}">
										진열중
									</c:if>
									<c:if test="${vo.views == 2}">
										진열안됨
									</c:if>
								</td>
								<td class="text-center">
									<div class="btn-group" role="group" aria-label="...">
										<button type="button" class="btn btn-default setea-btn" data-no="${vo.itemNo}">재고 수정</button>
										<div class="btn-group" role="group">
											<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
											옵션
											<span class="caret"></span>
											</button>
											<ul class="dropdown-menu" role="menu">
												<c:if test="${vo.views == 1}">
													노출 OFF
												</c:if>
												<c:if test="${vo.views == 2}">
													노출 ON
												</c:if>
												<li><a href="#">수정</a></li>
												<li class="delete-btn" data-no="${vo.itemNo}"><a>삭제</a></li>
											</ul>
										</div>
									</div>
								</td>
							</tr>
							</c:forEach>
						</table>
					</div>
				</div><!-- //content-main -->
			</div><!-- //content -->
		</div><!-- //container -->
	</div><!-- //wrap -->
	<c:import url="/WEB-INF/view/includes/footer.jsp"></c:import>
<script>
	//재고 수정 버튼 클릭
	$('.setea-btn').on("click", function(){
		var $this = $(this);
		var no = $this.data('no');
		var eavalue = $('#ea-'+no).val();
		
		$.ajax({
			url : "${pageContext.request.contextPath}/shop/setea",    
			type : "post",
			data : {
				itemNo : no,
				ea : eavalue
			},
			success : function(count) {
				console.log("성공")
				alert("재고가 수정되었습니다.");
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		}); 
	});
	//삭제 버튼 클릭
	$('.delete-btn').on("click", function(){
		var $this = $(this);
		var no = $this.data('no');
		
		$.ajax({
			url : "${pageContext.request.contextPath}/shop/delete",    
			type : "post",
			data : {
				itemNo : no
			},
			success : function(count) {
				console.log("성공")
				$('#item-'+no).remove();
				alert("상품이 삭제되었습니다.");
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		}); 
		
	});
</script>
</body>
</html>