<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	<title>펫시터 수정</title>
	<!-- CSS -->
	<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/assets/css/hostModify.css" rel="stylesheet" type="text/css" />
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
							<li>내 쇼핑</li>
							<li class="last">장바구니</li>
						</ul>
					</div>
					<h1>장바구니</h1>
				</div><!-- //content-head -->
				<div id="content-main">
					<table class="table">
						<tr>
							<th>ㅁ</th>
							<th>상품정보</th>
							<th>수량</th>
							<th>배송정보</th>
							<th>배송비</th>
							<th>가격</th>
							<th></th>
						</tr>
						<tr>
							<td>ㅁ</td>
							<td>ㅁ</td>
							<td>ㅁ</td>
							<td>ㅁ</td>
							<td>ㅁ</td>
							<td>ㅁ</td>
							<td>ㅁ</td>
						<tr>
					</table>
				</div><!-- //content-main -->
			</div><!-- //content -->
		</div><!-- //container -->
	</div><!-- //wrap -->
	<c:import url="/WEB-INF/view/includes/footer.jsp"></c:import>
<script>
</script>
</body>
</html>