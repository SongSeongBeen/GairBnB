<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!--CSS-->
    <link href="${pageContext.request.contextPath}/assets/yu/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/yu_main.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/header.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/booking-m.css" rel="stylesheet" type="text/css"/>
	
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

    <!--자바스크립트-->
    <script type="text/javascript" src="/project/assets/js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="/project/assets/bootstrap/js/bootstrap.js"></script>
</head>

<body>

	<!-- header -->
	<div class="header">
		<!--logo-->
		<div>
		    <a href="${pageContext.request.contextPath}/m/main">
	        	<img class="logo-img" src="${pageContext.request.contextPath}/assets/images/header_logo.jpg">
		    </a>
		</div>
	</div>   

    <div id="wrap">
        
        <div id="container" class="clearfix">
        
            <div id="content" class="clearfix">

				<c:if test="${empty authUser.usersNo}">
					<button id="login-m" class="btn btn-primary
					">로그인</button>
				</c:if>
				<c:if test="${!empty authUser.usersNo}">
					<button id="logout-m" class="btn btn-primary">로그아웃</button>
				</c:if>
            </div>
            
        </div>
    </div>
    
    <div class="modal fade joinForm" id="loginForm">
		 <div class="modal-dialog">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	          <h4 id="login-title" class="modal-title">로그인 또는 회원가입</h4>
	        </div>
	        <div class="modal-body" class="container-fluid">
	            <div class="row paddingLogin wellcome">
	                <div>
	                    <h1 id="wellcome">GairBnB에 오신것을 환영합니다.</h1>
	                </div>
	            </div>
				<form action="${pageContext.request.contextPath}/m/login" method="post">
		            <div id="u-idPass" class="row">
		                <div>
		                	<input id="u-id" name="id" type="text" placeholder="아이디" value="testGuest">
		                </div>
		                <div>
		                	<input id="u-pass" name="password" type="password" placeholder="비밀번호" value="1234">
		                </div>
		            </div>
		            <div class="row paddingLogin">
		                <div>
		                    <input id="submit-m" class="btn btn-default" type="submit" value="계속">
		                </div>
		            </div>
				</form>
			</div>
	      </div><!-- /.modal-content  -->
	    </div><!-- /.modal-dialog  -->
	 </div>
    

</body>

<script>

$("#logout-m").on("click", function(){
	
	location.href = "${pageContext.request.contextPath}/logout";
});

/* 로그인버튼누름 */
$("#login-m").on("click", function(){
	//초기화
	//$("#u-id").val("");
	//$("#u-pass").val("");
	
	$('#loginForm').modal('show');
});
	
</script>
</html>