<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<!-- 폰트 -->
<link href="${pageContext.request.contextPath}/AdminPage/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/main/Main.css">
<link href="${pageContext.request.contextPath}/AdminPage/css/sb-admin-2.min.css" rel="stylesheet">

<script type="text/javascript">
	function btn_comment(seq, num){
		var com = document.getElementById("comment_display_" + num);
		
		var myObject;
		
		if(com.style.display == 'none') {
			com.style.display = 'block';
			
			var total = "";
			$.ajax({
				type:"POST",
				url: "ListCommentController",
				data: {seq:seq},
				contenttype: "application/json; charset=utf-8",
				
				datatype: "JSON",
				success: function(obj){
					var count = Object.keys(JSON.parse(obj)).length;	
					console.log(count);
					console.log(obj);
					var result = Object.values(JSON.parse(obj));			
					
 					for(var idx = 0; idx < count; idx++){
						var nickname = result[idx].nickname;
						var content = result[idx].content;
						var date = result[idx].date;
						
						var str = nickname + ": " + content + " (" + date + ")";
						console.log(str.toString());

						total += str;
						total += "<br>";
					}

					$("#comments_"+num).empty();
					$("#comments_"+num).append(total);
				},
				error: function(e){
					alert("error");
				}
			});	
		}
		else {
			com.style.display = 'none';
		}
	}
	
	function btn_good(state, seq){
		var com = document.getElementById("good_" + seq);
		var type = 0;
		
		if(state == "off") { // 버튼 active
			com.value = "on";
			type = 1;
		}
		else {				// 버튼 non-active
			com.value = "off";
			type = 2;
		}
	
		$.ajax({
			type:"POST",
			url: "LikeController",
			data: {seq:seq, type:type},
			datatype: "JSON",		
			contenttype: "application/json; charset=utf-8",
			success: function(obj){
				var result = "good: " + JSON.parse(obj).good.toString() + " bad: " + JSON.parse(obj).bad.toString();
				$("#postLike_"+seq).empty();
				$("#postLike_"+seq).append(result);
			},
			error: function(e){
				alert("error");
			}
		});	
	}	
	
	function btn_bad(state, seq){
		var com = document.getElementById("bad_" + seq);
		var type = 0;
		
		if(state == "off") { // 버튼 active
			com.value = "on";
			type = 3;
		}
		else {				// 버튼 non-active
			com.value = "off";
			type = 4;
		}
		
		$.ajax({
			type:"POST",
			url: "LikeController",
			data: {seq:seq, type:type},
			datatype: "JSON",		
			contenttype: "application/json; charset=utf-8",
			success: function(obj){
				var result = "good: " + JSON.parse(obj).good.toString() + " bad: " + JSON.parse(obj).bad.toString();
				$("#postLike_"+seq).empty();
				$("#postLike_"+seq).append(result);
			},
			error: function(e){
				alert("err");
			}
		});
	}
	
	function write_comment(pseq, mseq, num){
		var com = document.getElementById("comment_area_" + num);
		var comment = com.value;	
		var total = "";
		
 		$.ajax({
			type:"POST",
			url: "WriteCommentController",
			data: {pseq:pseq, mseq:mseq, content:comment},
			datatype: "JSON",
			contenttype: "application/json; application/x-www-form-urlencoded; charset=utf-8",
			
			success: function(obj){
				var count = Object.keys(JSON.parse(obj)).length;					
				var result = Object.values(JSON.parse(obj));			
				
					for(var idx = 0; idx < count; idx++){
					var nickname = result[idx].nickname;
					var content = result[idx].content;
					var date = result[idx].date;
					
					var str = nickname + ": " + content + " (" + date + ")";
					console.log(str.toString());

					total += str;
					total += "<br>";
				}

				$("#comments_"+num).empty();
				$("#comments_"+num).append(total);	
			},
			
			error: function(e){
				alert("err");
			}
		});

	 		
		document.getElementById("comment_area_" + num).value = "";
	}
	
	function btn_scrap(mseq, num){
		var com = document.getElementById( "scrap_img_" + num);
		
		if(com.className == "far fa-bell"){
			com.className = "fas fa-bell";
			
		}else{
			com.className = "far fa-bell";
		}
	}
	
	function btn_scrapbook(mseq){
		if(mseq == null) alert("please login :)");
		else{
			$("#scrapbook_list").empty();
			
			$.ajax({
				type:"POST",
				url: "ListScrapController",
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
					alert("에러발생");
				}
			});
		}		
	}
	
