<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html >
<head>
	<meta charset="UTF-8">
	<title>내 일정 관리</title>
	  
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
	
	  
	<!-- 폰트 -->
	<link href="${pageContext.request.contextPath}/AdminPage/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/main/Main.css">
	<link href="${pageContext.request.contextPath}/AdminPage/css/sb-admin-2.min.css" rel="stylesheet">
	
	<!-- datepicker -->
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-datepicker.standalone.min.css">
	  
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<link rel='stylesheet prefetch' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css'>
	
	
	<script type="text/javascript" charset="UTF-8">
		var baseUrl = window.location.protocol + "//" + window.location.hostname + (window.location.port ? ':' + window.location.port: '') + "/project_J";
		/* SCRAPBOOK LIST BUTTON CLICK */
		function btn_scrapbook(mseq){
		   if(mseq == null) alert("please login :)");
		   else{
		      $("#scrapbook_list").empty();
		      
		      $.ajax({
		         type:"POST",
		         url: baseUrl+"/ListScrapController",
		         data: {mseq:mseq},
		         datatype: "JSON",
		         contenttype: "application/json; application/x-www-form-urlencoded; charset=utf-8",
		         success: function(obj){
		            var size = Object.keys(JSON.parse(obj)).length;         
		            var result = Object.values(JSON.parse(obj));         
		            
		            for(var idx = 0; idx < size; idx++){
		               var name = result[idx].name.toString();
		               var start = result[idx].start.toString();
		               var end = result[idx].end.toString();
		               var link = result[idx].link.toString();
		
		               var period = start + "~" + end;
		
		               var total = 
		                  "<a class=\"dropdown-item d-flex align-items-center\" href=\"" + link +"\">" +
		                    "<div class=\"mr-3\">" +
		                      "<div class=\"icon-circle bg-success\">" + 
		                        "<i class=\"fas fa-donate text-white\"></i>" + 
		                      "</div>" +
		                    "</div>" +
		                   "<div>" +
		                      "<div class=\"small text-gray-500\">" + period + "</div>" +
		                      name +
		                    "</div>" +
		                  "</a>";
		               
		               $("#scrapbook_list").append(total);  
		            }
		         },
		         error: function(e){
		            alert("err");
		         }
		      });
		   }      
		}
		
		/* SCRAP BUTTON CLICK */
		function btn_scrap(mseq, pseq, num){
		   console.log("id num:" + num);
		   var com = document.getElementById("scrap_img_" + num);
		   
		   var count = "";
		   var path = baseUrl+"/AddScrapController";
		   
		   if(com.className == "far fa-bell"){   // 스크랩에 공고추가
		      com.className = "fas fa-bell";
		   }
		   else{                        // 스크랩에 공고제거
		      com.className = "far fa-bell";
		      path = "DelScrapController";
		   }
		   
		   $.ajax({
		      type:"POST",
		      url: path,
		      data: {mseq:mseq, pseq:pseq},
		      datatype: "JSON",      
		      contenttype: "application/json; application/x-www-form-urlencoded; charset=utf-8",
		      success: function(obj){
		         count = JSON.parse(obj).count;
		         console.log(count);
		      
		         $("#scrap_count").empty();
		         $("#scrap_count").append(count.toString());
		      },
		      error: function(e){
		         alert("err");
		      }
		   });
		}
		
		</script>

</head>

<body id="page-top">
<c:set var="path" value="http://192.168.0.14:8081/"/>


