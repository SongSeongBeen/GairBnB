<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>호스트관리</title>
    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/assets/css/admin.css" rel="stylesheet" type="text/css">
    <!-- Custom styles for this template-->
	<script src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
	<script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
</head>

<body>     

	<c:import url="/WEB-INF/view/includes/header.jsp"></c:import>
	
	<div id="wrap">
				
		<div id="container" class="clearfix">
		
			<!-- aside -->
            <c:import url="/WEB-INF/view/includes/aside.jsp"></c:import>
			
			<div id="content" >
				<div id="content-head">
					<div id="location">
						<ul>
							<li>예약관리</li>
							<li class="last">시팅관리</li>
						</ul>
					</div>
					<h1>시팅관리</h1>
				</div>
				
				<div id="content-main">
					   <!-- Begin Page Content -->
                <div class="container">


                    <!-- Content Row -->
                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center last_month">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                지난달 시팅액</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">900,000원</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center this_month">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                               	이번달 시팅액</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">1,900,000원</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row views_bar no-gutters align-items-center">
                                        <div class="col mr-2">
                                     
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">이달의 시팅수 : 40건</div>
                                                </div>
                                                <div class="col">
                                                    <div class="width640 progress progress-sm mr-2">
                                                        <div class="progress-bar bg-info" role="progressbar"
                                                            style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                    <!-- Content Row -->

                    <div class="row">

                        <!-- Area Chart -->
                        <div class="col-xl-8 col-lg-7">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">시팅 수/(월)</h6>
                                    <div class="dropdown no-arrow">
                                        <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                            aria-labelledby="dropdownMenuLink">
                                            <div class="dropdown-header">Dropdown Header:</div>
                                            <a class="dropdown-item" href="#">Action</a>
                                            <a class="dropdown-item" href="#">Another action</a>
                                            <div class="dropdown-divider"></div>
                                            <a class="dropdown-item" href="#">Something else here</a>
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        <canvas id="myAreaChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>             
                    </div>

                    <!-- Content Row -->
                    <div class="row">
                        <!-- Content Column -->
                        <div class="col-lg-6 mb-4">
                            <!-- Project Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="puppy m-0 font-weight-bold text-primary">퍼피력9.8</h6>
                                </div>
                                <div class="card-body">
                                    <h4 class="small font-weight-bold">식사 <span
                                            class="float-right">9.8</span></h4>
                                    <div class="width640 progress mb-4">
                                        <div class="progress-bar progress-bar-info" role="progressbar" style="width: 90%"
                                            aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">청결 <span
                                            class="float-right">9.8</span></h4>
                                    <div class="width640 progress mb-4">
                                        <div class="progress-bar progress-bar-success" role="progressbar" style="width: 90%"
                                            aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">산책 <span
                                            class="float-right">9.8</span></h4>
                                    <div class="width640 progress mb-4">
                                        <div class="progress-bar" role="progressbar" style="width: 90%"
                                            aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">놀이 <span
                                            class="float-right">9.8</span></h4>
                                    <div class="width640 progress mb-4">
                                        <div class="progress-bar progress-bar-warning" role="progressbar" style="width: 90%"
                                            aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">산책 <span
                                            class="float-right">9.8</span></h4>
                                    <div class="width640 progress mb-4">
                                        <div class="progress-bar progress-bar-danger" role="progressbar" style="width: 90%"
                                            aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>
                    	</div>
                   </div>
     			</div>
				
				
				</div>
				
			</div>
			
		</div>
	</div>


	
    
    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/assets/js/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/assets/js/admin.js"></script>

    <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath}/assets/js/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath}/assets/js/chart-area.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/chart-pie.js"></script>

</body>

</html>