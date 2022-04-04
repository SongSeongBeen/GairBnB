<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<!-- 메타태그 -->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--메타데이터-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--CSS -->
<link href="/project/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="/project/assets/css/yu_main.css" rel="stylesheet" type="text/css">
<link href="/project/assets/css/message.css" rel="stylesheet" type="text/css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- 자바스크립트 -->
<script type="text/javascript" src="/project/assets/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="/project/assets/bootstrap/js/bootstrap.js"></script>


<title>개어비엔비</title>
</head>
<body>
	<!-- 헤더 -->
	<c:import url="/WEB-INF/view/includes/header.jsp"></c:import>
	<!--wrap-->
	<div id="wrap">

		<div id="container">
			<c:import url="/WEB-INF/view/includes/aside.jsp"></c:import>

			<div id="content">

				<!-- <p id="nav">마이 사이트 > 메세지</p>
                    <p id="now">메세지</p> -->

				<div id="content-head">
					<div id="location" class="clearfix">
						<ul>
							<li>마이페이지</li>
							<li class="last">메세지</li>
						</ul>
					</div>
					<h1>메세지</h1>
				</div>

				<div id="content-main">
					<div class=" row clearfix">
						<div id="list" class="col-xs-12">
							<c:choose>
								<c:when test="${empty requestScope.getType.path}">
									<img id="hostimg" src="${pageContext.request.contextPath}/assets/images/hostinfo_sample.jpg" alt="PetSitter Image" class="profile">
								</c:when>
								<c:otherwise>
									<img id="hostimg" src="${pageContext.request.contextPath}/photo/${requestScope.getType.path}" alt="PetSitter Image" class="profile">
								</c:otherwise>
							</c:choose>
							<p>${getType.name}님</p>
						</div>
						<div id="pdetail" class="col-xs-12 clearfix">
							<c:choose>
								<c:when test="${empty getName.name}">
                        		</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${empty getName.path}">
											<img id="hostimg" src="${pageContext.request.contextPath}/assets/images/hostinfo_sample.jpg" alt="PetSitter Image" class="profile">
										</c:when>
										<c:otherwise>
											<img id="hostimg" src="${pageContext.request.contextPath}/photo/${getName.path}" alt="Image" class="profile">
										</c:otherwise>
									</c:choose>
									<p class="name">${getName.name}님과 펫채팅</p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class=" row clearfix">
						<div id="dList" class="clearfix scroll scroll1">
							<c:forEach items="${getList}" var="list">
									<div class="clearfix link mList" OnClick="location.href ='${pageContext.request.contextPath}/message/getm?target=${list.target}&usersNo=${list.me}'" style="cursor: pointer;">
										<c:choose>
											<c:when test="${empty list.path}">
												<img id="hostimg" src="${pageContext.request.contextPath}/assets/images/hostinfo_sample.jpg" alt="PetSitter Image" class="profile">
											</c:when>
											<c:otherwise>
												<img id="hostimg" src="${pageContext.request.contextPath}/photo/${list.path}" alt="Image" class="profile">
											</c:otherwise>
										</c:choose>
										<p class="name">${list.name}님</p>
										<div>
											<p class="timeL">${list.sendDate}</p>
										</div>
									</div>
								
							</c:forEach>
						</div>

						<div id="conver" class="col-xs-12 clearfix scroll scroll1">
							<c:choose>
								<c:when test ="${empty mList}">
									<p id="defualt">대화를 <br>시작해보세요!</p>
								</c:when>
								
								<c:otherwise>
									<c:forEach items="${mList}" var="mList">
										<c:choose>
											<c:when test="${mList.usersFrom eq param.usersNo}">
												<div class="textme">
													<!--메세지창+시간-->
													<div class="talk-bubblet">
														<div class="talktext">
															<p>${mList.text}</p>
														</div>
													</div>
													<p class="timeme">${mList.sendDate}</p>
												</div>
											</c:when>
											<c:otherwise>
												<div class="textyou">
													<!--메세지창+시간-->
													<div class="talk-bubble">
														<div class="talktext">
															<p>${mList.text}</p>
														</div>
													</div>
													<p class="time">${mList.sendDate}</p>
												</div>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</div>
						<div id="text" class="clearfix">
							<form id="insertText" method="get" action="${pageContext.request.contextPath}/message/setm">
								<textarea id="insert" name="text" class="col-xs-7" placeholder="메세지를 입력하세요"> </textarea>
								<input type="hidden" name="usersNo" value=${param.usersNo}> <input type="hidden" name="target" value=${param.target}>
								<button class="btn btn-default btn-send" type="submit">보내기</button>
							</form>
						</div>

					</div>

				</div>


			</div>


		</div>
	</div>

</body>

<script>
	/* aside */
	// html dom 이 다 로딩된 후 실행된다.
	$(document).ready(function() {
		// memu 클래스 바로 하위에 있는 a 태그를 클릭했을때
		$(".menu").click(function() {
			// 현재 클릭한 태그가 a 이기 때문에
			// a 옆의 태그중 ul 태그에 hide 클래스 태그를 넣던지 빼던지 한다.
			$(this).next("ul").toggleClass("hide");
		});
	});

	//리스트 중 하나 눌렀을 때
	/* ${".Mlist"}.on("click", function(){
	   
	   $.ajax({
	      url:"${pageContext.request.contextPath}/message/read?usersNo=${MessageVo.usersNo}",
	        type:"POST"
	    }).
	   
	}); */
	
	$(document).ready(funtion(){
		$('#scroll').scrollTop($('scroll')[0].scrollHeight);
	});
</script>
</html>