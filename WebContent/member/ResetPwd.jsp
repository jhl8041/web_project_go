<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<script charset="utf-8">

var baseUrl = window.location.protocol + "//" + window.location.hostname + (window.location.port ? ':' + window.location.port: '') + "/project_J";
function resetPwd(){
    var idStr = $("#id").val();
    var nameStr = $("#name").val();
    var birthyearStr = $("#birthyear").val();
    var birthmonthStr = $("#birthmonth").val();
    var birthdayStr = $("#birthday").val();
    var emailStr = $("#email").val();
    
    $.ajax({
        url : baseUrl +"/SendNewPwdController",
        type : "POST",
        data : {id:idStr, email:emailStr, name:nameStr, birthyear:birthyearStr,
        		birthmonth:birthmonthStr, birthday:birthdayStr},
        success : function(data){ 
        	if(data == "fail"){
        		document.getElementById("alertlostpwd").className="alert alert-danger";
        		$("#alertlostpwd").show();
        		$("#lostpwd").text("정보와 일치하는 계정이 존재하지 않습니다");
        	}
        	else{
        		document.getElementById("alertlostpwd").className="alert alert-success";
        		$("#alertlostpwd").show();  		
        		$("#lostpwd").text("비밀번호 재설정 이메일이 성공적으로 전송됐습니다");
        	}
        	
        }
    });
}
</script>

<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css"> --%>
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/member/loginstyle/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/member/loginstyle/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/member/loginstyle/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/member/loginstyle/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/member/loginstyle/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/member/loginstyle/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/member/loginstyle/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/member/loginstyle/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/member/loginstyle/css/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/member/loginstyle/css/main.css">
<!--===============================================================================================-->

</head>

<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form p-l-55 p-r-55 p-t-178" action="#" method=post name=form id=form>
					<span class="login100-form-title">
						비밀번호 재설정
					</span>

					<div class="form-group">
						<label>아이디</label>
						<input type=text class="form-control" placeholder="아이디를 입력하세요" name=id id=id>				
				  	</div>
				  	<div class="form-group">
						<label>이름</label>
						<input type=text class="form-control" placeholder="이름을 입력하세요" maxlength=20 name=name id=name>
				  	</div>
				  	<div class="form-group">
						<label>생년월일</label>
						<div class="form-inline">
							<select class="form-control" style=width:90px name=birthyear id=birthyear>
								<c:forEach var="i" begin="0" end="120"><option>${2020-i}</option></c:forEach>	
							</select>
							<label>년</label>
							<select class="form-control" style=width:80px name=birthmonth id=birthmonth>
								<c:forEach var="i" begin="1" end="12"><option>${i}</option></c:forEach>
							</select> 
							<label>월</label>
							<select class="form-control" style=width:80px name=birthday id=birthday>
								<c:forEach var="i" begin="1" end="31"><option>${i}</option></c:forEach>
							</select>
							<label>일</label>
						</div>
				  	</div>
				  	<div class="form-group">
						<label>이메일</label>
						<input type=text class="form-control" placeholder="이메일을 입력하세요" name=email id=email>				
				  	</div>
				  	<div class="alert alert-danger collapse" role="alert" style=width:300px id=alertlostpwd>
						<span id="lostpwd"></span>
					</div>
				  	
				  	<div class="container-login100-form-btn">
				  		<input class="login100-form-btn" style="margin-top:10px" type=button value="비밀번호 재설정" onclick="resetPwd()">
				  	</div>
				  	<div class="container-login100-form-btn">
				  		<input class="login100-form-btn" style="margin-top:10px" type=button value="아이디 찾기" onclick="location.href='${pageContext.request.contextPath}/member/FindIdForm.jsp'">
				  	</div>
				  	<div class="container-login100-form-btn">
				  		<input class="login100-form-btn" style="margin-top:10px;margin-bottom:30px" type=button value=로그인화면으로 onclick="location.href='${pageContext.request.contextPath}/member/LoginForm.jsp'">
				  	</div>
				</form>
			</div>
		</div>
	</div>

<!--===============================================================================================-->
<%-- 	<script src="${pageContext.request.contextPath}/member/loginstyle/vendor/jquery/jquery-3.2.1.min.js"></script> --%>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/member/loginstyle/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/member/loginstyle/vendor/bootstrap/js/popper.js"></script>
	<script src="${pageContext.request.contextPath}/member/loginstyle/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/member/loginstyle/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/member/loginstyle/vendor/daterangepicker/moment.min.js"></script>
	<script src="${pageContext.request.contextPath}/member/loginstyle/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/member/loginstyle/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/member/loginstyle/js/main.js"></script>

</body>
</html>