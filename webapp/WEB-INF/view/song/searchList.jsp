<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
	   	<!-- font-->
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	    <!-- CSS -->
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css">
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/searchList.css" type="text/css">
	 	<script src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
	    <script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
	    <link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com">
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

	    <!--지도관련-->
	    <script src="${pageContext.request.contextPath}/assets/js/map.js"></script>
	    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
	     <!--지도관련-->
	   
	<!--<script src="https://kit.fontawesome.com/28ef845f49.js"></script> -->
	    
	    <title>검색리스트</title>
	</head>
	<body>
	<!-- header -->
	<c:import url="/WEB-INF/view/includes/header.jsp"></c:import>
    <div id="wrap" class="container-fluid">
        <!-- main -->
        <div id="search_List" class="container-fluid">
            <div id="search_button">
                 <!-- 버튼 오른쪽 -->
                <div class="search_button_left col-md-4">
                  	<!-- 1 -->
      				<div class="col-xs-2 padding_0">
	     				<form action="${pageContext.request.contextPath}/searchList" method="get">
	      					<input type="hidden" name="orderType" id="orderType" value="1" >
	      					<input type="hidden" name="searchKeyword" id="searchKeyword" value="${requestScope.searchListVo.searchKeyword}" >
	      					<input type="hidden" name="searchData" id="searchData" value="${requestScope.searchListVo.searchData}" >
		      				<button class="btn btn-default" type="submit">
			                	 청결 
			                </button>	
	                	</form>
      				</div>
      				<!--2 -->
                    <div class="col-xs-2 padding_0">
	                   	<form action="${pageContext.request.contextPath}/searchList" method="get">
	      					<input type="hidden" name="orderType" id="orderType" value="2" >
	      					<input type="hidden" name="searchKeyword" id="searchKeyword" value="${requestScope.searchListVo.searchKeyword}" >
	      					<input type="hidden" name="searchData" id="searchData" value="${requestScope.searchListVo.searchData}" >
		      				<button class="btn btn-default" type="submit">
			                	 산책 
			                </button>	
		        	 	</form>
                    </div>
                    <!--3 -->
                    <div class="col-xs-2 padding_0" >
                    	<form action="${pageContext.request.contextPath}/searchList" method="get">
	      					<input type="hidden" name="orderType" id="orderType" value="3" >
	      					<input type="hidden" name="searchKeyword" id="searchKeyword" value="${requestScope.searchListVo.searchKeyword}" >
	      					<input type="hidden" name="searchData" id="searchData" value="${requestScope.searchListVo.searchData}" >
		      				<button class="btn btn-default" type="submit">
			                	 식사 
			                </button>	
		        	 	</form>
                    </div>
                    <!-- 4 -->
                    <div class="col-xs-2 padding_0">
                    	<form action="${pageContext.request.contextPath}/searchList" method="get">
	      					<input type="hidden" name="orderType" id="orderType" value="4" >
	      					<input type="hidden" name="searchKeyword" id="searchKeyword" value="${requestScope.searchListVo.searchKeyword}" >
	      					<input type="hidden" name="searchData" id="searchData" value="${requestScope.searchListVo.searchData}" >
		      				<button class="btn btn-default" type="submit">
			                	 놀이 
			                </button>	
		        	 	</form>
                    </div>
                    <!-- 5 -->
                    <div class="col-xs-2 padding_0">
	                   	<form action="${pageContext.request.contextPath}/searchList" method="get">
	     					<input type="hidden" name="orderType" id="orderType" value="5" >
	     					<input type="hidden" name="searchKeyword" id="searchKeyword" value="${requestScope.searchListVo.searchKeyword}" >
	     					<input type="hidden" name="searchData" id="searchData" value="${requestScope.searchListVo.searchData}" >
	      					<button class="btn btn-default" type="submit">
		                	 		소통 
		                	</button>	
	                	 </form>
                    </div>
                </div>

                <div class="search_button_center col-md-4"></div>
                <!-- 버튼 왼쪽 -->    
                <div class="search_button_right col-md4">
       			<!-- 	  <div class="col-xs-2 padding_1">
	                    <button type="button" class="btn btn-default button_right1">
		               		<a href="#">어디서 </a>
		                </button>
                    </div>
                      <div class="col-xs-2 padding_1 position_1">
	                    <button type="button" class="btn btn-default button_right2">
		               		<a href="#">언제 </a>
		                </button>
                    </div>
                      <div class="col-xs-2 padding_1">
	                    <button type="button" class="btn btn-default button_right3">
		               		<a href="#">필터 </a>
		                </button>
                    </div> -->
                </div>
            </div>
            <div class="container-fluid search_container search_flex">
	            <div class="mix-wrapper clean food play walk communication search_web">
	            	<!-- 반복영역 -->
	                <div class="mix search_result" class="col-md-6">
	                <c:if test="${not empty searchList}">
		                <c:forEach items="${searchList}" var="searchListVo">
			                <div class="search_result_list"></div> <!-- 라인 -->
	
			                <div class="row">
			                	<!-- 클릭 영역 -->
			                	<div class="search_cursor_pointer" onclick="location.href='/project/host/info/${searchListVo.hostNo}';">
			                         <!-- 사진 -->
			                        <div class="col-md-6">
			                        <c:choose>
										<c:when test="${empty searchListVo.path}">
											<img class="result-img" src="${pageContext.request.contextPath}/assets/images/hostinfo_sample.jpg">
										</c:when>
										<c:otherwise>
											<img class="result-img" src="${pageContext.request.contextPath}/photo/${searchListVo.path}">
										</c:otherwise>
									</c:choose>
			                        </div>
			                         <!-- 내용 -->
			                        <div class="search_result_text col-md-5">
			                            <div class="esult_text row">
			                                <div class="puppy col-xs-6">
			  								    퍼피력 &nbsp;${searchListVo.puppyPoint} 
			                                </div>				                      
			                        	</div>
			                        	
			                            <div class="host_name result_text row">
			                            	${searchListVo.hostName}
			                            </div>
			                            <div class="address result_text row">
			                           		${searchListVo.adress1}
			                            </div>
		                           		<div class="result_text row"></div>
			                            <div class="result_text row">
				                            <div class="review col-xs-6">후기(${searchListVo.review}개)</div>
				                            <div class="price col-xs-6">₩${searchListVo.hostCost}/ 박 </div>
				                        </div>
			                        </div>
			                	</div>
			                	
			                	<!-- 하트 -->
			                	<c:if test="${not empty authUser}">
			                		<div class="heart col-md-1 bi-heart"></div>
			                	</c:if>	
			                	
			                	<!-- 각항목별 점수 -->
			                	<input class="clean" type="hidden" value="${searchListVo.clean}" data-order="1">
			                	<input class="food" type="hidden" value="${searchListVo.food}" data-order="2">
			                	<input class="play" type="hidden" value="${searchListVo.play}" data-order="3">
			                	<input class="walk" type="hidden" value="${searchListVo.walk}" data-order="4">
			                	<input class="communication" type="hidden" value="${searchListVo.communication}" data-order="5">
			                </div>	   
				                           
						</c:forEach>
					</c:if>
					<!-- 결과없음 -->
					<c:if test="${empty searchList}">
						<h3>검색결과가 없습니다.</h3>
					</c:if>
	            	</div>
	            
				<!-- 반복영역 -->
	            </div>
            <!-- 지도자리 -->
            <c:if test="${not empty searchList}">
  		    	<div id="map" class="scroll"></div>
  		    </c:if>
    		</div>
        </div>
   		 <!-- 페이징 
	     <div id="paging" class="col-md-1">
			<ul>
				<c:if test="${requestScope.pMap.prev == true}">
					<li><a href="${pageContext.request.contextPath}/board/bList2?crtPage=${requestScope.pMap.startPageBtnNo-1}">◀</a></li>
				</c:if>
				
				<c:forEach begin="${pMap.startPageBtnNo}" end="${pMap.endPageBtnNo}" step="1" var="page">
					<li><a href="${pageContext.request.contextPath}/board/bList2?crtPage=${page}">${page}</a></li>
				</c:forEach>
				
				<c:if test="${requestScope.pMap.next == true}">
					<li><a href="${pageContext.request.contextPath}/board/bList2?crtPage=${requestScope.pMap.endPageBtnNo+1}">▶</a></li>
				</c:if>
			</ul>
		</div>-->
  	</div>
  	
  	<c:import url="/WEB-INF/view/includes/footer.jsp"></c:import>
    <!--지도-->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b041f9ad62c37064e496f0bc81216407&&libraries=services,clusterer"></script>
		<script>
		 $('#cbtn').on("click", function(){
			 console.log("클릭");
			 $("#map div div div div img").remove();
			 var arr1 = [{x:32.450701, y:126.570667}, {x: 35.17403275838313, y: 129.05328714015042}];
			 console.log(arr1);
			 for(var r=0; r < arr1.length; r++){
			 var marker = new kakao.maps.Marker({
				    map: map,
				    position: new kakao.maps.LatLng(arr1[i].x, arr1[i].y)
				});
			 };
			 //var moveLatLng = new kakao.maps.LatLng(arr1[0].x, arr1[0].y);  
			 //map.panTo(moveLatLng);
		 });
		 $('#cbtn2').on("click", function(){
			 console.log("클릭");
			 $("#map div div div div img").remove();
			 var marker = new kakao.maps.Marker({
				    map: map,
				    position: new kakao.maps.LatLng(32.450701, 126.570667)
				});
			 var moveLatLng = new kakao.maps.LatLng(32.450580, 126.574942);   
			 map.panTo(moveLatLng);
		 });
		 
		 	var mapContainer = document.getElementById('map');
			var mapOption = {
				//시작시 지도 위치 
			    center: new daum.maps.LatLng(35.17403275838313, 129.05328714015042),
			    level: 8	
			};
			var map = new daum.maps.Map(mapContainer, mapOption); 
			
			// 지역을 위도경도값으로
			var geocoder = new daum.maps.services.Geocoder();
			
		 	var adress = [];   //주소	
			var hostNo =[];   //호스트넘버
			var hostname =[];
			
			<c:forEach items="${searchList}" var="svo">
				adress.push("${svo.adress1}");
				hostNo.push("${svo.hostNo}");
				hostname.push("${svo.hostName}");
			</c:forEach> 
			
			var imageSrc = '${pageContext.request.contextPath}/assets/images/searchListMarker.png', // 마커이미지의 주소입니다    
			
		    imageSize = new kakao.maps.Size(69, 73), // 마커이미지의 크기입니다
		    imageOption = {offset: new kakao.maps.Point(33, 71)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		    
			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
		        markerPosition = new kakao.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다
		    var namelist = name;
		    var listData = adress;
		   
					
			listData.forEach(function(addr, index) {
			    geocoder.addressSearch(addr, function(result, status) {
			        if (status === daum.maps.services.Status.OK) {
			            var coords = new daum.maps.LatLng(result[0].y, result[0].x);
	
			            	var marker = new daum.maps.Marker({
			                map: map,
			                position: coords,
			                image: markerImage, // 마커이미지 설정 
			                no : hostNo[index]  //호스트넘버
			            });
			            

			            
			        
			        	// 인포윈도우를 생성합니다
			            var infowindow = new daum.maps.InfoWindow({
			                content :'<span class="info-title">' + hostname[index] + '</span>',       //생성할때 주소는 넣어 줬음
			                disableAutoPan: true
			            });
			        	
			          
			         	

			         	// 마커에 클릭이벤트를 등록합니다
						kakao.maps.event.addListener(marker, 'click', (event) => {
							var no = hostNo[index]
							location.href = '${pageContext.request.contextPath}/host/info/' + no ;          //자기자신 타이틀 번호를 써야함
						});
			         	
			         	// 마커에 오버이벤트를 등록합니다
						kakao.maps.event.addListener(marker, 'mouseover', (event) => {
							// 마커 위에 인포윈도우를 표시합니다
								infowindow.open(map, marker);
								
						});
				       	// 마커에 아웃이벤트를 등록합니다
						kakao.maps.event.addListener(marker, 'mouseout', (event) => {
							// 마커 위에 인포윈도우를 삭제합니다
							infowindow.close();
						});
			        } 
			        map.setCenter(coords);
			    });
			}); 
			
			 <!--지도 타입변경 컨트롤을 생성한다 -->
			 var mapTypeControl = new kakao.maps.MapTypeControl();
			 
			 <!-- 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다 -->
			 map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);	
	
			 <!-- 지도에 확대 축소 컨트롤을 생성한다 -->
			 var zoomControl = new kakao.maps.ZoomControl();
	
			 <!-- 지도의 우측에 확대 축소 컨트롤을 추가한다 -->
			 map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
			
			 
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
		    
	   	    <!--스크롤-->
		    $(document).ready(function(){
		    	  var currentPosition = parseInt($('.scroll').css('top'));
		    	  $(window).scroll(function() {
		    	    var position = $(window).scrollTop(); 
		    	    $('.scroll').stop().animate({'top':position+currentPosition+'px'},100);
		    	  });
		    	});
		    
		    

		</script>
		
	</body>
	
	
</html>