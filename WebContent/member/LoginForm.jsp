<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>로그인페이지</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css">
</head>

<body>
<div class="d-flex justify-content-center">
		<form action="${pageContext.request.contextPath}/LoginController" method=post name=form id=form>
			<div class="form-group" style="text-align:center;margin-top:40%">
				<h1>로그인</h1>
			</div>
			<div class="form-group">
				<label>아이디</label>
				<input type=text class="form-control" placeholder="아이디를 입력하세요" name=id id=id>				
		  	</div>
		  	<div class="form-group">
				<label>비밀번호</label>
				<input type=password class="form-control" placeholder="비밀번호를 입력하세요" maxlength=20 name=pwd id=pwd>
		  	</div>
		  	<div class="form-group">
		  		<a href="${pageContext.request.contextPath}/FindIdForm.jsp">아이디 찾기</a>
		  		<a href="${pageContext.request.contextPath}/ResetPwd.jsp">비밀번호 재설정</a>
		  	</div>
		  	<div class="form-group">
		  		<input class="btn btn-primary btn-lg btn-block" style=width:300px type=submit value=로그인>
		  	</div>
		  	<div class="form-group">
		  		<input class="btn btn-primary btn-lg btn-block" style=width:300px type=button value=회원가입 onclick="location.href='${pageContext.request.contextPath}/JoinForm.jsp'">
		  	</div>
		  	<div class="form-group">
		  		<input class="btn btn-secondary btn-lg btn-block" style=width:300px type=button value=관리자로그인 onclick="location.href='${pageContext.request.contextPath}/AdminPage/AdminLoginForm.jsp'">
		  	</div>
		  	
	  	</form>
</div>
</body>
</html>