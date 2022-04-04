<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/login.css">

<header>
	<div class="header container-fluid">
		<!--logo-->
		<div class="logo col-md-4">
		    <a href="${pageContext.request.contextPath}/main">
	        	<img class="logo-img" src="${pageContext.request.contextPath}/assets/images/header_logo.jpg">
		    </a>
		</div>
		<!--search-->
		<div class="searchbox col-md-4">
		    <!-- Topbar Search -->
             <form action="${pageContext.request.contextPath}/searchList" method="get" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                 <div class="input-group input-group-joined border-0">
                     <div class="searchboxin_1 input-group input-group-joined"> 
                         <input type="text" name="searchKeyword" id="searchKeyword" value="" class="search_text1 small form-control ps-0 pointer" placeholder="어디를 찾으세요?" aria-label="Search" aria-describedby="basic-addon2" autocomplete="off">
                     </div> 
                     <div class="searchboxin_2 input-group input-group-joined">
                         <input type="text" name="searchData" value="" class="search_text2 form-control small ps-0 pointer" id="litepickerRangePlugin" value="" placeholder="체크인 / 체크아웃" autocomplete="off"/>
                     </div> 
                     <button class="search_text3 btn btn-primary" type="submit">
                     	   <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                     </button>
                 </div>
             </form>
		</div>
            <!--menu  로그인 로그아웃 영역 나누기-->
            <!--menu  로그인-->
           <div class="menu col-md-2">
                <c:if test="${authUser.usersNo == null}">
               		<div class="menu_btn2">
	                	<a href="${pageContext.request.contextPath}/shop/list">
	                    	<button type="button" class="btn btn-default">
	                        	<span class="glyphicon glyphicon-shopping-cart"></span>Shop
	                    	</button>
	                    </a>
	                </div>
	                <div class="btn-group pull-right menu_btn3">
	                    <button type="button" class="menu_text3 btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
	                    <span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span>
	                    </button>
	                   	<ul class="dropdown-menu" role="menu">
	                        <li id="login"><a href="#">로그인</a></li>
	                        <li id="join"><a href="#">회원가입</a></li>
	                      	<!--<li class="divider"></li> 줄넣는 방법-->
	                   	</ul>
                   	</div>
                </c:if>
                    <c:if test="${authUser.usersNo != null}">
                    		<c:if test="${authUser.usersType == 2}">
                   				<div class="menu_btn1">
                   					<a href="${pageContext.request.contextPath}/host/info/${authUser.hostNo}" style="color:#000">
					                    <button type="button" class="btn btn-default">
					                    	내 펫시팅 정보
					                    </button>
				                    </a>
				                </div>
                    		</c:if>
	                    	<c:if test="${authUser.usersType == 1}">
				                <div class="menu_btn1">
				                	<a href="${pageContext.request.contextPath}/host/hostjoin" style="color:#000">
					                    <button type="button" class="btn btn-default">
					                    	펫시터되기
					                    </button>
				                    </a>
				                </div>
			                </c:if>
		                <div class="menu_btn2">
		                	<a href="${pageContext.request.contextPath}/shop/list">
		                    	<button type="button" class="btn btn-default">
		                        	<span class="glyphicon glyphicon-shopping-cart"></span>Shop
		                    	</button>
		                    </a>
		                </div>
		                <div class="menu_btn2">
		                	<a href="${pageContext.request.contextPath}/message?usersNo=${authUser.usersNo}">
		                    	<button type="button" class="btn btn-default">
		                        	Messages <span class="badge"><!--메세지 갯수 입력-->0</span>
		                    	</button>
		                    </a>
		                </div>

                    	<div class="btn-group pull-right menu_btn3">
		                    <button type="button" class="menu_text3 btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
		                    <span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span>
		                    </button>
		                   	<ul class="dropdown-menu" role="menu">		                   
		                        <c:if test="${authUser.usersType == 1}">
		                        	<li><a href="${pageContext.request.contextPath}/bookingEndGuest?usersNo=${authUser.usersNo}">예약현황</a></li>
		                        	<li><a href="${pageContext.request.contextPath}/message?usersNo=${authUser.usersNo}">메세지</a></li>
		                        	<li><a href="${pageContext.request.contextPath}/user/heartForm">찜 목록</a></li>
		                        	<li><a href="${pageContext.request.contextPath}/user/userModifyForm?usersNo=${authUser.usersNo}">내 정보 수정</a></li>
		                        	<li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
		                        </c:if>
		                        <c:if test="${authUser.usersType == 2}">
		                        	<li><a href="${pageContext.request.contextPath}/bookingEndHost?hostNo=${authUser.hostNo}">예약관리</a></li>
		                        	<li><a href="${pageContext.request.contextPath}/message?usersNo=${authUser.usersNo}">메세지</a></li>
		                        	<li><a href="${pageContext.request.contextPath}/user/userModifyForm?usersNo=${authUser.usersNo}">내 정보 수정</a></li>
		                        	<li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
		                        </c:if>
		                        <c:if test="${authUser.usersType == 3}">
		                        	<li><a href="${pageContext.request.contextPath}/shop/writeForm">상품등록</a></li>
		                        	<li><a href="${pageContext.request.contextPath}/shop/admin">상품관리</a></li>
		                        	<li><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
		                        </c:if>
		                   	</ul>
                    	</div>
                    </c:if>
               
           	</div>

           	 <!--menu  로그아웃
           	  
           	<div class="menu col-md-2">
                <div class="menu_btn1">
                    <button type="button" class="btn btn-default">펫시터되기</button>
                </div>
                <div class="menu_btn2">
                    <button type="button" class="btn btn-default">
                        <a href="#">Messages <span class="badge"><!--메세지 갯수 입력   3</span></a>
                    </button>
                </div>
                <div class="btn-group menu_btn3">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <span class="glyphicon glyphicon-menu-hamburger" aria-hidden="true"></span>
                    </button>
                    드롭다운 메뉴
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                      <!--  <li class="divider"></li> 줄넣는 방법
                        <li><a href="#">Separated link</a></li>
                    </ul>
                </div>
           	</div>
           	-->
           	
           	
        </div>
    </header>

