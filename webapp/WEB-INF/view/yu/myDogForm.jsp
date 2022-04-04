<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!--CSS-->
	<link href="/project/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
	<link href="/project/assets/css/yu_main.css" rel="stylesheet" type="text/css">
	<link href="/project/assets/css/booking.css" rel="stylesheet" type="text/css"/>
	<link href="/project/assets/css/poto-upload.css" rel="stylesheet" type="text/css"/>
	<link href="/project/assets/css/myDog.css" rel="stylesheet" type="text/css">

	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>

<script type="text/javascript" src="/project/assets/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="/project/assets/bootstrap/js/bootstrap.js"></script>

<body>

	<!-- header -->
    <c:import url="/WEB-INF/view/includes/header.jsp"></c:import>

    <div id="header_line" class="container-fluid"></div>
	
	<div id="wrap">
		
		<div id="container" class="clearfix">
		
			<!-- aside -->
            <c:import url="/WEB-INF/view/includes/aside.jsp"></c:import>
			
			<div id="content" >
				<div id="content-head">
					<div id="location">
						<ul>
							<li>마이페이지</li>
							<li class="last">내 강아지</li>
						</ul>
					</div>
					<h1>내 강아지</h1>
				</div>
				
				<div id="content-main">
					<p class="text-center f-m">펫시팅을 신청할 강아지의 정보를 입력해주세요</p> 
					<p class="text-center f-m">예약 시 아래와 같은 카드 형식으로 펫시터에게 내 강아지의 정보를 제공할 수 있습니다.</p>
						
							<div id="dogCard">
								<div class="row"></div>
								<div id="cardHeader">
									<p id="headerText" class="text-center">강아지 등록증</p>
								</div>
								<hr>
								
								<div id="cardBody" class="clearfix">
									<input type="hidden" name="usersNo" value="${param.usersNo}">
										<div id="imgFile" data-usersno="${param.usersNo}">
											<c:if test="${empty mvo.photo}">
												<img id="myDogImg" src="${pageContext.request.contextPath}/assets/images/myDogImg2.png">
											</c:if>
											<c:if test="${!empty mvo.photo}">
												<img id="myDogImg" src="${pageContext.request.contextPath}/photo/${mvo.photo}">
											</c:if>
											<label class="file-label">사진업로드</label>
										</div>
										<form id="myDogForm" action="${pageContext.request.contextPath}/mydogUpdate" method="get">
											<div id="myDogInfo">
												<label for="name">이름:</label>
												<input id="name" name="name" type="text" value="${mvo.name}">
												<div>
													<label for="photoDate">생년월일:</label>
													<select class="bo_w_select" name="birth">
														<c:forEach begin="2000" end="2022" varStatus="status">
															<option>${status.count + 1999}</option>
														</c:forEach>
													</select>
													년
													<select class="bo_w_select" name="birth">
														<c:forEach begin="1" end="12" varStatus="status">
															<c:if test="${status.count >= 10}"><option>${status.count}</option></c:if>
															<c:if test="${status.count < 10}"><option>0${status.count}</option></c:if>
														</c:forEach>
													</select>
													월
													<select class="bo_w_select" name="birth">
														<c:forEach begin="1" end="31" varStatus="status">
															<c:if test="${status.count >= 10}"><option>${status.count}</option></c:if>
															<c:if test="${status.count < 10}"><option>0${status.count}</option></c:if>
														</c:forEach>
													</select>
													일
												</div>
												<div>
													<label for="gender">성별:</label>
													<select id="gender" name="gender">
														<option>남</option>
														<option>여</option>
													</select>
												</div>
												<div>
													<label for="breed">품종:</label>
													<input id="breed" name="breed" type="text" value="${mvo.breed}">
												</div>
												<div>
													<label for="weight">몸무게:</label>
													<input id="weight" name="weight" type="text" value="${mvo.weight}">
													kg
													<label id="neuterLabel" for="neuter">중성화:</label>
													<select id="neuter" name="neuter">
														<option value="1">O</option>
														<option value="0">X</option>
													</select>
												</div>
											</div>
										</form>
										<div>
											<input id="myDogSubmit" class="btn btn-default" type="submit" value="수정">
										</div>
									
								</div>
							</div>
							
						</div>
					
				</div>
			</div>
		</div>
	</div>
	
	<!--class="modal fade"-->
	<div class="modal fade" id="imgupdateModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">강아지사진 업로드하기</h4>
				</div>
				<div class="modal-body">
					<div id="listArea"></div>
					<hr>
					<div class="contents">
					</div>
				</div>
			</div><!--/.modal-content-->
		</div><!--/.modal-dialog--> 
	 </div><!--/.modal-->
	
</body>

<script>
	var cnt=0;
	//이미지업로드 버튼을 눌렀을때
	$("#imgFile").on("click", function(){
		cnt++;
		var $this = $(this);
		var usersNo = $this.data("usersno");
		
		if(cnt==1) {
			viewGallery(usersNo);
		}else {
			$("#imgupdateModal").modal('show');
		}
		
	});	
	
	function viewGallery(usersNo) {
		
		$.ajax({
			url : "${pageContext.request.contextPath}/gallerySelect",
			type : "post",
			//contentType : "application/json",
			data : { usersNo : usersNo },
			dataType : "json",
			success : function(gList) {
				
				$("#imgupdateModal").modal('show');
				for(var i=0; i<gList.length; i++){
					var str = '';
					str += '	<div class="item">';
					str += '		<div class="polaroid">';
					str += '			<img data-usersno='+usersNo+' data-photono='+gList[i].photoNo+' src="${pageContext.request.contextPath}/photo/'+gList[i].saveName+'" class="wrapper-img viewImg gImg"> ';
					str += '			<div class="caption"></div>';
					str += '		</div>';
					str += '	</div>';
					$("#listArea").append(str);
				}
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	}
	
	/* 이미지 선택 */
	$(document).on("click", ".gImg",function(){
		var $this = $(this);
		var usersNo = $this.data("usersno");
		var photoNo = $this.data("photono");
		console.log(usersNo);
		console.log(photoNo);
		
		location.href = "${pageContext.request.contextPath}/mydogPhotoUpdate?usersNo="+usersNo+"&photoNo="+photoNo;
		
	});

</script>
</html>