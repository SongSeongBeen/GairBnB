<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>찜목록</title>

    <link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/heart.css" rel="stylesheet" type="text/css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    
    
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>   
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
    
</head>


<body>
	<c:import url="/WEB-INF/view/includes/header.jsp"></c:import>

    <div id="wrap">
        <div id="container" class="clearfix">      
            <!-- aside -->
            <c:import url="/WEB-INF/view/includes/aside.jsp"></c:import>
        
            <div id="content">
            	<div id="content-head" >
					<div id="location" class="clearfix">
						<ul>
							<li>마이페이지</li>
							<li class="last">찜 목록</li>
						</ul>
					</div>
					<h1>찜 목록</h1>
				</div><!-- //content-head -->
                <div id="content-main" style="margin-left:50px;">
                	<div class="search_result">
                        <c:forEach items="${requestScope.heartList}" var="vo" >
							<div class="col-xs-6 heartbox" id="h-${vo.heartNo}" data-hostno="${vo.hostNo}" >
								<div class="col-xs-5" style="padding:0px 0px 0px 45px">
									<c:choose>
										<c:when test="${empty vo.path}">
											<img class="result-img" src="${pageContext.request.contextPath}/assets/images/hostinfo_sample.jpg">
										</c:when>
										<c:otherwise>
											<img class="result-img" src="${pageContext.request.contextPath}/photo/${vo.path}">   	
										</c:otherwise>
									</c:choose>
								</div>

								<div class="col-xs-6">
									<div class="result_text row">
										<div class="puppy col-xs-6">퍼피력<strong>${vo.puppypoint}</strong></div>
										<button id="btn-${vo.heartNo}" class="heart col-xs-6 bi-heart" data-no="${vo.heartNo}"><h2>♥</h2></button>
									</div>
									
									<div class="host_name row"><strong>${vo.name}</strong></div>
									<div class="address row">${vo.adress1}</div>

									<div class="row">
										<div class="review col-xs-4">(후기<strong> ${vo.reviewcount}</strong>개)</div>
										<div class="price col-xs-8"><h4>₩<strong>${vo.hostcost}</strong><small>(1박 x 1마리)</small></h4></div>
									</div>
								</div>
							</div>
                        </c:forEach>
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
     
	
    var i = 0;
    $('.bi-heart').on('click',function(){
        if(i==0){
            $(this).removeClass('bi-heart');
            $(this).addClass('bi-heart-fill');
            i++;
        }else if(i==1){
            $(this).removeClass('bi-heart-fill');
            $(this).addClass('bi-heart');
            i--;
        }
        
    });
	
     //하트 클릭 시 삭제
	$(".heart").on("click", function(event){
		
		event.stopPropagation();
		var $this = $(this);
		var heartNo = $this.data('no');
		console.log(heartNo)
		$.ajax({
			//요청할때
			url : "${pageContext.request.contextPath}/user/heartDelete",    
			type : "post",
			data : {heartNo: heartNo},
			success : function(count) {
				console.log("성공");
				$("#h-"+heartNo).remove();
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			} 
		});	
	});
     
     
     
    //하트 박스 클릭시 상세페이지로 이동 
    $(".heartbox").on("click", function(){
    	
    	var hostNo =$(this).data("hostno");
    	console.log(hostNo);
    	
    	window.location.href = "${pageContext.request.contextPath}/host/info/"+hostNo;
    	
    });
    
    
</script>        
 </html>