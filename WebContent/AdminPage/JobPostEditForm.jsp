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
	<script src="${pageContext.request.contextPath}/AdminPage/js/JobPostEditForm.js" charset="utf-8"></script>

</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-danger sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/AdminPage/AdminPage.jsp">
        <div class="sidebar-brand-text mx-3">GO! 관리자페이지</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item">
        <a class="nav-link" href="${pageContext.request.contextPath}/AdminPage/AdminPage.jsp">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>대시보드</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
      	관리목록
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item active">
        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/ListJobPostController">
          <i class="fas fa-fw fa-cog"></i>
          <span>공고관리</span>
        </a>
      </li>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/MemberListController">
          <i class="fas fa-fw fa-cog"></i>
          <span>회원관리</span>
        </a>
      </li>

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
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Search -->
          <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
            <div class="input-group">
              <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
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
            <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">관리자</span>
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  Settings
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                  Activity Log
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">공고 관리</h1>
					</div>
					
					<!-- 공고 추가/수정 카드 시작 -->
					<div class="row" >
						<div class="col-5" style="min-width:680px">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">공고 추가/수정</h6>
								</div>
								<div class="card-body">		
								<form id=jobpostform name=jobpostform method=post enctype="multipart/form-data">
									<div class="form-group">
										<label for="postname"><b>공고번호</b></label> 
										<input type=text class="form-control" id=postnum name=postnum placeholder="공고번호 (새로추가시 자동으로 매겨짐)" readonly>
									</div>	
									<div class="form-group">
										<label for="postname"><b>기업명</b></label> 
										<input type=text class="form-control" id=postcorpname name=postcorpname placeholder="기업명을 입력하세요">
									</div>	
									<div class="form-group">
										<label for="postname"><b>공고명</b></label> 
										<input type=text class="form-control" id=postname name=postname placeholder="공고명을 입력하세요">
									</div>
									<div class="form-group">
										<label for="poststart"><b>공고기간</b></label> 
										<div class="form-inline">
											<input type=text id="poststart" class="form-control" name=poststart width="200" placeholder="공고시작일" />
											<div class="input-group-append" data-target="#poststart" data-toggle="datepicker">
						                        <div class="input-group-text"><i class="fa fa-calendar" style="height:23px;text-align:center"></i></div>
						                    </div>
						                    <label style="margin-left:10px"><b>~</b></label>				
											<input type=text id="postend" class="form-control" name=postend style="margin-left:10px;" width="200" placeholder="공고종료일" />
											<div class="input-group-append" data-target="#postend" data-toggle="datepicker">
						                        <div class="input-group-text"><i class="fa fa-calendar" style="height:23px;text-align:center"></i></div>
						                    </div>											
										</div>
									</div>
									<div class="form-group">
										<label for="posturl"><b>공고URL</b></label> 
										<input type=text class="form-control" id=posturl name=posturl placeholder="공고 URL을 입력하세요">
									</div>
									<div class="form-group">
										<label for="postimg"><b>공고이미지</b></label> 
										<input type="file" class="form-control-file" id=postimg name=postimg>
										<div class="form-group" style="text-align:center">
											<span><img style="max-width:500px" id=postimgshow alt="등록된 이미지가 없습니다" src="" onerror="this.src='${pageContext.request.contextPath}/image/noimg.png'"></span>
										</div>
									</div>
									<div class="form-group">
										<label for="posturl"><b>공고내용</b></label> 
										<textarea class="form-control" style="resize:none" placeholder="공고 내용을 입력해주세요" id=postcontent name=postcontent rows=4></textarea>
									</div>
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
									<div style="display:none">
										<input type=text id=like name=like readonly>
										<input type=text id=dislike name=dislike readonly>
										<input type=text id=view name=view readonly>
									</div>
									<div class="form-group">
										<div class="form-inline">
											<input class="btn btn-primary btn-lg btn-block" id=addpostbtn style="width:180px;margin:auto" type=button value=공고추가 onclick="addpost()">
											<input class="btn btn-primary btn-lg btn-block" style="width:180px;margin:auto" type=button value=공고수정 onclick="editpost()">	
											<input class="btn btn-success btn-lg btn-block" style="width:120px;margin:auto" type=reset value=클리어 onclick="clearImg()">
											<input class="btn btn-danger btn-lg btn-block" style="width:120px;margin:auto" type=button value=공고삭제 onclick="checkDel()">								
										</div>
									</div>
								</form>	
								</div>
							</div>
						</div>
						
						<div class="col-7" style="min-width:960px">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">공고 현황</h6>
								</div>
								<div class="card-body">
									<div class="table-responsive">
									  <table class="table table-hover table-sm align-middle" id="dataTable">
									        <thead>
									        <tr>
									        	<th>등록날짜</th>
									            <th>공고번호</th>
									            <th>기업명</th>
									            <th>공고명</th>
									            <th>공고기간</th>
									            <th>좋아요</th>
									            <th>싫어요</th>
									            <th>조회수</th>
									        </tr>
									        </thead>
									        <tbody>
										        <c:forEach var="jp" items="${list}">
											        <tr class='clickable-row' onclick="putToForm(${jp.num})">
											            <td>${jp.postAddDate}</td>
											            <td>${jp.num}</td>
											            <td>${jp.postCorpName}</td>
											            <td>${jp.postName}</td>
											            <td>${jp.postPeriodStart}~${jp.postPeriodEnd}</td>
											            <td>${jp.postLike}</td>
											            <td>${jp.postDislike}</td>
											            <td>${jp.postView}</td>
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
        $('#poststart').datepicker({
        	format: "yyyy/mm/dd"
        });
        $('#postend').datepicker({
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