<!-- Page Wrapper -->
<div id="wrapper">
    
    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-danger sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/ListPostController?id=0">
        <div class="sidebar-brand-text mx-3">GO!</div>
      </a>

      <!-- 가로줄 -->
      <hr class="sidebar-divider my-0">
	  <c:if test="${not empty userinfo}">
	      <!-- Nav Item: 프로필섹션 -->
	      <li class="nav-item" style="text-align:center">
	        <a href="">Welcome, ${userinfo.nickname}</a>
	        <a><img src="${pageContext.request.contextPath}/image/noimage.png" id=pro width="60%" height="75%"></a>
	      </li>
      </c:if>
      <c:if test="${empty userinfo}">
	      <!-- Nav Item: 프로필섹션 -->
	      <li class="nav-item" style="text-align:center">
	        <input class="btn btn-primary" type=button value=로그인 onclick="location.href='${pageContext.request.contextPath}/member/LoginForm.jsp'">
	      </li>
      </c:if>

      <!-- 가로줄  -->
      <hr class="sidebar-divider">

      <!-- Nav Item: 마이 인포 -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/MyInfoController">
          <i class="fa fa-fw fa-home"></i>
          <span>내정보</span>
        </a>
      </li>
      
      <!-- Nav Item: 마이 스케쥴 -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/calendar2/calendar2.jsp">
          <i class="fa fa-fw fa-wrench"></i>
          <span>내 스케쥴러</span>
        </a>
      </li>
      
      <!-- Nav Item: 스터디그룹 -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/myInfo.jsp">
          <i class="fa fa-fw fa-envelope"></i>
          <span>스터디 그룹</span>
        </a>
      </li>
      
      <!-- 가로줄 -->
      <hr class="sidebar-divider d-none d-md-block">
      
     <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link" href="" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fa fa-fw fa-user"></i>
          <span>커뮤니티</span>
         </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h3 class="collapse-header">지역:</h3>
            <a class="collapse-item" href='${pageContext.request.contextPath }/ListController?board_code=a&pageNum=1'>수도권</a>
            <a class="collapse-item" href='${pageContext.request.contextPath }/ListController?board_code=b&pageNum=1'>비수도권</a>
            <div class="collapse-divider"></div>
            <h6 class="collapse-header">전공:</h6>
            <a class="collapse-item" href='${pageContext.request.contextPath }/ListController?board_code=c&pageNum=1'>문과</a>
            <a class="collapse-item" href='${pageContext.request.contextPath }/ListController?board_code=d&pageNum=1'>이과</a>
            <h6 class="collapse-header">기타:</h6>
            <a class="collapse-item" href='${pageContext.request.contextPath }/ListController?board_code=e&pageNum=1'>자유게시판</a>
          </div>
        </div>
      </li>

      <!-- 가로줄 -->
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
			            <li class="nav-item dropdown no-arrow mx-1">
			              <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onClick="btn_scrapbook(${userinfo.num})">
			                <i class="fas fa-bell fa-fw"></i>
			                <!-- Counter - Alerts -->
			                <span class="badge badge-danger badge-counter" id="scrap_count">${sbCount}</span>
			              </a>
			              <!-- Dropdown - Alerts -->
			              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
			                <h6 class="dropdown-header">
			                  Scrapbook
			                </h6>
			                <div id="scrapbook_list">
			                	<!-- SCRAPBOOK LIST -->
			                </div>
			                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
			              </div>
			            </li>
			
			            <!-- Nav Item - Messages -->
			            <li class="nav-item dropdown no-arrow mx-1">
			              <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			                <i class="fas fa-envelope fa-fw"></i>
			                <!-- Counter - Messages -->
			                <span class="badge badge-danger badge-counter">7</span>
			              </a>
			              <!-- Dropdown - Messages -->
			              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
			                <h6 class="dropdown-header">
			                  Message Center
			                </h6>
			                <a class="dropdown-item d-flex align-items-center" href="#">
			                  <div class="dropdown-list-image mr-3">
			                    <img class="rounded-circle" src="http://source.unsplash.com/fn_BT9fwg_E/60x60" alt="">
			                    <div class="status-indicator bg-success"></div>
			                  </div>
			                  <div class="font-weight-bold">
			                    <div class="text-truncate">Hi there! I am wondering if you can help me with a problem I've been having.</div>
			                    <div class="small text-gray-500">Emily Fowler · 58m</div>
			                  </div>
			                </a>
			                <a class="dropdown-item d-flex align-items-center" href="#">
			                  <div class="dropdown-list-image mr-3">
			                    <img class="rounded-circle" src="https://source.unsplash.com/AU4VPcFN4LE/60x60" alt="">
			                    <div class="status-indicator"></div>
			                  </div>
			                  <div>
			                    <div class="text-truncate">I have the photos that you ordered last month, how would you like them sent to you?</div>
			                    <div class="small text-gray-500">Jae Chun · 1d</div>
			                  </div>
			                </a>
			                <a class="dropdown-item d-flex align-items-center" href="#">
			                  <div class="dropdown-list-image mr-3">
			                    <img class="rounded-circle" src="https://source.unsplash.com/CS2uCrpNzJY/60x60" alt="">
			                    <div class="status-indicator bg-warning"></div>
			                  </div>
			                  <div>
			                    <div class="text-truncate">Last month's report looks great, I am very happy with the progress so far, keep up the good work!</div>
			                    <div class="small text-gray-500">Morgan Alvarez · 2d</div>
			                  </div>
			                </a>
			                <a class="dropdown-item d-flex align-items-center" href="#">
			                  <div class="dropdown-list-image mr-3">
			                    <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="">
			                    <div class="status-indicator bg-success"></div>
			                  </div>
			                  <div>
			                    <div class="text-truncate">Am I a good boy? The reason I ask is because someone told me that people say this to all dogs, even if they aren't good...</div>
			                    <div class="small text-gray-500">Chicken the Dog · 2w</div>
			                  </div>
			                </a>
			                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
			              </div>
			            </li>
			
			            <div class="topbar-divider d-none d-sm-block"></div>
			
			            <!-- Nav Item - User Information -->
			            <li class="nav-item dropdown no-arrow">
			              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${userinfo.nickname}</span>
			                <img class="img-profile rounded-circle" src="${pageContext.request.contextPath}/image/noimage.png">
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
			                <a class="dropdown-item" id="modaler" href="#" data-toggle="modal" data-target="#logoutModal">
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

					<div class="row" >
						<div style="min-width:1500px;margin-left:100px">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">
										<c:if test="${board_code eq 'a'}">수도권</c:if>
										<c:if test="${board_code eq 'b'}">바수도권</c:if>
										<c:if test="${board_code eq 'c'}">문과</c:if>
										<c:if test="${board_code eq 'd'}">이과</c:if>
										<c:if test="${board_code eq 'e'}">자유게시판</c:if>
										&ensp;<font size='2pt'>게시판</font>
									</h6>
								</div>
								<div class="card-body">
									<!--Table-->
									<table class="table table-hover table-fixed">
									
									  <!--Table head-->
									  <thead>
									    <tr>
									      <th>글번호</th>
									      <th>제목</th>
									      <th>작성자</th>
									      <th>작성시간</th>
									      <th>조회수</th>
									      <th>추천수</th>
									    </tr>
									  </thead>
									  <!--Table head-->
									
									  <!--Table body-->
									  <tbody>
									  	<c:forEach var="b" items="${list}" >
										    <tr>
										      <td>${b.board_seq }</td>
										      <td><a style="color:black;" href="${pageContext.request.contextPath }/ReadController?board_seq=${b.board_seq}">${b.board_title}</a></td>
										      <td>${b.board_writer}</td>
										      <td>${b.board_sysdate }</td>
										      <td>${b.board_view}</td>
										      <td>${b.board_like-b.board_unlike }</td>
										    </tr>
									    </c:forEach>
									  </tbody>
									  <!--Table body-->
									  <tr>
										<td colspan="5">
											<nav aria-label="Page navigation">
											  <ul class="pagination">
											    <li class="page-item ${minpage_2}">
											      <a style="color:black;" class="page-link" href="${pageContext.request.contextPath }/ListController?board_code=${board_code}&pageNum=${pageNum-2}" aria-label="Previous"
											      aria-disabled="true">
											        <span aria-hidden="true">&laquo;</span>
											      </a>
											    </li>
											    <li class="page-item ${minpage_1}"><a style="color:black;" class="page-link" href="${pageContext.request.contextPath }/ListController?board_code=${board_code}&pageNum=${pageNum-1}"
											    aria-disabled="true">${pageNum-1}</a></li>
											    <li class="page-item"><a style="color:black;" class="page-link" href="${pageContext.request.contextPath }/ListController?board_code=${board_code}&pageNum=${pageNum}"
											    aria-disabled="true">${pageNum}</a></li>
											    <li class="page-item ${maxpage_1}"><a style="color:black;" class="page-link" href="${pageContext.request.contextPath }/ListController?board_code=${board_code}&pageNum=${pageNum+1}"
											    aria-disabled="true">${pageNum+1}</a></li>
											    <li class="page-item ${maxpage_2}">
											      <a style="color:black;" class="page-link" href="${pageContext.request.contextPath }/ListController?board_code=${board_code}&pageNum=${pageNum+2}" aria-label="Next"
											      aria-disabled="true">
											        <span aria-hidden="true">&raquo;</span>
											      </a>
											    </li>
											  </ul>
											</nav>
										</td>
										<td colspan="1" align="right">
											<a class="button" style="color:black;" href="${pageContext.request.contextPath}/ListToWriteBoardController?board_code=${board_code}">글작성</a>
										</td>
									</tr>
									
									</table>
									<!--Table-->
								
								
								
										
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
		
		<!-- Scroll to Top Button-->
		  <button type="button" style="display:none" class="btn btn-primary" id=calmodal data-toggle="modal" data-target="#calModal"></button>
		
		  <!-- Logout Modal-->
		  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		    <div class="modal-dialog" role="document">
		      <div class="modal-content">
		        <div class="modal-header">
		          <h5 class="modal-title" id="exampleModalLabel">정말 로그아웃 하시겠습니까?</h5>
		          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
		            <span aria-hidden="true">×</span>
		          </button>
		        </div>
		        <div class="modal-body">Logout 버튼을 누르시면 로그아웃하실 수 있습니다.</div>
		        <div class="modal-footer">
		          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
		          <a class="btn btn-primary" href="${pageContext.request.contextPath}/LogoutController">Logout</a>
		        </div>
		      </div>
		    </div>
		  </div>
		  
		  <!-- Calendar Form Modal-->
		  <div class="modal fade" id="calModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		    <div class="modal-dialog" role="document">
		      <div class="modal-content">
		        <div class="modal-header">
		          <h5 class="modal-title" id="exampleModalLabel">일정 추가</h5>
		          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
		            <span aria-hidden="true">×</span>
		          </button>
		        </div>
		        <div class="modal-body">
		        	<div class="row" >
						<form id=calpostform name=calpostform method=post action="${pageContext.request.contextPath}/AddCalendarController" style="margin-left:40px">
							<div class="form-group">
								<label for="calname"><b>일정명</b></label> 
								<input type=text class="form-control" id=calname name=calname placeholder="제목 입력">
							</div>
							<div class="form-group">
								<label for="calstart"><b>일정기간</b></label> 
								<div class="form-inline">
									<input type=text id="calstart" class="form-control" name=calstart style="width:150px" placeholder="시작일" />
									<div class="input-group-append" data-target="calstart" data-toggle="datepicker">
				                        <div class="input-group-text"><i class="fa fa-calendar" style="height:23px;text-align:center"></i></div>
				                    </div>
				                    <label style="margin-left:10px"><b>~</b></label>				
									<input type=text id="calend" class="form-control" name=calend style="margin-left:10px;width:150px" placeholder="종료일" />
									<div class="input-group-append" data-target="calend" data-toggle="datepicker">
				                        <div class="input-group-text"><i class="fa fa-calendar" style="height:23px;text-align:center"></i></div>
				                    </div>											
								</div>
							</div>
							<div class="form-group">
								<label for="calcontent"><b>일정내용</b></label> 
								<textarea class="form-control" style="resize:none" placeholder="내용을 입력해주세요" id=calcontent name=calcontent rows=4></textarea>
							</div>
							<div class="form-group">
								<div class="form-inline">
									<input class="btn btn-primary btn-lg btn-block" style="width:180px;margin:auto" type=submit value=일정추가>
									
								</div>
							</div>
						</form>
						
					</div>
		        
		        </div>
		        <div class="modal-footer">
		          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
		        </div>
		      </div>
		    </div>
		    
		    
		  </div>
		  

	
	<!-- Bootstrap core JavaScript-->
<%-- 	 <script src="${pageContext.request.contextPath}/AdminPage/vendor/jquery/jquery.min.js"></script> --%>
<!-- 	 <script src='http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js'></script> -->
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 
	 	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	 
	 
	 <script src="${pageContext.request.contextPath}/AdminPage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- 	 <script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script> -->
	 <script src='${pageContext.request.contextPath}/js/bootstrap.min.js'></script>
<%-- 	 <script src="${pageContext.request.contextPath}/AdminPage/vendor/bootstrap/js/bootstrap.min.js"></script> --%>
	 
	 <!-- 	DatePicker -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.7.0-RC3/js/bootstrap-datepicker.min.js"></script>
	 
	
	 <!-- Core plugin JavaScript-->
	 <script src="${pageContext.request.contextPath}/AdminPage/vendor/jquery-easing/jquery.easing.min.js"></script>
	
	 <!-- Custom scripts for all pages-->
	 <script src="${pageContext.request.contextPath}/AdminPage/js/sb-admin-2.min.js"></script>
	
	     
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
	
	
</body>
</html> 
