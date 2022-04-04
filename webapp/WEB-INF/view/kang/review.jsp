<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />

<!--CSS-->
<link href="/project/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="/project/assets/css/review.css?after" rel="stylesheet" type="text/css">
<!-- 자바스크립트 -->
<script type="text/javascript" src="/project/assets/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="/project/assets/bootstrap/js/bootstrap.js"></script>


<title>리뷰 하기</title>

</head>

<body>

	<div>
		<!--class="modal fade"-->
		<div class="modal-dialog">
			<div class="modal-content">
				
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				
				<form id="reviewForm" method="get" action="${pageContext.request.contextPath}/reviewF">
					<div class="modal-body">
		
						<div id="header">
							<h4 class="modal-title">리뷰하기</h4>
							<p class="small">개장수 님의 펫시팅에 대한 평과와 후기를 남겨주세요.</p>
						</div>
						<h4 class="q">펫시팅이 어땠나요?</h4>
						<p class="ex">펫시터가 펫시팅 중에 올려준 사진 혹은 요청사항에 대한 기준으로 평가를 부탁드립니다</p>
		
						<div class="clearfix">
							<div class="left">식사</div>
							<div class="right">산책</div>
						</div>
						<div class="star row">
							<div class="rate col-md-6">
		
								<div class="rating">
									<input type="radio" name="food" class="rating__control screen-reader" id="food1" value=2.0> 
									<input type="radio" name="food" class="rating__control screen-reader" id="food2" value=4.0> 
									<input type="radio" name="food" class="rating__control screen-reader" id="food3" value=6.0> 
									<input type="radio" name="food" class="rating__control screen-reader" id="food4" value=8.0> 
									<input type="radio" name="food" class="rating__control screen-reader" id="food5" value=10.0 checked> 
									
									<label for="food1" class="rating__item"> 
										<svg class="rating__star">
			                				<use xlink:href="#star"></use>
			                			</svg> 
			                  			<span class="screen-reader">1</span>
									</label> 
									<label for="food2" class="rating__item"> 
										<svg class="rating__star">
		                    				<use xlink:href="#star"></use>
			                  			</svg> 
			                  			<span class="screen-reader">2</span>
									</label> 
									<label for="food3" class="rating__item"> 
										<svg class="rating__star">
			                    			<use xlink:href="#star"></use>
			                  			</svg> 
		                  				<span class="screen-reader">3</span>
									</label> 
									<label for="food4" class="rating__item"> 
										<svg class="rating__star">
			                    				<use xlink:href="#star"></use>
			                  			</svg> 
			                  			<span class="screen-reader">4</span>
									</label> 
									<label for="food5" class="rating__item"> 
										<svg class="rating__star">
		                    				<use xlink:href="#star"></use>
			              				</svg> 
			              				<span class="screen-reader">5</span>
									</label>
								</div>
							</div>
			
			
							<div class="rate col-md-6">
			
								<div class="rating">
									<input type="radio" name="walk" class="rating__control screen-reader" id="walk1" value=2.0> 
									<input type="radio" name="walk" class="rating__control screen-reader" id="walk2" value=4.0> 
									<input type="radio" name="walk" class="rating__control screen-reader" id="walk3" value=6.0> 
									<input type="radio" name="walk" class="rating__control screen-reader" id="walk4" value=8.0> 
									<input type="radio" name="walk" class="rating__control screen-reader" id="walk5" value=10.0 checked> 
									
									<label for="walk1" class="rating__item"> 
										<svg class="rating__star">
		                    				<use xlink:href="#star"></use>
		                    			</svg> 
			                    		<span class="screen-reader">1</span>
									</label> 
									<label for="walk2" class="rating__item"> 
										<svg class="rating__star">
			                    			<use xlink:href="#star"></use>
			                  			</svg> 
			                  			<span class="screen-reader">2</span>
									</label> 
									<label for="walk3" class="rating__item"> 
										<svg class="rating__star">
			                    			<use xlink:href="#star"></use>
			                      		</svg> 
			                      		<span class="screen-reader">3</span>
									</label> 
									<label for="walk4" class="rating__item"> 
										<svg class="rating__star">
			                				<use xlink:href="#star"></use>
			                			</svg> 
			                  			<span class="screen-reader">4</span>
									</label> 
									<label for="walk5" class="rating__item"> 
										<svg class="rating__star">
			                    			<use xlink:href="#star"></use>
			                  			</svg> 
			                    		<span class="screen-reader">5</span>
									</label>
	
								</div>
							</div>
						</div>
			
			
						<div class="clearfix">
							<div class="left">청결</div>
							<div class="right ">놀이</div>
						</div>
						<div class="star row">
							<div class="rate col-md-6">
	
								<div class="rating">
									<input type="radio" name="clean" class="rating__control screen-reader" id="clean1" value=2.0> 
									<input type="radio" name="clean" class="rating__control screen-reader" id="clean2" value=4.0> 
									<input type="radio" name="clean" class="rating__control screen-reader" id="clean3" value=6.0> 
									<input type="radio" name="clean" class="rating__control screen-reader" id="clean4" value=8.0> 
									<input type="radio" name="clean" class="rating__control screen-reader" id="clean5" value=10.0 checked> 
									
									<label for="clean1" class="rating__item"> 
										<svg class="rating__star">
			                    			<use xlink:href="#star"></use>
			                  			</svg> 
			                    		<span class="screen-reader">1</span>
									</label> 
									<label for="clean2" class="rating__item"> 
										<svg class="rating__star">
			                				<use xlink:href="#star"></use>
			              				</svg> 
			              				<span class="screen-reader">2</span>
									</label> 
									<label for="clean3" class="rating__item"> 
										<svg class="rating__star">
			                        		<use xlink:href="#star"></use>
			                      		</svg> 
		                      			<span class="screen-reader">3</span>
									</label> 
									<label for="clean4" class="rating__item"> 
										<svg class="rating__star">
			                				<use xlink:href="#star"></use>
			              				</svg> 
			                			<span class="screen-reader">4</span>
									</label> 
									<label for="clean5" class="rating__item"> 
										<svg class="rating__star">
		                        			<use xlink:href="#star"></use>
			                 	 		</svg> 
			                 	 		<span class="screen-reader">5</span>
									</label>
								</div>
							</div>
		
							<div class="rate col-md-6">
			
								<div class="rating">
									<input type="radio" name="play" class="rating__control screen-reader" id="play1" value=2.0> 
									<input type="radio" name="play" class="rating__control screen-reader" id="play2" value=4.0> 
									<input type="radio" name="play" class="rating__control screen-reader" id="play3" value=6.0> 
									<input type="radio" name="play" class="rating__control screen-reader" id="play4" value=8.0> 
									<input type="radio" name="play" class="rating__control screen-reader" id="play5" value=10.0 checked> 
									
									<label for="play1" class="rating__item"> 
										<svg class="rating__star">
			                    			<use xlink:href="#star"></use>
			                  			</svg> 
			                    		<span class="screen-reader">1</span>
									</label> 
									<label for="play2" class="rating__item"> 
										<svg class="rating__star">
			                				<use xlink:href="#star"></use>
			                			</svg> 
			                  			<span class="screen-reader">2</span>
									</label> 
									<label for="play3" class="rating__item"> 
										<svg class="rating__star">
			                				<use xlink:href="#star"></use>
										</svg> 
			                  			<span class="screen-reader">3</span>
									</label> 
									<label for="play4" class="rating__item"> 
										<svg class="rating__star">
		                					<use xlink:href="#star"></use>
			                			</svg> 
			                 		 	<span class="screen-reader">4</span>
									</label> 
									<label for="play5" class="rating__item"> 
											<svg class="rating__star">
			                    				<use xlink:href="#star"></use>
			                      			</svg> 
			                      		<span class="screen-reader">5</span>
									</label>
	
								</div>
							</div>
						</div>
	
						<div class="row">
							<div class="left col-md-12">소통</div>
						</div>
						<div class="row">
							<div class="rate col-md-6">
		
								<div class="rating">
									<input type="radio" name="communication" class="rating__control screen-reader" id="communication1" value=2.0> 
									<input type="radio" name="communication" class="rating__control screen-reader" id="communication2" value=4.0> 
									<input type="radio" name="communication" class="rating__control screen-reader" id="communication3" value=6.0> 
									<input type="radio" name="communication" class="rating__control screen-reader" id="communication4" value=8.0> 
									<input type="radio" name="communication" class="rating__control screen-reader" id="communication5" value=10.0 checked> 
									
									<label for="communication1" class="rating__item"> 
										<svg class="rating__star">
											<use xlink:href="#star"></use>
										</svg> 
										<span class="screen-reader">1</span>
									</label> 
									<label for="communication2" class="rating__item"> 
										<svg class="rating__star">
											<use xlink:href="#star"></use>
										</svg> 
										<span class="screen-reader">2</span>
									</label> 
									<label for="communication3" class="rating__item"> 
										<svg class="rating__star">
											<use xlink:href="#star"></use>
										</svg> 
										<span class="screen-reader">3</span>
									</label> 
									<label for="communication4" class="rating__item"> 
										<svg class="rating__star">
											<use xlink:href="#star"></use>
										</svg> 
										<span class="screen-reader">4</span>
									</label> 
									<label for="communication5" class="rating__item"> 
										<svg class="rating__star">
											<use xlink:href="#star"></use>
										</svg> 
										<span class="screen-reader">5</span>
									</label>
								</div>
		
							</div>
						</div>
						
						<div class="clearfix">
							<h4 class="q">자세한 후기를 남겨주세요!</h4>
							<textarea id="insert"  name= "review" placeholder="펫시팅 후기를 남겨주세요"></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<input type="hidden" name= "bookingNo" value=>
						<input type="hidden" name= "reviewDate" value= sysdate>
						<button id="btnsub" type="submit">올리기</button>
					</div>
				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog-->
	</div>
	<!-- /.modal -->
	<svg xmlns="http://www.w3.org/2000/svg" style="display: none">
          <symbol id="star" viewBox="0 0 26 28">
            <path d="M26 10.109c0 .281-.203.547-.406.75l-5.672 5.531 1.344 7.812c.016.109.016.203.016.313 0 .406-.187.781-.641.781a1.27 1.27 0 0 1-.625-.187L13 21.422l-7.016 3.687c-.203.109-.406.187-.625.187-.453 0-.656-.375-.656-.781 0-.109.016-.203.031-.313l1.344-7.812L.39 10.859c-.187-.203-.391-.469-.391-.75 0-.469.484-.656.875-.719l7.844-1.141 3.516-7.109c.141-.297.406-.641.766-.641s.625.344.766.641l3.516 7.109 7.844 1.141c.375.063.875.25.875.719z" />
          </symbol>
      </svg>

</body>

</html>