</script>

</head>
<body id="page-top">
<c:set var="path" value="http://192.168.0.14:8081/"/>

<!-- NAV BAR -->
<!-- <nav class="navbar fixed-top navbar-light"> -->
<!-- 	<a href="#" class="navbar-brand text-white">GO!</a> -->
<!-- 	<button class="navbar-toggler" data-toggle="collapse" data-target="#navbarMenu"> -->
<!-- 		<span class="navbar-toggler-icon"></span> -->
<!-- 	</button> -->
<!-- 	<div class="collapse navbar-collapse" id="navbarMenu"> -->
<!-- 		<ul class="navbar-nav"> -->
<!-- 			<li class="nav-item"> -->
<%-- 				<a href="${pageContext.request.contextPath }/LogoutController" class="nav-link text-white">logout</a> --%>
<!-- 			</li> -->
<!-- 			<li class="nav-item"> -->
<%-- 				<a href="${pageContext.request.contextPath}/MyInfoController" class="nav-link text-white">edit my info</a> --%>
<!-- 			</li> -->
<!-- 		</ul> -->
<!-- 	</div> -->
<!-- </nav> -->

<!-- Page Wrapper -->
<div id="wrapper">
    
    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-danger sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath}/AdminPage/AdminPage.jsp">
        <div class="sidebar-brand-text mx-3">GO!</div>
      </a>

      <!-- 가로줄 -->
      <hr class="sidebar-divider my-0">
	  <c:if test="${not empty userinfo}">
	      <!-- Nav Item: 프로필섹션 -->
	      <li class="nav-item" style="text-align:center">
	        <a href="">Welcome, ${userinfo.nickname}</a>
	        <a><img src="image/noimage.png" id=pro width="60%" height="75%"></a>
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
          <span>My Info</span>
        </a>
      </li>
      
      <!-- Nav Item: 마이 스케쥴 -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/myInfo.jsp">
          <i class="fa fa-fw fa-wrench"></i>
          <span>My Schedule</span>
        </a>
      </li>
      
      <!-- Nav Item: 커뮤니티 -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/myInfo.jsp">
          <i class="fa fa-fw fa-user"></i>
          <span>Community</span>
        </a>
      </li>
      
      <!-- Nav Item: 스터디그룹 -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="${pageContext.request.contextPath}/myInfo.jsp">
          <i class="fa fa-fw fa-envelope"></i>
          <span>Study Group</span>
        </a>
      </li>

      <!-- 가로줄 -->
      <hr class="sidebar-divider">

      <!-- Nav Item: 상태이미지/메세지 -->
      <li class="nav-item" style="text-align:center">
       	<a><img src="image/image15.jpg" width="90%" height="100%"></a>
       	<a class="text-white">ㄴr는ㄱr끔눙물을 흘린ㄷr..</a>
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

