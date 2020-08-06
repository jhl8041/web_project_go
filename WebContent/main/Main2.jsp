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

<!-- {"bad":"0","good":"1"} -->
<!-- {"list_0":"hello 나를 뽑아주는 곳은 어디에ㅠㅠ(2020-08-05)","list_2":"hello 나를 뽑아주는 곳은 어디에ㅠㅠ(2020-08-05)","list_1":"hello 우울할 땐 라면:)(2020-08-05)"} -->
<!-- {"list_0":"hello: 나를 뽑아주는 곳은 어디에ㅠㅠ(2020-08-05)","list_2":"hello: 나를 뽑아주는 곳은 어디에ㅠㅠ(2020-08-05)","list_1":"hello: 우울할 땐 라면:)(2020-08-05)"} -->

<script type="text/javascript">
	function btn_comment(seq, num){
		var com = document.getElementById("comment_display_" + num);
		
		var myObject;
		
		if(com.style.display == 'none') {
			com.style.display = 'block';
			
			var result = "";
			$.ajax({
				type:"POST",
				url: "ListCommentController",
				data: {seq:seq},
				contenttype: "application/json; charset=utf-8",
				datatype: "JSON",
				success: function(obj){
					var count = Object.keys(JSON.parse(obj)).length;
					//var key = alert(Object.keys(JSON.parse(obj))[0]); 
					//var value = alert(Object.values(JSON.parse(obj))[0]);
					
					for(var idx = 0; idx < count; idx++){
						var value = Object.values(JSON.parse(obj))[idx];
						result += value;
						result += "<br>";

					}
					$("#comments_"+num).append(result);
/* 					alert(result);
					$("#comment_display_"+num).after(result); */

/* 					$("#comment_"+seq).val(result.toString()); */
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
/* 				$("#postDislike_"+seq).val(JSON.parse(obj).bad.toString()); */
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
				alert("에러발생");
			}
		});
	}
</script>
<style>

body {font-family: "Lato", sans-serif;}

.sidebar {
  height: 100%;
  width: 350px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #ff4444;
  overflow-x: hidden;
  padding-top: 5%;
}

.navbar{
	background-color: #ff4444;
}

.navbar-brand{
	font-size: 40px;
}

.sidebar a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 20px;
  color: #ffffff;
  display: block;
}

.sidebar a:hover {
  color: #f1f1f1;
}

.main {
  margin-left: 350px; /* Same as the width of the sidenav */
  padding: 0px 10px;
  margin-top: 85px;
}

.card{
	background-color: #ffff44;
}

.carousel{
	height: 20%;
}

img{
	margin:auto;
	display:block;
}

@media screen and (max-height: 450px) {
  .sidebar {padding-top: 15px;}
  .sidebar a {font-size: 18px;}
}
</style>
</head>
<body>

<c:set var="path" value="http://192.168.0.14:8081/"/>

<div class="sidebar">
  <br><a href="">Welcome, ${userinfo.nickname}</a>
  <a><img src="image/noimage.png" width="250" height="250"></a>
<!--   <a href="myInfo.jsp"><i class="fa fa-fw fa-home"></i> My Info</a> -->
  <a href="mySchedule.jsp"><i class="fa fa-fw fa-wrench"></i> My Schedule</a>
  <a href="community.jsp"><i class="fa fa-fw fa-user"></i> Community</a>
  <a href="studyGroup.jsp"><i class="fa fa-fw fa-envelope"></i> Study Group</a>
  <br><br>
  <a><img src="image/image15.jpg" width="250" height="250"></a>
  <a><center> 안녕하세요!!! </center></a>
</div>

<!-- NAV BAR -->
<nav class="navbar fixed-top navbar-light">
	<a href="#" class="navbar-brand text-white">GO!</a>
	<button class="navbar-toggler" data-toggle="collapse" data-target="#navbarMenu">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarMenu">
		<ul class="navbar-nav">
			<li class="nav-item">
				<a href="${pageContext.request.contextPath }/LogoutController" class="nav-link text-white">logout</a>
			</li>
			<li class="nav-item">
				<a href="${pageContext.request.contextPath}/MyInfoController" class="nav-link text-white">edit my info</a>
			</li>
		</ul>
	</div>
</nav>

<div class="main">
		<!-- CAROUSE -->
		<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="image/bg2.jpg" class="d-block w-50">
		    </div>
		    <div class="carousel-item">
		      <img src="image/bg2.jpg" class="d-block w-50">
		    </div>
		    <div class="carousel-item">
		      <img src="image/bg2.jpg" class="d-block w-50">
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
		<br>

		<div class="row">
			<div class="col-lg-2">				
	        </div>
			<div class="col-lg-4">	
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

		<div class="row">		
<!-- 			<div class="col-lg-1>"></div> -->
	        <div class="col-lg-2">

<!-- 				<ul class="list-group" style="width:8rem; height:8rem; padding:0px; margin:0px; border:0px; position:fixed; margin-left:100px;">
				  <li class="list-group-item active">
		  	        <button type="button" class="btn btn-default">
						<i class='fas fa-address-book' style="font-size:50px;"></i>
					</button>		  
				  </li>
				  <li class="list-group-item ">
		  	        <button type="button" class="btn btn-default">
						<i class='fas fa-bell' style="font-size:50px;"></i>
					</button>		  
				  </li>
				  <li class="list-group-item active">
		  	        <button type="button" class="btn btn-default">
						<i class='fas fa-book' style="font-size:50px;"></i>
					</button>		  
				  </li>
				  <li class="list-group-item ">
		  	        <button type="button" class="btn btn-default">
						<i class='fas fa-calendar-times' style="font-size:50px;"></i>
					</button>		  
				  </li>
				</ul> -->
	        </div>
	       
	        <div class="col-lg-4">	
	        
			<!-- CARD -->
			<c:forEach var="p" items="${posts}" varStatus="status">
			<div class="card" style="width: 50rem;  margin: auto;">
				<div class="card-header text-white">
					<div class="container">
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
				  
  	 			  <div class="card-footer" id='comment_display_${status.count}' style="margin:auto; display:none;">	
	 				<table>
	 					<tr>
	 						<td colspan="2" id='comments_${status.count}' style="color:white;">
								<!-- 댓글 -->
	 						</td>
	 					</tr>
	 					<tr>
	 						<td><textarea cols="80rem" placeholder="writing..."></textarea></td>
	 						<td><button type="button" class="btn btn-dark btn-lg" style="font-size:24px;">write</button></td>	
	 					</tr>

	 				</table>
	 			 </div>
			</div>
			<br>
			</c:forEach>

			</div>
			<div class="col-lg-3"></div>
	        <div class="col-lg-2">				
				<div class="card" style="width:20rem; position:fixed; height:45%;">
					<div class="card-header text-white" style="font-size:36px;">
							ScrapBook
					</div>
					
				    <ul style="width:20rem; overflow:auto; padding:0px; margin:0px; border:0px;"> 			

					<%
					for(int i = 0; i < 10; i++){
					%>

			   			<li class="list-group-item">
			   			 	<div class="container">
							  <div class="row">
							    <div class="col-sm">
									Company Name
							    </div>
							    <div class="col-sm">
									<button type="button" class="btn btn-default" style="margin-left:90%;">
										<i class='fa fa-close'></i>
									</button>
							    </div>
							  </div>
							</div>
			   			 </li>
		   			 <%
					}
		   			 %>
					</ul>
				</div>
			</div>
		</div>
	</div>
	
	<script>

	</script>
     
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html> 
