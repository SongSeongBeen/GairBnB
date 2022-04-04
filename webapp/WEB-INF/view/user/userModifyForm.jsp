<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>회원정보 수정 폼</title>

	<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/assets/css/userModify.css" rel="stylesheet" type="text/css" />
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
				<c:import url="/WEB-INF/view/includes/aside.jsp"></c:import>
				<div id="content">
					<div id="content-head" >
						<div id="location" class="clearfix">
							<ul>
								<li>마이페이지</li>
								<li>내 정보 수정</li>
								<li class="last">회원 정보 수정</li>
							</ul>
						</div>
						<h1>회원 정보 수정</h1>
					</div>

					<div id="content-main">

						<div class="col-xs-11">
							<div class="row">
								<div id="joinQuestion" class="row Q">
									<div class="photo">
										<h4>01. 사진 업로드</h4>
										<p>
											<span class="label label-info">참고</span> 프로필 사진 1장을 올려주세요.
										</p>
										<div class="contents">
											<div class="upload-box">
												<form method="post" enctype="multipart/form-data"> 
													<input type="file" name="images" accept=".png, .jpg, .jpeg">
												</form>
											</div>
										</div>
									</div>
								</div>

								<div id="joinQuestion" class="row Q">
									<h4>02. 이름</h4><br>
									<input id="nameArea" type="text" class="form-control" value="${userVo.name}" style="width: 200px"><br>
								</div>

								<div id="joinQuestion" class="row Q">
									<h4>03. 비밀번호</h4><br>
									<input id="pwArea" type="password" name="password" class="form-control" value="${userVo.password}" style="width: 200px"><br>
								</div>

								<div id="joinQuestion" class="row Q">
									<h4>04. 전화번호</h4><br>
									<input id="hpArea" type="phonenumber" name="" class="form-control" value="${userVo.hp}" style="width: 200px">
								</div>

								<div id="joinQuestion" class="row LQ">		
								</div>
								<button id="updatebtn" type="submit" class="btn btn-default btn-lg btn-block">내 정보 수정 완료</button>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</body>

	<script>
    //이미지 담아놓을 배열
    var inputFileList = new Array();
   
	 // 파일 업로드 했을때 이벤트
	 $('input[name=images]').on('change', function(e) {
	    var files = e.target.files;
	    var filesArr = Array.prototype.slice.call(files);
	
	     filesArr.forEach(function(f) { 
	 		inputFileList.push(f);    // 이미지 파일을 배열에 담는다.
	 	 });
	 });
	 
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

	//수정완료를 눌렀을때
	$("#updatebtn").on("click", function(){
		//userVo
		var userVo ={
			usersNo : ${requestScope.userVo.usersNo},
			name : $("#nameArea").val(),
			password : $("#pwArea").val(),
			hp : $("#hpArea").val()
		};
		//사진
		console.log("inputFileList: " + inputFileList);
		let formData = new FormData($('#uploadForm')[0]);  // 폼 객체

    	for (let i = 0; i < inputFileList.length; i++) {
    		formData.append("images", inputFileList[i]);  // 배열에서 이미지들을 꺼내 폼 객체에 담는다.
    	}
		
		console.log(userVo);
		$.ajax({
			//요청할때
			url : "${pageContext.request.contextPath}/user/modify",    
			type : "post",
			data : userVo,
			success : function(count) {
				$.ajax({
					url : "${pageContext.request.contextPath}/user/profileUpdate",    
					type : "post",
					data : formData,
					contentType : false,
					processData : false,
					success : function(count) {
						console.log("성공");
					},
					error : function(XHR, status, error) {
						console.error(status + " : " + error);
					}
				});
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	})
	</script>

</html>