<body>
	<form action="${pageContext.request.contextPath}/join" method="post">
	  <div class="modal fade joinForm" id="joinForm">
	    <div class="modal-dialog">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	          <h4 class="modal-title">회원 가입 완료하기</h4>
	        </div>
	        <div class="modal-body" class="container-fluid">
	            <div id="u-idPass" class="row">
	                <div>
	                    <input id="join-u-id" name="id" type="text" placeholder="아이디" autocomplete="off">
	                </div>
	                <button id="overlap">중복확인</button>
	                <p></p>
	            </div>
	            
	            <div class="row">
	                    <input id="join-u-pass" name="password" type="password" placeholder="비밀번호" autocomplete="off">
	                    <input id="join-u-name" name="name" type="text" placeholder="이름" autocomplete="off">
	                    <p>정부 발급 신분증에 표시된 이름과 일치하는지 확인하세요.</p>
	            </div>
	
	            <div class="row">
	                <input id="join-u-hp" name="hp" type="text" placeholder="휴대폰번호" autocomplete="off">
	                <p>11자리의 숫자를 일렬로 입력해주세요.</p>
	            </div>
	
	            <div class="row">
	                <div class="col-xs-1">
	                </div>
	                <div class="col-xs-10">
	                    <input id="join-submit" type="submit" value="가입">
	                </div>
	            </div>
	            
	        </div>
	      </div><!-- /.modal-content -->
	    </div><!-- /.modal-dialog  -->
	  </div><!-- /.modal -->
	 </form>
	 
	 
	 <div class="modal fade joinForm" id="loginForm">
		 <div class="modal-dialog">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	          <h4 class="modal-title">로그인 또는 회원가입</h4>
	        </div>
	        <div class="modal-body" class="container-fluid">
	            <div class="row paddingLogin wellcome">
	                <div>
	                    <h1 id="wellcome">GairBnB에 오신것을 환영합니다.</h1>
	                </div>
	            </div>
				<form action="${pageContext.request.contextPath}/login" method="post">
		            <div id="u-idPass" class="row">
		                <div>
		                	<input id="u-id" name="id" type="text" placeholder="아이디" autocomplete="off">
		                </div>
		                <div>
		                	<input id="u-pass" name="password" type="password" placeholder="비밀번호" autocomplete="off">
		                </div>
		            </div>
		            <div class="row paddingLogin">
		                <div>
		                    <input id="submit" type="submit" value="계속">
		                </div>
		            </div>
				</form>
	            <div id="or-border" class="row paddingLogin">
	                <div class="col-xs-5">
	                    <hr>
	                </div>
	                <div id="or" class="col-xs-2">
	                    또는
	                </div>
	                <div class="col-xs-5">
	                    <hr>
	                </div>
	            </div>
<!-- 	
	            <div class="row paddingLogin">
	                <div class="connect">
	                    <img src="/project/assets/images/login_facebook.png">
	                    <h2 id="facebook">페이스북으로 로그인하기</h2> 
	                </div>
	            </div>
	
	            <div class="row paddingLogin">
	                <div class="connect">
	                    <img src="/project/assets/images/login_google.png">
	                    <h2 id="google">구글로 로그인하기</h2> 
	                </div>
	            </div>
	
	            <div class="row paddingLogin">
	                <div class="connect">
	                    <img id="naver-img" src="/project/assets/images/login_naver.png">
	                    <h2 id="naver">네이버로 로그인하기</h2> 
	                </div>
	            </div> -->
	
	            <div class="row paddingLogin">
	                <div id="joinH" class="connect">
	                    <img id="join-img" src="/project/assets/images/login_message.png">
	                    <h2 id="join-text">개어비앤비 회원가입하기</h2> 
	                </div>
	            </div>
	            
	            
	        </div>
	      </div><!-- /.modal-content  -->
	    </div><!-- /.modal-dialog  -->
	 </div>
</body>

    <!-- 달력-->
    <script src="https://cdn.jsdelivr.net/npm/litepicker/dist/bundle.js" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/assets/js/litepicker.js"></script>
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
    
    <script>
    	$("#join-text").on("click", function(){
    		$('#loginForm').modal('hide');
    		$('#joinForm').modal('show');
    	});
    
    	/* 회원가입버튼누름 */
    	$("#join").on("click", function(){
    		//초기화
    		$("#id").val("");
    		$("#join-u-pass").val("");
    		$("#u-name").val("");
    		$("#birth").val("");
    		
    		$('#joinForm').modal('show');
    	});
    	
    	/* 로그인버튼누름 */
    	$("#login").on("click", function(){
    		//초기화
    		$("#u-id").val("");
    		$("#u-pass").val("");
    		
    		$('#loginForm').modal('show');
    	});
    </script>