<!-- 						###################################################################################################### -->
<!-- 						###################################################################################################### -->
<!-- 						###################################################################################################### -->


						<!-- Nav Item - Alerts -->
			            <li class="nav-item dropdown no-arrow mx-1">
			              <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" onClick="btn_scrapbook(${userinfo.num})">
			                <i class="fas fa-bell fa-fw"></i>
			                <!-- Counter - Alerts -->
			                <span class="badge badge-danger badge-counter">${sbCount}</span>
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
			                <img class="img-profile rounded-circle" src="image/noimage.png">
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

					<div class="row justify-content-md-center" style="margin-bottom:30px">
						<!-- CAROUSE -->
						<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
						  	<div class="carousel-inner center">
							    <div class="carousel-item active">
							      	<img src="image/bg2.jpg" class="carousel-img-item">
							    </div>
							    <div class="carousel-item">
							      	<img src="image/bg2.jpg" class="carousel-img-item">
							    </div>
							    <div class="carousel-item">
							      	<img src="image/bg2.jpg" class="carousel-img-item">
							    </div>
						  	</div>
						  	<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
						    	<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						    	<span class="sr-only">Previous</span>
						  	</a>
						  	<a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
						    	<span class="carousel-control-next-icon" aria-hidden="true"></span>
						    	<span class="sr-only">Next</span>
						  	</a>
						</div>
					</div>
					
					<div class="row justify-content-md-center">
						<div style="min-width: 800px;">	
							<div style="width:50rem;">
								<!-- OPTION BUTTON -->
						    	<button id="btnGroupDrop1 " type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						      		지역별
						    	</button>
							    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
							      <a class="dropdown-item" href="#">전체보기</a>
							      <a class="dropdown-item" href="#">수도권</a>
							      <a class="dropdown-item" href="#">비수도권</a>
							    </div>
						
						    	<button id="btnGroupDrop2" type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						      		분야별
						    	</button>
							    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
							      <a class="dropdown-item" href="#">전체보기</a>
							      <a class="dropdown-item" href="#">공학계열</a>
							      <a class="dropdown-item" href="#">인문계열</a>
							    </div>
							</div>
						</div>
					</div>
					
					<!-- 공고 CARD -->
					<c:forEach var="p" items="${posts}" varStatus="status">
					<div class="row justify-content-md-center">
						<div class="card bg-danger shadow" style="min-width: 800px; margin-bottom: 50px;">
							<div class="card-header bg-danger py-3 text-white">
								  <div class="row">
								    <div class="col"><h3>${p.postCorpName}</h3></div>
								    <div class="col">
			   							<button type="button" class="btn btn-default" style="color:white; margin-left:85%;">
											<i class='far fa-bell' style="font-size:36px;"></i>
										</button>
								    </div>
								  </div>
								  <div class="row">
								  	<div class="col">
									  	<h5><!-- 기간 -->${p.postPeriodStart} ~ ${p.postPeriodEnd}</h5>
								  	</div>
								  </div>
							</div>
							
						  	<img src="${path}${p.postImg}" class="card-img-top" alt="..." style="height:45rem">
						  	<div class="card-body">				    
							    <div class="card-text" style="color:white;">
							    	<table id="ajaxLike_${status.count }">
							    		<tr>
							    			<td id="postLike_${p.num}" style="color:white;">
							    				good: ${p.postLike } bad: ${p.postDislike }
							    			</td>
							    		</tr>
							    		<tr>
							    			<td>${p.postContent}</td>
							    		</tr>
							    	</table>
						    	</div>
							  
							    <div class="btn-group btn-group-lg" role="group" aria-label="Basic example" style="margin:auto;"> 
								  <button type="button" class="btn btn-secondary" id="good_${p.num}" value="off" data-toggle="button" aria-pressed="false" onClick="btn_good(this.value, ${p.num});">Good <i class='far fa-grin'></i></button>
								  <button type="button" class="btn btn-secondary" data-toggle="button" aria-pressed="false" onClick="btn_comment(${p.num}, ${status.count});">Comment <i class='fas fa-comment-dots'></i></button>
								  <button type="button" class="btn btn-secondary" id="bad_${p.num}" value="off" data-toggle="button" aria-pressed="false" onClick="btn_bad(this.value, ${p.num});">Bad <i class='far fa-angry'></i></button>
								</div>
							    
							</div>
							  
			  	 			  <div class="card-footer bg-danger" id='comment_display_${status.count}' style="margin:auto; display:none;">	
				 				<table>
				 					<tr>
				 						<td colspan="2" id='comments_${status.count}' style="color:white;">
											<!-- 댓글 -->
				 						</td>
				 					</tr>
				 					<tr>
				 						<td><textarea cols="80rem" id="comment_area_${status.count }" placeholder="writing..."></textarea></td>
				 						<td><button type="button" class="btn btn-dark btn-lg" style="font-size:24px;" onClick="write_comment(${p.num}, ${userinfo.num}, ${status.count })">write</button></td>	
				 					</tr>
			
				 				</table>
				 			 </div>
						</div>
					</div>
				    </c:forEach>
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
		  <a class="scroll-to-top rounded" href="#page-top">
		    <i class="fas fa-angle-up"></i>
		  </a>
		
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
		
		
<!-- Bootstrap core JavaScript-->
 <script src="${pageContext.request.contextPath}/AdminPage/vendor/jquery/jquery.min.js"></script>
 <script src="${pageContext.request.contextPath}/AdminPage/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

 <!-- Core plugin JavaScript-->
 <script src="${pageContext.request.contextPath}/AdminPage/vendor/jquery-easing/jquery.easing.min.js"></script>

 <!-- Custom scripts for all pages-->
 <script src="${pageContext.request.contextPath}/AdminPage/js/sb-admin-2.min.js"></script>

     
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script> -->
<!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script> -->

</body>
</html> 
