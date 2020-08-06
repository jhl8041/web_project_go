<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>공고관리페이지</title>
	
	<!-- Custom fonts for this template-->
	<link href="${pageContext.request.contextPath}/AdminPage/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	
	<!-- Custom styles for this template-->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/AdminPage/css/sb-admin-2.min.css" >
	<link href="${pageContext.request.contextPath}/AdminPage/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<%-- 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"> --%>
	
	<!-- datepicker -->
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-datepicker.standalone.min.css">
	
	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/AdminPage/js/MemberPage.js" charset="utf-8"></script>

</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="navbar-nav bg-gradient-danger sidebar sidebar-dark accordion" id="accordionSidebar">

			<!-- Sidebar - Brand -->
		    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/AdminPage/AdminPage.jsp">
		        <div class="sidebar-brand-text mx-3">GO! Admin Page</div>
		    </a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/AdminPage/AdminPage.jsp"> <i class="fas fa-fw fa-tachometer-alt"></i>
					<span>대시보드</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">관리목록</div>

			<!-- Nav Item - Pages Collapse Menu -->
		    <li class="nav-item">
	        	<a class="nav-link collapsed" href="/project_J/ListJobPostController">
		          	<i class="fas fa-fw fa-cog"></i>
		          	<span>공고관리</span>
		        </a>
		    </li>

			<!-- Nav Item - Pages Collapse Menu -->
		     <li class="nav-item">
		        <a class="nav-link active" href="${pageContext.request.contextPath}/MemberListController">
		          	<i class="fas fa-fw fa-cog"></i>
		          	<span>회원관리</span>
		        </a>
		     </li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">Addons</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapsePages"
				aria-expanded="true" aria-controls="collapsePages"> <i
					class="fas fa-fw fa-folder"></i> <span>Pages</span>
			</a>
				<div id="collapsePages" class="collapse"
					aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Login Screens:</h6>
						<a class="collapse-item" href="login.html">Login</a> <a
							class="collapse-item" href="register.html">Register</a> <a
							class="collapse-item" href="forgot-password.html">Forgot
							Password</a>
						<div class="collapse-divider"></div>
						<h6 class="collapse-header">Other Pages:</h6>
						<a class="collapse-item" href="404.html">404 Page</a> <a
							class="collapse-item" href="blank.html">Blank Page</a>
					</div>
				</div></li>

			<!-- Nav Item - Charts -->
			<li class="nav-item"><a class="nav-link" href="charts.html">
					<i class="fas fa-fw fa-chart-area"></i> <span>Charts</span>
			</a></li>

			<!-- Nav Item - Tables -->
			<li class="nav-item"><a class="nav-link" href="tables.html">
					<i class="fas fa-fw fa-table"></i> <span>Tables</span>
			</a></li>

			<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<!-- Topbar Search -->
					<form
						class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
						<div class="input-group">
							<input type="text" class="form-control bg-light border-0 small"
								placeholder="Search for..." aria-label="Search"
								aria-describedby="basic-addon2">
							<div class="input-group-append">
								<button class="btn btn-primary" type="button">
									<i class="fas fa-search fa-sm"></i>
								</button>
							</div>
						</div>
					</form>

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<!-- Nav Item - Search Dropdown (Visible Only XS) -->
						<li class="nav-item dropdown no-arrow d-sm-none"><a
							class="nav-link dropdown-toggle" href="#" id="searchDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
								aria-labelledby="searchDropdown">
								<form class="form-inline mr-auto w-100 navbar-search">
									<div class="input-group">
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="Search for..." aria-label="Search"
											aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>
							</div></li>

						<!-- Nav Item - Alerts -->
				

						<div class="topbar-divider d-none d-sm-block"></div>

					</ul>

				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">회원 관리</h1>
					</div>
					
					<!-- 공고 추가/수정 카드 시작 -->
					<div class="row" >
						<div class="col-5" style="min-width:510px;max-width:510px">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">회원 추가/수정/탈퇴</h6>
								</div>
								<div class="card-body">		
								<form id=jobpostform name=jobpostform method=post>
									<table style="margin-right:0px">
									<tr>
										<td>
											<div class="form-group">
												<label for="id"><b>아이디</b></label> 
												<input type=text class="form-control" id=id name=id placeholder="아이디" readonly>
											</div>
										</td>
										<td>
											<div class="form-group" style="margin-left:5px">
												<label for="pwd"><b>비밀번호</b></label> 
												<input type=text class="form-control" id=pwd name=pwd placeholder="비밀번호">
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="form-group">
												<label for="name"><b>이름</b></label> 
												<input type=text class="form-control" id=name name=name placeholder="이름">
											</div>
										</td>
										<td>
											<div class="form-group" style="margin-left:5px">
												<label for="nickname"><b>닉네임</b></label> 
												<input type=text class="form-control" id=nickname name=nickname placeholder="닉네임">
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="form-group">
												<label for="phone"><b>휴대폰</b></label> 
												<input type=text class="form-control" id=phone name=phone placeholder="휴대폰번호">
											</div>
										</td>
										<td>
											<div class="form-group" style="margin-left:5px">
												<label for="birthdate"><b>생년월일</b></label> 
												<input type=text id="birthdate" class="form-control" name=birthdate width="200" placeholder="생년월일" />
												<div class="input-group-append" data-target="#birthdate" data-toggle="datepicker">
						                    	</div>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="form-group">
												<label>성별</label>
												<select class="form-control" name=gender id=gender>
													<option>남</option>
													<option>여</option>
												</select>
											</div>
										</td>
										<td>
											<div class="form-group">
												<label>이메일</label>
												<input class="form-control" type=text name=email id=email placeholder="이메일 입력">
											</div>
										</td>
									</tr>
									<tr>
										<td colspan=2>
											<div class="form-group">
												<label>주소</label>
												<input class="form-control" type=text name="address" id="address">
											</div>
										</td>
									</tr>
									<tr>
										<td colspan=2>
											<div class="form-group">
												<label><b>분류</b></label> 
												<div class="form-check" style="padding-left:0px">
													<div class="form-inline">
												  		<input class="form-check-input" type="checkbox" value="8" id="noneng" name="noneng">
												 		<label class="form-check-label" for="noneng">문과</label>
												  
												  		<input class="form-check-input" style="margin-left:20px" type="checkbox" value="4" id="eng" name="eng">
												  		<label class="form-check-label" for="eng">이과</label>
												  	</div>
												  	<div class="form-inline">
												  		<input class="form-check-input" type="checkbox" value="2" id="capital" name="capital">
												 		<label class="form-check-label" for="noneng">수도</label>
												  
												  		<input class="form-check-input" style="margin-left:20px" type="checkbox" name="noncapital" value="1" id="noncapital">
												  		<label class="form-check-label" for="eng">비수도</label>
												  	</div>
												</div>
											</div>
										</td>
									</tr>
									</table>	
									<div class="form-group">
										<div class="form-inline">
											<input class="btn btn-primary btn-lg btn-block" style="width:200px;margin:auto" type=button value=회원정보수정 onclick="editpost()">	
											<input class="btn btn-success btn-lg btn-block" style="width:120px;margin:auto" type=reset value=클리어 onclick="clearImg()">
											<input class="btn btn-danger btn-lg btn-block" style="width:120px;margin:auto" type=button value=회원삭제 onclick="checkDel()">								
										</div>
									</div>
								</form>	
								</div>
							</div>
						</div>
						
						<div class="col-7" style="min-width:1120px;max-width:1120px">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">공고 현황</h6>
								</div>
								<div class="card-body">
									<div class="table-responsive">
									  <table class="table table-hover table-sm align-middle" id="dataTable">
									        <thead>
									        <tr>
									        	<th>아이디</th>
									            <th>이름</th>
									            <th>닉네임</th>
									            <th>휴대폰</th>
									            <th>생년월일</th>
									            <th>이메일</th>
									            <th>성별</th>
									            <th>가입일</th>
									            <th>주소</th>
									            <th>분류코드</th>
									        </tr>
									        </thead>
									        <tbody>
										        <c:forEach var="m" items="${list}">
											        <tr class='clickable-row' onclick="putToForm(${m.num})">
											            <td>${m.id}</td>
											            <td>${m.name}</td>
											            <td>${m.nickname}</td>
											            <td>${m.phone}</td>
											            <td>${m.birthdate}</td>
											            <td>${m.email}</td>
											            <td>${m.gender}</td>
											            <td>${m.joinDate}</td>
											            <td>${m.address}</td>
											            <td>${m.prefCode}</td>
											        </tr>
										        </c:forEach>
									        <tbody>
									    </table>
									</div>
								</div>
							</div>
						</div>
						
					</div>
                    <!-- end of row -->

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2020</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- 	datepicker -->
	<script>									    
		
	$(function () {
        $('#birthdate').datepicker({
        	format: "yyyy/mm/dd"
        });
    });
	</script>

	<!-- Bootstrap core JavaScript-->
	<script src="${pageContext.request.contextPath}/AdminPage/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/AdminPage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="${pageContext.request.contextPath}/AdminPage/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="${pageContext.request.contextPath}/AdminPage/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script src="${pageContext.request.contextPath}/AdminPage/vendor/chart.js/Chart.min.js"></script>
	<script src="${pageContext.request.contextPath}/AdminPage/vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/AdminPage/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="${pageContext.request.contextPath}/AdminPage/js/demo/chart-area-demo.js"></script>
	<script src="${pageContext.request.contextPath}/AdminPage/js/demo/chart-pie-demo.js"></script>
	<script src="${pageContext.request.contextPath}/AdminPage/js/demo/datatables-demo.js"></script>
	
	<!-- 	DatePicker -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.0-RC3/js/bootstrap-datepicker.min.js"></script>
	
</body>
</html>