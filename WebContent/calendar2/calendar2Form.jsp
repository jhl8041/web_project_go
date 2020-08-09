<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>�������߰�������</title>
	
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
	<script src="${pageContext.request.contextPath}/calendar2/js/calendar2Form.js" charset="utf-8"></script>

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
					<span>��ú���</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading">�������</div>

			<!-- Nav Item - Pages Collapse Menu -->
		    <li class="nav-item active">
	        	<a class="nav-link collapsed" href="/project_J/ListJobPostController">
		          	<i class="fas fa-fw fa-cog"></i>
		          	<span>�������</span>
		        </a>
		    </li>

			<!-- Nav Item - Pages Collapse Menu -->
		     <li class="nav-item">
		        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/MemberListController">
		          	<i class="fas fa-fw fa-cog"></i>
		          	<span>ȸ������</span>
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
						<h1 class="h3 mb-0 text-gray-800">���� ����</h1>
					</div>
					
					<!-- ���� �߰�/���� ī�� ���� -->
					<div class="row" >
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">���� �߰�/����</h6>
								</div>
								<div class="card-body">		
								<form id=jobpostform name=jobpostform method=post action="${pageContext.request.contextPath}/AddCalendarController">
									<div class="form-group">
										<label for="calname"><b>������</b></label> 
										<input type=text class="form-control" id=calname name=calname placeholder="���� �Է�">
									</div>
									<div class="form-group">
										<label for="calstart"><b>�����Ⱓ</b></label> 
										<div class="form-inline">
											<input type=text id="calstart" class="form-control" name=calstart width="200" placeholder="������" />
											<div class="input-group-append" data-target="calstart" data-toggle="datepicker">
						                        <div class="input-group-text"><i class="fa fa-calendar" style="height:23px;text-align:center"></i></div>
						                    </div>
						                    <label style="margin-left:10px"><b>~</b></label>				
											<input type=text id="calend" class="form-control" name=calend style="margin-left:10px;" width="200" placeholder="������" />
											<div class="input-group-append" data-target="calend" data-toggle="datepicker">
						                        <div class="input-group-text"><i class="fa fa-calendar" style="height:23px;text-align:center"></i></div>
						                    </div>											
										</div>
									</div>
									<div class="form-group">
										<label for="calcontent"><b>��������</b></label> 
										<textarea class="form-control" style="resize:none" placeholder="������ �Է����ּ���" id=calcontent name=calcontent rows=4></textarea>
									</div>
									<div class="form-group">
										<div class="form-inline">
											<input class="btn btn-primary btn-lg btn-block" style="width:180px;margin:auto" type=submit value=�����߰�>
											
										</div>
									</div>
								</form>	
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
						<span aria-hidden="true">��</span>
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
        $('#calstart').datepicker({
        	format: "yyyy/mm/dd"
        });
        $('#calend').datepicker({
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