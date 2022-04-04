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
	<link href="${pageContext.request.contextPath}/assets/css/poto-upload.css" rel="stylesheet" type="text/css"/>
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
                <div id="content-head">
					<h1>예약상세</h1>
				</div>

                <div id="content-main" class="clearfix">

                    <div id="btn-area1">
                    	<c:if test="${bvo.status == '펫시팅중' || bvo.status == '예약완료'}">
                    		<%-- <button name="imgupload" class="btn btn-info add-img4" data-photodate="${pListDate[0].photoDate}">이미지 업로드</button> --%>
                    		<button class="btn btn-default add-img3" onclick = "window.history.back()">목록으로 돌아가기</button>
                    	</c:if>
                    	<c:if test="${bvo.status != '펫시팅중' && bvo.status != '예약완료'}">
                    		<button class="btn btn-default add-img3" onclick = "window.history.back()">목록으로 돌아가기</button>
                    	</c:if>
                    </div>

                    <div id="gallery">
                        <!-- 사진 넣는 공간 -->
                        <div class="info">
                            <c:if test="${empty pList[0]}">
                            	<div id="galleryArea">
                            		<img id="fileless" src="https://img.icons8.com/pastel-glyph/2x/image-file.png" alt="파일 아이콘" >
									<p class="message">아직 업로드된 이미지가 없습니다.</p>
                            	</div>
                            </c:if>
                            <c:if test="${!empty pList[0]}">
                            <c:forEach items="${pList}" var="pListDate">
                         		
                            	<div class="wrapper">
                           		<c:if test="${pListDate[0].photoDate != null}">
	                                <div class="clearfix">
	                                    <div class="img-date"><h3>${pListDate[0].photoDate}</h3></div>
	                                </div>
	                                <div>
	                                	<c:if test="${pListDate[0].photoPath != null}">
		                                    <div class="item">
		                                        <div class="polaroid">
			                                		
		                                        		<img data-no="${pListDate[0].photoNo}" src="${pageContext.request.contextPath }/photo/${pListDate[0].saveName}" class="wrapper-img viewImg">
		                                        	
		                                            <div class="caption">${pListDate[0].category}</div>
		                                        </div>
		                                    </div> 
	                                    </c:if>
	                                	<c:if test="${pListDate[1].photoPath != null}">
		                                    <div class="item">
		                                        <div class="polaroid">
		                                        		<img data-no="${pListDate[1].photoNo}" src="${pageContext.request.contextPath }/photo/${pListDate[1].saveName}" class="wrapper-img viewImg">
		                                            <div class="caption">${pListDate[1].category}</div>
		                                        </div>
		                                    </div>
	                                    </c:if>
	                                	<c:if test="${pListDate[2].photoPath != null}">
		                                    <div class="item">
		                                        <div class="polaroid">
		                                        		<img data-no="${pListDate[2].photoNo}" src="${pageContext.request.contextPath }/photo/${pListDate[2].saveName}" class="wrapper-img viewImg">
		                                            <div class="caption">${pListDate[2].category}</div>
		                                        </div>
		                                    </div>
	                                    </c:if>
	                                    <c:if test="${pListDate[3].photoPath != null}">
		                                    <div class="item">
		                                        <div class="polaroid">
			                                		
		                                        		<img data-no="${pListDate[3].photoNo}" src="${pageContext.request.contextPath }/photo/${pListDate[3].saveName}" class="wrapper-img viewImg">
		                                        	
		                                            <div class="caption">${pListDate[3].category}</div>
		                                        </div>
		                                    </div>
	                                    </c:if>
	                                   
	                                </div>
	                            </c:if>
	                            </div>
	                            
                            </c:forEach>
                            </c:if>
                           
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
				<h4 class="modal-title">이미지 업로드하기</h4>
			</div>
			<div class="modal-body" class="container-fluid">
				<div class="row">
					<div class="col-xs-1">
					</div>
					<div class="col-xs-10">
						<form id="uploadForm" enctype="multipart/form-data" action="${pageContext.request.contextPath}/photoInsert?bookingNo=${bvo.bookingNo}" method="post">
							<div id="cate">
								<label>카테고리</label>
								<select id="modalCate" class="bo_w_select" name="category">
								  <option>식사</option>  
								  <option>산책</option>  
								  <option>청결</option>
								  <option>놀이</option>
								</select>
							</div>
							<div>
								<label class="pDate">등록일</label>
								<select class="bo_w_select" name="photoDate">
									<option>2022</option>
								</select>
								년
								<select id="photoDateM" class="bo_w_select" name="photoDate">
									<option>03</option>
									<option>04</option>
								</select>
								월
								<select id="photoDateD" class="bo_w_select" name="photoDate">
									<c:forEach begin="1" end="31" varStatus="status">
										<c:if test="${status.count >= 10}"><option>${status.count}</option></c:if>
										<c:if test="${status.count < 10}"><option>0${status.count}</option></c:if>
									</c:forEach>
								</select>
								일
							</div>
								<%-- <label class="pDate days">일차</label>
								<select id="days" class="bo_w_select" name="day">
									<c:forEach begin="1" end="62" varStatus="status">
										<option>${status.count}</option>
									</c:forEach>
								</select>
								일차 --%>
							<div>
							</div>
							<div>
								<label>글제목</label>
								<input id="modalTitle" type="text" name="photoTitle">
							</div>
							<hr>
							<div class="contents">
								<div class="upload-box">
									<div id="drop-file" class="drag-file">
										<img src="https://img.icons8.com/pastel-glyph/2x/image-file.png" alt="파일 아이콘" class="image" >
										<p class="message">파일 선택 버튼을 눌러 이미지를 추가해주세요</p>
										<input id="uploadDate" type="hidden" name="uploadDate" value="">
										<img id="View" src="" alt="" class="preview">
										<label class="file-label" for="myFile">파일 선택</label>
										<input class="file" name="file" type="file" id="myFile">
									</div>
									<label for="submitBtn" id="modalSubmit" class="file-label">확인</label>
									<input type="submit" id="submitBtn" style="display: none">
						      	</div>
							</div>
					    </form>
					</div>
			    </div>
			</div>
		</div><!--/.modal-content-->
	</div><!--/.modal-dialog--> 
 </div><!--/.modal-->
	  
	<!-- 이미지보기 팝업(모달)창 -->
	<form action="">
		<div class="modal fade" id="viewModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">이미지보기</h4>
					</div>
					<div class="modal-body">
						<div class="formgroup">
							<img id="viewModelImg" src="">
							<!-- ajax로 처리 : 이미지출력 위치-->
						</div>
						<div class="formgroup">
							<p id="viewModelContent"></p>
						</div>
						<input type="hidden" id="listNo" val="">
					</div>
				</div> <!-- /.modal-content -->
			</div> <!-- /.modal-dialog -->
		</div> <!-- /.modal -->
	</form>

	<!--class="modal fade"-->
	<div class="modal fade" id="galleryModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title">갤러리</h4>
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
	//메세지 버튼클릭
	$("#h-messeage").on("click", function(){
		var $this = $(this);
		var hostNo = $this.data("hostno");
		var usersNo = $this.data("usersno");
		console.log(hostNo+', '+usersNo);
		
		location.href = "${pageContext.request.contextPath}/message/getm?usersNo="+hostNo+"&target="+usersNo;
	});
	
	//이미지업로드 버튼을 눌렀을때
	$("[name='imgupload']").on("click", function(){
		//데이터수집
		var $this = $(this);
		
		//초기화
		$("#modalCate").val("");
		$("#modalTitle").val("");
		$("#myFile").val();
		$("#photoDateM").val("");
		$("#photoDateD").val("");
		
		$('#imgupdateModal').modal('show');
		
	});	
	
	//이미지 눌렀을때(이미지보기)
	$(".viewImg").on("click", function() {
		var $this = $(this);
		var no = $this.data("no");
		getImg(no);
	});
	
	//이미지 불러오기(이미지보기)
	function getImg(no) {

		//var authUserNo = $("#btnImgUpload").data("uno");

		$.ajax({
			
			url : "${pageContext.request.contextPath}/viewImg",
			type : "post",
			//contentType : "application/json",
			data : { no : no },
			dataType : "json",
			success : function(pvo) {
				$("#viewModal").modal('show');
				$("#viewModelImg").attr("src", '${pageContext.request.contextPath}/photo/' + pvo.saveName);
				$("#viewModelContent").html(pvo.photoTitle);
				$("#listNo").val(pvo.photoNo);
			},
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
	}
	
	//미리보기
	$(function() {
	    $("#myFile").on('change', function(){
	    readURL(this);
	    });
	});
	
	function readURL(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	        $('#View').attr('src', e.target.result);
	        $('#View').attr('style', 'display: block');
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
	var cnt=0;
	//이미지업로드 버튼을 눌렀을때
	$("#imgFile").on("click", function(){
		cnt++;
		var $this = $(this);
		var usersNo = $this.data("usersno");
		
		if(cnt==1) {
			viewGallery(usersNo);
		}else {
			$("#galleryModal").modal('show');
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
				
				$("#galleryModal").modal('show');
				for(var i=0; i<gList.length; i++){
					var str = '';
					str += '	<div class="item">';
					str += '		<div class="polaroid">';
					str += '			<img data-usersno='+usersNo+' data-photono='+gList[i].photoNo+' src="${pageContext.request.contextPath}/photo/'+gList[i].saveName+'" class="wrapper-img viewImg"> ';
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
	
  </script>
</html>