<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<title>회원가입</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/member/JoinForm.js" charset="utf-8"></script>
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	
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
				<form class="login100-form validate-form p-l-55 p-r-55 p-t-178" action="${pageContext.request.contextPath}/JoinController" method=post name=form id=form  onsubmit="return formCheck()">
					<span class="login100-form-title">
						회원가입
					</span>
					
					<div class="form-group">
						<label>아이디</label>
						<input type=text class="form-control" placeholder="아이디를 입력하세요" name=id id=id oninput='idCheck()'>				
						<div class="alert alert-danger collapse" role="alert" style=width:300px id=alertid>
							<span id="idcheck"></span>
						</div>
				  	</div>
				  	
				  	<div class="form-group">
						<label>비밀번호</label>
						<input type=password class="form-control" placeholder="비밀번호를 입력하세요" maxlength=20 name=pwd id=pwd oninput='pwdCheck()'>
						<div class="alert alert-danger collapse" role="alert" style="width:300px" id=alertpwd>
							<span id="pwdcheck"></span>
						</div>
				  	</div>
					<div class="form-group">
						<label>비밀번호 확인</label>
						<input type=password class="form-control" placeholder="비밀번호를 재입력하세요" maxlength=20 name=pwd2 id=pwd2 oninput='pwdMatchCheck()'>
						<div class="alert alert-danger collapse" role="alert" style="width:300px" id=alertpwd2>
							<span id="pwdmatchcheck"></span>
						</div>	
					</div>
					<div class="form-group">
						<label>이름</label>
						<input type=text class="form-control" placeholder="이름을 입력하세요" name=name id=name>
					</div>
					<div class="form-group">
						<label>닉네임</label>
						<input type=text class="form-control" placeholder="닉네임을 입력하세요" name=nickname id=nickname oninput="nicknameCheck()">
						<div class="alert alert-danger collapse" role="alert" style=width:300px id=alertnickname>
							<span id="nicknamecheck"></span>
						</div>
					</div>
					<div class="form-group">
						<label>생년월일</label>
						<div class="form-inline">
							<select class="form-control" style=width:90px name=birthyear>
								<c:forEach var="i" begin="0" end="120"><option>${2020-i}</option></c:forEach>	
							</select>
							<label>년</label>
							<select class="form-control" style=width:80px name=birthmonth>
								<c:forEach var="i" begin="1" end="12"><option>${i}</option></c:forEach>
							</select> 
							<label>월</label>
							<select class="form-control" style=width:80px name=birthday>
								<c:forEach var="i" begin="1" end="31"><option>${i}</option></c:forEach>
							</select>
							<label>일</label>
						</div>
					</div>
					<div class="form-group">
						<label>성별</label>
						<select class="form-control" name=gender>
							<option>남</option>
							<option>여</option>
						</select>
					</div>
					<div class="form-group">
						<label>주소</label>
						<div class="form-inline">
							<input class="form-control" type=text name=roadAddrPart1 id=roadAddrPart1 readonly>
							<input class="btn btn-primary" type=button value=주소검색 onclick="goPopup()">
						</div>
					</div>
					<div class="form-group">
						<label>상세주소</label>
						<input class="form-control" type=text name="addrDetail" id="addrDetail" readonly>
					</div>
					<div class="form-group">
						<label>휴대폰번호</label>
						<input class="form-control" type=text name=phone id=phone placeholder="숫자로만 입력해주세요" oninput='phoneCheck()'>
					</div>
					<div class="form-group">
						<label>이메일</label>
						<div class="form-inline">
							<input class="form-control" type=text name=email id=email placeholder="이메일 입력" oninput="emailCh()">
							<input class="btn btn-primary" type="button" id="emailbutton" value="인증코드전송" onclick='sendCode();' disabled>
						</div>
						<div class="alert alert-danger collapse" role="alert" style=width:230px id=alertemail>
							<span id="emailcheck"></span>
						</div>
					</div>
					<div class="form-group">
						<label>인증번호</label>
						<div class="form-inline">
							<input class="form-control" type=text placeholder="인증번호입력" id=code>
							<input class="btn btn-primary" type="button" value="확인" onclick='codeCheck()'>
						</div>
						<div class="alert alert-danger collapse" role="alert" style="width:300px" id=alertcode>
							<span id="codetimer"></span>
						</div>	
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
					<div class="container-login100-form-btn">	
						<input class="login100-form-btn" type=submit value=회원가입>
					</div>
					<div class="container-login100-form-btn">	
						<input class="login100-form-btn" style="margin-top:10px" type=button value=로그인화면으로 onclick="location.href='${pageContext.request.contextPath}/member/LoginForm.jsp'">
					</div>
			
					
				</form>
			</div>
		</div>
	</div>
	
	<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath}/member/loginstyle/vendor/jquery/jquery-3.2.1.min.js"></script>
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