<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>로그인페이지</title>
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
				<form class="login100-form validate-form p-l-55 p-r-55 p-t-178" action="${pageContext.request.contextPath}/AdminLoginController" method=post name=form id=form>
					<span class="login100-form-title">
						관리자로그인
					</span>

					<div class="wrap-input100 validate-input m-b-16" data-validate="아이디를 입력하세요">
						<input class="input100" type="text" name=id id=id placeholder="아이디">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "비밀번호를 입력하세요">
						<input class="input100" type="password" name=pwd id=pwd placeholder="비밀번호">
						<span class="focus-input100"></span>
					</div>

					<div class="container-login100-form-btn">
						<input class="login100-form-btn" style="margin-top:10px" type=submit value=관리자로그인>
						<input class="login100-form-btn" style="margin-top:10px" type=button value=메인으로 onclick="location.href='${pageContext.request.contextPath}/ListPostController?id=0'">
						<input class="login100-form-btn2" style="margin-top:10px;" type=button value=일반로그인 onclick="location.href='${pageContext.request.contextPath}/member/LoginForm.jsp'">
					</div>

					<div class="flex-col-c p-t-170 p-b-40">
						<span class="txt1 p-b-9">
							관리자 페이지로 접속합니다
						</span>
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